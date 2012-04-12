#!/usr/bin/env python
# encoding: utf-8
"""
login_service.py

Created by Jamie on 2009-06-12.
Copyright (c) 2009 Jamie Rolfs. All rights reserved.
"""

import sys
import logging

import gdata.service
from gdata.service import CaptchaRequired
from gdata.service import BadAuthentication
from gdata.service import Error
import gdata.alt.appengine
import gdata.calendar
import gdata.calendar.service

from model.authorization import Authorization
from model.login import Login

class LoginService(object):
	"""
	Service for logging into Google Calender Data API
	"""
	def __init__(self):
		super(LoginService, self).__init__()
		
	def login(self, params):
		"""
		Log into specified user's calender via Data API
		"""
		calendar_service = gdata.calendar.service.CalendarService()
		# Tell the service that we are running in single user mode, and it should not
		# automatically try to associate the token with the current user then store
		# it in the datastore.
		gdata.alt.appengine.run_on_appengine(calendar_service, store_tokens=False, 
			single_user_mode=True)
		
		calendar_service.email = params.username
		calendar_service.password = params.password
		
		try:
			calendar_service.ProgrammaticLogin()
		except CaptchaRequired:
			return Login(False, None, "CaptchaRequired")
		except BadAuthentication:
			return Login(False, None, "BadAuthentication")
		except Error:
			return Login(False, None, "Error")

		# Check if user has an old calendar service wrapper in the datastore,
		# if so then we update that one and use it, otherwise create a new one
		service_query = Authorization.gql('WHERE username = :1', calendar_service.email)
		service_result = service_query.fetch(1)

		token = calendar_service.GetClientLoginToken()

		if service_result:
			authorization = service_result[0]
			authorization.token = token
			authorization.username = calendar_service.email
		else:
			authorization = Authorization(token=token, username=calendar_service.email)

		return Login(True, str(authorization.put()))