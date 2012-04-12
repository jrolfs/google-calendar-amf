////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2009 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.gcalamf.control
{
	import com.realeyes.control.REFrontController;
	
	import com.realeyes.gcalamf.control.commands.*;
	import com.realeyes.gcalamf.control.events.*;
    
    /**
     * GoogleCalendarAMFFrontController - Application front controller
     * 
     * @author	Jamie - Realeyes Media
     * @version	1.0
     */
	public class GoogleCalendarAMFFrontController extends REFrontController
	{
		//-----------------------------------------------------------
		// INIT
		//-----------------------------------------------------------
		/**
		 * Constructor
		 */
		public function GoogleCalendarAMFFrontController()
		{
			this.initialize();
		}

		/**
		 * Initialize event/command sequences
		 */
		private function initialize():void
		{
			addCommand( InitializeEvent.INITIALIZE, InitializeCommand );
			addCommand( LoginEvent.LOGIN, LoginCommand );
			addCommand( GetEventsEvent.GET_EVENTS, GetEventsCommand );
			//TODO: add commands
		}
	}
}