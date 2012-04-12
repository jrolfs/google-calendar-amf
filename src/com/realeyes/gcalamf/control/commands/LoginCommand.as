////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2009 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.gcalamf.control.commands
{
	import com.realeyes.control.ICommand;
	import com.realeyes.event.REEvent;
	import com.realeyes.gcalamf.business.delegates.LoginDelegate;
	import com.realeyes.gcalamf.control.events.LoginEvent;
	import com.realeyes.gcalamf.model.ModelLocator;
	import com.realeyes.gcalamf.model.vo.Login;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	/**
	 * LoginCommand - 
	 * 
	 * @author	Jamie - Realeyes Media
	 * @version 1.0
	 * 
	 */
	public class LoginCommand implements ICommand, IResponder
	{
		//-----------------------------------------------------------
		// PROPERTY DECLARATIONS
		//-----------------------------------------------------------
		/**
		 * a reference to the modelLocator
		 */
		private var _modelLocator:ModelLocator;
		
		/**
		 * The event this command is paired with
		 */
		private var _event:LoginEvent;
		
			
		//-----------------------------------------------------------
		//	INIT
		//-----------------------------------------------------------
		public function LoginCommand()
		{
			_modelLocator = ModelLocator.getInstance();
		}
		
		
		//-----------------------------------------------------------
		//	CONTROL METHODS
		//-----------------------------------------------------------
		/**
		 * The main logic of this command
		 */
		public function execute( event:REEvent ):void
		{
			_event = event as LoginEvent;

			var delegate:LoginDelegate = new LoginDelegate( this );
			var params:Object = new Object();
				params.username = _event.username;
				params.password = _event.password;
			
			delegate.send( params );
		}
		
		
		//-----------------------------------------------------------
		//	EVENT HANDLERS
		//-----------------------------------------------------------		
		/**
		 * Result handler for service
		 * @param data	The final result from service after possible translation
		 * 
		 */	
		public function result( data:Object ):void
		{
			var login:Login = ResultEvent( data ).result as Login;
			
			if( login.success )
			{
				_modelLocator.login = login;
			}
			else
			{
				//TODO: implement login error handling
				_modelLocator.login = null;
			}
		}

		/**
		 * Fault handler for the service 
		 * @param info	The fault data from the service
		 * 
		 */				
		public function fault( info:Object ):void { /* handled in delegate */ }
	}
}