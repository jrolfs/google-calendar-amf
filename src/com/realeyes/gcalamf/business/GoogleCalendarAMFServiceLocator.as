////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2009 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.gcalamf.business
{

	/**
	 * ABAServiceLocator - a directory of REDatatEndpoint names 
	 * that can be used when making data service calls in the
	 * ABA Classsroom App.
	 * 
	 * @author Jun Heider - RealEys Media
	 * @version 1.0
	 */
	public class GoogleCalendarAMFServiceLocator
	{
		//-----------------------------------------------------------
		//	DECLARATIONS
		//-----------------------------------------------------------
		
		// The applicable REDataEndpont names
		/**
		 * REDataEndpoint name "GetConfigXML"
		 */
		public static const GET_CONFIG_XML:String = "GetConfigXML";
		/**
		 *	REDataEndpoint name "get_users"
		 */		
		public static const GET_EVENTS:String = "get_events";
		/**
		 *	REDataEndpoint name "get_users"
		 */		
		public static const LOGIN:String = "login";
	}
}