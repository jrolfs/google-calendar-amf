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
	 * LoginEvent - 
	 * @author	Jamie - Realeyes Media
	 * @version 1.0
	 */
	public final class LoginEvent extends REEvent
	{
		//-----------------------------------------------------------
		// PROPERTY DECLARATIONS
		//-----------------------------------------------------------
		public static const LOGIN:String = "Login";
		
		public var username:String;
		public var password:String;
		
		/**
		 * Constructor
		 *
		 */
		public function LoginEvent( type:String, username:String, password:String, bubbles:Boolean=false, cancelable:Boolean=false ) 
		{
			super( type, bubbles, cancelable );
			
			this.username = username;
			this.password = password;
		}
		
		/**
		 * Override the inherited clone() method
		 * 
		 */	
		override public function clone():Event
		{
			return new LoginEvent( type, username, password, bubbles, cancelable );
		}
	}
}