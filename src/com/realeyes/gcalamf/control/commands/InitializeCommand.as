////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2009 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.gcalamf.control.commands
{
	import com.realeyes.business.REServiceManager;
	import com.realeyes.control.ICommand;
	import com.realeyes.event.REEvent;
	import com.realeyes.gcalamf.business.delegates.ConfigDelegate;
	import com.realeyes.gcalamf.control.events.InitializeEvent;
	import com.realeyes.gcalamf.model.ModelLocator;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	/**
	 * InitializeServicesCommand - 
	 * 
	 * @author	Jamie - Realeyes Media
	 * @version 1.0
	 * 
	 */
	public class InitializeCommand implements ICommand, IResponder
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
		private var _event:InitializeEvent;
		
		/**
		 * Service manager
		 */
		private var _manager:REServiceManager;
		
			
		//-----------------------------------------------------------
		//	INIT
		//-----------------------------------------------------------
		public function InitializeCommand()
		{
			_modelLocator = ModelLocator.getInstance();
			_manager = REServiceManager.getInstance();
		}
		
		
		//-----------------------------------------------------------
		//	CONTROL METHODS
		//-----------------------------------------------------------
		/**
		 * The main logic of this command
		 */
		public function execute( event:REEvent ):void
		{
			_event = event as InitializeEvent;
				
			var success:Boolean = _manager.addServices( new XMLList( _modelLocator.configServiceDescriptor ) );
			
			if( success )
			{
				var delegate:ConfigDelegate = new ConfigDelegate( this );
					delegate.send();
			}
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
			_manager.addServices( XMLList( ( data as ResultEvent ).result..service ) );
		}
		
		/**
		 * Fault handler for service
		 * @param info	The fault info from service
		 * 
		 */
		public function fault( info:Object ):void { /* handled in delegate */ }
	}
}