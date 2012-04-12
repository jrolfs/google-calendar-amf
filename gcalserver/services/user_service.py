#!/usr/bin/env python
# encoding: utf-8
"""
user_service.py

Created by Jamie on 2009-06-12.
Copyright (c) 2009 Jamie Rolfs. All rights reserved.
"""

import sys

class UserService(object):
	"""
	Provide user related services.
	"""
	def __init__(self, users):
		"""
		Create an instance of the user service.
		"""
		self.users = users

	def get_user(self, username):
		"""
		Fetch a user object by C{username}.
		"""
		try:
			return self.users[username]
		except KeyError:
			return "Username '%s' not found" % username