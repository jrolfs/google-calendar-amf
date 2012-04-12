#!/usr/bin/env python
# encoding: utf-8
"""
event.py

Created by Jamie on 2009-06-12.
Copyright (c) 2009 Jamie Rolfs. All rights reserved.
"""

import sys

class CalendarEvent(object):
	def __init__(self, title=None, start=None, end=None, location=None,
					description=None, participants=None, updated=None ):
		self.title = title;
		self.start = start;
		self.end = end;
		self.location = location;
		self.description = description;
		self.participants = participants;
		self.updated = updated