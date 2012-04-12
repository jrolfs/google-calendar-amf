#!/usr/bin/env python
# encoding: utf-8
"""
event_service.py

Created by Jamie on 2009-06-12.
Copyright (c) 2009 Jamie Rolfs. All rights reserved.
"""

import sys
from datetime import datetime

import gdata.service
import gdata.alt.appengine
import gdata.calendar
import gdata.calendar.service

from google.appengine.ext import db

from pyamf.flex import ArrayCollection

from model.calendar_event import CalendarEvent
from model.user import User

DATETIME_ISO_STRING_FORMAT = "%Y-%m-%dT%H:%M:%S";
DATE_ISO_STRING_FORMAT = "%Y-%m-%d";

class EventService(object):
	"""
	Service that interfaces with Google Calender Data API
	"""
	def __init__(self):
		super(EventService, self).__init__()
		
	def get_events(self, params):
		"""
		Gets events from calendar
		"""
		calendar_service = gdata.calendar.service.CalendarService()
		# Tell the service that we are running in single user mode, and it should not
		# automatically try to associate the token with the current user then store
		# it in the datastore.
		gdata.alt.appengine.run_on_appengine(calendar_service, store_tokens=False, 
			single_user_mode=True)
			
		calendar_service.SetClientLoginToken(db.get(db.Key(params.key)).token)
		
		# Parse Atom entries into CalendarEvent value objects
		events = ArrayCollection()
		feed = calendar_service.GetCalendarEventFeed()
		for i, an_event in enumerate(feed.entry):
			event = CalendarEvent()
			event.title = an_event.title.text
			
			# Convert start/end ISO time values to datetime using a different 
			# format depending on whether the string contains time information
			start = an_event.when[0].start_time
			end = an_event.when[0].end_time
			if len(start) > 10:
				event.start = datetime.strptime(start[0:19], 
												DATETIME_ISO_STRING_FORMAT)
				event.end = datetime.strptime(end[0:19], 
												DATETIME_ISO_STRING_FORMAT)
			else:
				event.start = datetime.strptime(start, DATE_ISO_STRING_FORMAT)
				event.end = datetime.strptime(end, DATE_ISO_STRING_FORMAT)
				
			event.location = an_event.where[0].value_string
			event.description = an_event.content.text
			event.updated = datetime.strptime(an_event.updated.text[0:19], 
												DATETIME_ISO_STRING_FORMAT)
			
			# Create array collection of participants as User value objects
			participants = ArrayCollection()
			for p, a_participant in enumerate(an_event.who):
				participant = User()
				participant.name = a_participant.name
				participant.email = a_participant.email
				if a_participant.attendee_status:
					participant.attendeeStatus = a_participant.attendee_status.value
				participants.addItem( participant )
			event.participants = participants
			
			events.addItem(event)
			
		return events