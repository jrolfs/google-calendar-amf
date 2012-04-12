////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2009 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.gcalamf.control.commands
{
	import com.realeyes.control.ICommand;
	import com.realeyes.event.REEvent;
	import com.realeyes.gcalamf.business.delegates.EventDelegate;
	import com.realeyes.gcalamf.control.events.GetEventsEvent;
	import com.realeyes.gcalamf.model.ModelLocator;
	import com.realeyes.gcalamf.model.vo.CalendarEvent;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	/**
	 * GetEventsCommand - 
	 * 
	 * @author	Jamie - Realeyes Media
	 * @version 1.0
	 * 
	 */
	public class GetEventsCommand implements ICommand, IResponder
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
		private var _event:GetEventsEvent;
		
			
		//-----------------------------------------------------------
		//	INIT
		//-----------------------------------------------------------
		public function GetEventsCommand()
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
			_event = event as GetEventsEvent;

			var delegate:EventDelegate = new EventDelegate( this );
			var params:Object = new Object();
			
			switch( _event.type )
			{
				case GetEventsEvent.GET_EVENTS:
				{
					break;
				}
			}
			
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
			var event:CalendarEvent;
			
			[ArrayElementType("CalendarEvent")]
			var events:ArrayCollection = ResultEvent( data ).result as ArrayCollection;
		}

		/**
		 * Fault handler for the service 
		 * @param info	The fault data from the service
		 * 
		 */				
		public function fault( info:Object ):void { /* handled in delegate */ }
	}
}