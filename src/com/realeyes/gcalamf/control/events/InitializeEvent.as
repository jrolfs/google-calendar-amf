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
	 * InitializeServicesEvent - 
	 * @author	Jamie - Realeyes Media
	 * @version 1.0
	 */
	public final class InitializeEvent extends REEvent
	{
		//-----------------------------------------------------------
		// PROPERTY DECLARATIONS
		//-----------------------------------------------------------
		public static const INITIALIZE:String = "initialize"; 
		
		/**
		 * Constructor
		 *
		 */
		public function InitializeEvent( type:String, bubbles:Boolean=false, cancelable:Boolean=false ) 
		{
			super( type, bubbles, cancelable );
		}
		
		/**
		 * Override the inherited clone() method
		 * 
		 */	
		override public function clone():Event
		{
			return new InitializeEvent( type, bubbles, cancelable );
		}
	}
}