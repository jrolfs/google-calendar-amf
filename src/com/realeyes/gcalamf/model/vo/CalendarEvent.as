////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2009 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.gcalamf.model.vo
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass( alias='com.realeyes.gcalamf.model.vo.CalendarEvent' )]
	public class CalendarEvent
	{
		//-----------------------------------------------------------
		//	DECLARATIONS
		//-----------------------------------------------------------
		public var title:String;
		public var start:Date;
		public var end:Date;
		public var location:String;
		public var description:String;
		public var participants:ArrayCollection;
		public var updated:Date;
	}
}