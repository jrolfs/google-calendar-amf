////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2009 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.gcalamf.model.vo
{
	[Bindable]
	[RemoteClass( alias='com.realeyes.gcalamf.model.vo.Login' )]
	public class Login
	{
		//-----------------------------------------------------------
		//	DECLARATIONS
		//-----------------------------------------------------------
		public var success:Boolean;
		public var key:String;
		public var message:String;
	}
}