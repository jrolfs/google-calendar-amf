////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2009 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.gcalamf.model.vo
{
	[Bindable]
	[RemoteClass( alias='com.realeyes.gcalamf.model.vo.User' )]
	public class User
	{
		//-----------------------------------------------------------
		//	DECLARATIONS
		//-----------------------------------------------------------
		public var userName:String;
		public var password:String;
		public var email:String;
		public var attendeeStatus:String;
	}
}