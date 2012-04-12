import wsgiref.handlers

import pyamf
from pyamf import amf3
from pyamf.remoting.gateway.wsgi import WSGIGateway

from services.echo_service import EchoService
from services.login_service import LoginService
from services.user_service import UserService
from services.event_service import EventService

from model.login import Login
from model.user import User
from model.calendar_event import CalendarEvent

#: namespace used in the Adobe Flash Player client's [RemoteClass] mapping
AMF_NAMESPACE = 'com.realeyes.gcalamf.model.vo'

def register_classes():
	"""
	Register domain objects with PyAMF.
	"""
	# set this so returned objects and arrays are bindable
	#amf3.use_proxies_default = True

	# register domain objects that will be used with PyAMF
	pyamf.register_class(User, '%s.User' % AMF_NAMESPACE)
	pyamf.register_class(CalendarEvent, '%s.CalendarEvent' % AMF_NAMESPACE)
	pyamf.register_class(Login, '%s.Login' % AMF_NAMESPACE)
	
register_classes()

def main():
	"""
	Create a WSGIGateway application and serve it.
	"""
	# our gateway will have two services
	services = {
		'Echo': EchoService,
		'Login': LoginService,
		#'User': UserService,
		'Event': EventService
	}
	
	application = WSGIGateway(services)
	wsgiref.handlers.CGIHandler().run(application)

if __name__ == '__main__':
	main()