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
	import com.realeyes.gcalamf.model.ModelLocator;
	import com.realeyes.gcalamf.model.vo.User;
	
	import flash.events.SecurityErrorEvent;
	
	import mx.rpc.AbstractOperation;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;

	/**
	 * GetEventsDelegate - 
	 * 
	 * @author	Jamie, RealEyes Media
	 * @version 1.0
	 */
	public class LoginDelegate extends REDelegate
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
		public function LoginDelegate( responder:IResponder )
		{
			super( responder );
			_manager = REServiceManager.getInstance();
			_endPoint = _manager.getDataEndpoint( GoogleCalendarAMFServiceLocator.LOGIN );
		}
		
		
		//-----------------------------------------------------------
		//	CONTROL METHODS
		//-----------------------------------------------------------	
		/**
		 * Calls the service 
		 * 
		 * @param obj	the param to send to service, if any
		 */		
		public function send( obj:Object=null ):void
		{
  			if( _endPoint && !_endPoint.isTesting )
			{
				_token = _endPoint.send( obj );
				
				_token.addResponder( this );
			}
			else
			{
				//TODO: implement dummy data
			}
		}
		

		//-----------------------------------------------------------
		//	EVENT HANDLER
		//-----------------------------------------------------------		
		/**
		 * Result handler for the service
		 * 
		 * @param data	The return data from the service
		 */		
		override public function result( data:Object ):void
		{
			trace( "$$$ - LoginDelegate Success: (" + new Date().toTimeString() +")" );
			_responder.result( data );
		}

		/**
		 * Fault handler for the service
		 * 
		 * @param info	The fault data from the service
		 */				
		override public function fault( info:Object ):void
		{
			if( info is FaultEvent )
			{
				trace( "!!! - LoginDelegate Fault: (" +info.fault.faultCode +") " +  info.fault.faultDetail );
			}
			else if( info is SecurityErrorEvent )
			{
				trace( "!!! - LoginDelegate Fault: (Security Error) " +  info.fault.faultDetail );
			}
		}		
	}
}