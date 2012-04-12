#!/usr/bin/env python
# encoding: utf-8
"""
authorization.py

Created by Jamie on 2009-06-13.
Copyright (c) 2009 Jamie Rolfs. All rights reserved.
"""

import sys
import os

from google.appengine.ext import db

class Authorization(db.Model):
	token = db.StringProperty(required=True)
	username = db.StringProperty(required=True)