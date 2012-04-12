////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2009 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.gcalamf.business.delegates
{
	import com.realeyes.business.REServiceManager;
	import com.realeyes.business.delegate.REDelegate;
	import com.realeyes.business.services.REDataEndpoint;
	import com.realeyes.gcalamf.business.GoogleCalendarAMFServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;

	/**
	 * LoadInitialConfigDelegate - delegate for the login service. Calls service and then translator on result
	 * @author	AG, RealEyes Media
	 * @version 1.0
	 */
	public class ConfigDelegate extends REDelegate
	{
		//-----------------------------------------------------------
		//	DECLARATIONS
		//-----------------------------------------------------------
		/**
		 * Defines the service manager
		 */
		private var _manager:REServiceManager;		
		
		/**
		 * Defines the service endpoint
		 */
		private var _endPoint:REDataEndpoint;
		
		/**
		 * The AsyncToken returned by a service call
		 */ 
		private var _token:AsyncToken; 
				
		//-----------------------------------------------------------
		//	INIT
		//-----------------------------------------------------------
		/**
		 * Constructor
		 */	
		public function ConfigDelegate( responder:IResponder )
		{
			super( responder );
			_manager = REServiceManager.getInstance();
			_endPoint = _manager.getDataEndpoint( GoogleCalendarAMFServiceLocator.GET_CONFIG_XML );
		}
		
		
		//-----------------------------------------------------------
		//	CONTROL METHODS
		//-----------------------------------------------------------	
		/**
		 * Calls the service 
		 * @param obj	the param to send to service, if any
		 * 
		 */		
		public function send( obj:Object=null ):void
		{
			if( _endPoint && !_endPoint.isTesting )
			{
				_token = _endPoint.send();
				_token.addResponder( this );
			}
			else
			{
				//We're testing; call svc with dummy params
				var dummyResponse:XML = new XML( "<config></config>");
				_responder.result( dummyResponse );
			}
		}
		

		//-----------------------------------------------------------
		//	EVENT HANDLER
		//-----------------------------------------------------------		
		/**
		 * Result handler for the service. Translates data if appropriate, sends 
		 * result to responder
		 * @param data	The return data from the service
		 * 
		 */		
		override public function result( data:Object ):void
		{
			trace( "$$$ - ConfigDelegate Success: (" + new Date().toTimeString() +")" );
			_responder.result( data );
		}

		/**
		 * Fault handler for the service 
		 * @param info	The fault data from the service
		 * 
		 */				
		override public function fault( info:Object ):void
		{
			trace( "!!! - ConfigDelegate Fault: (" + info.fault.faultCode +") " +  info.fault.faultDetail );
		}		
	}
}