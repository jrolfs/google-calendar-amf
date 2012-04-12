#!/usr/bin/env python
# encoding: utf-8
"""
user.py

Created by Jamie on 2009-06-12.
Copyright (c) 2009 Jamie Rolfs. All rights reserved.
"""

import sys

class User(object):
	"""
	Models information associated with a simple user object.
	"""
	# we need a default constructor (e.g. a paren-paren constructor)
	def __init__(self, userName=None, password=None, email=None, attendeeStatus=None):
		"""
		Create an instance of a user object.
		"""
		self.userName = userName
		self.password = password
		self.email = email
		self.attendeeStatus = attendeeStatus