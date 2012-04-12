////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2009 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.gcalamf.control.events
{
	import com.realeyes.event.REEvent;
	
	import flash.events.Event;

	/**
	 * GetEventsEvent - 
	 * @author	Jamie - Realeyes Media
	 * @version 1.0
	 */
	public final class GetEventsEvent extends REEvent
	{
		//-----------------------------------------------------------
		// PROPERTY DECLARATIONS
		//-----------------------------------------------------------
		public static const GET_EVENTS:String = "GetEvents";
		
		public var name:String;
		
		/**
		 * Constructor
		 *
		 */
		public function GetEventsEvent( type:String, name:String="", bubbles:Boolean=false, cancelable:Boolean=false ) 
		{
			super( type, bubbles, cancelable );
			
			this.name = name;
		}
		
		/**
		 * Override the inherited clone() method
		 * 
		 */	
		override public function clone():Event
		{
			return new GetEventsEvent( type, name, bubbles, cancelable );
		}
	}
}