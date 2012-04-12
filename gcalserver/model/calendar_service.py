#!/usr/bin/env python
# encoding: utf-8
"""
calendar_service.py

Created by Jamie on 2009-06-12.
Copyright (c) 2009 Jamie Rolfs. All rights reserved.
"""

import sys

from google.appengine.ext import db

from gdata.calendar.service import CalendarService

class CalendarServiceProperty(db.Property):
	"""
	Custom Datastore property so CalenderService from Data API can be stored
	in the DataStore
	"""
	# Tell what the user type is.
	data_type = CalendarService

	# For writing to datastore.
	def get_value_for_datastore(self, model_instance):
		calender_service = super(CalendarServiceProperty,
									self).get_value_for_datastore(model_instance)
		return calender_service

	# For reading from datastore.
	def make_value_from_datastore(self, value):
		if value is None:
			return None
		return CalendarService( value )

	def empty(self, value):
		return not value

class CalendarServiceWrapper(db.Model):
	"""
	Model used to store an instance of CalendarService in the Datastore
	"""
	calendar_service = CalendarServiceProperty()
	username = db.StringProperty()