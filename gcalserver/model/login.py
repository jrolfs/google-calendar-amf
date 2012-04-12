#!/usr/bin/env python
# encoding: utf-8
"""
login.py

Created by Jamie on 2009-06-12.
Copyright (c) 2009 __MyCompanyName__. All rights reserved.
"""

import sys

from google.appengine.ext import db

class Login(object):
	"""
	Value object that holds any credentials needed for a Google Calendar Data API session
	"""
	def __init__(self, success=False, key="", message=""):
		super(Login, self).__init__()
		self.success = success
		self.key = key
		self.message = message