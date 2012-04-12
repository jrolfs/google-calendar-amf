#!/usr/bin/env python
# encoding: utf-8
"""
echo_service.py

Created by Jamie on 2009-06-12.
Copyright (c) 2009 Jamie Rolfs. All rights reserved.
"""

import sys

class EchoService(object):
	"""
	Provide a simple service for testing.
	"""
	def echo(self, data):
		"""
		Return data with chevrons surrounding it.
		"""
		return '<<%s>>' % data