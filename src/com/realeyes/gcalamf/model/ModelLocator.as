package com.realeyes.gcalamf.model
{
	import com.realeyes.gcalamf.model.vo.Login;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	
	/**
	 * ModelLocator - Model locator for this application
	 * 
	 * @author	Jamie - Realeyes Media
	 * @version	1.0
	 */
	public class ModelLocator extends EventDispatcher
	{
		//-----------------------------------------------------------
		// PROPERTY DECLARATIONS
		//-----------------------------------------------------------
		/**
		 * The serviceDescriptor for the ConfigXML
		 */
		public var configServiceDescriptor:XML = 	<service id="ConfigService"
														type='httpService'
														rootURL="">
														<operation name="GetConfigXML" 
												            method="GET"
												            resultFormat="e4x"
												            url='data/config.xml'
												            timeout="30000"
												            isTesting="false" />
					    							</service>;
		
		static private var _instance:ModelLocator;
		
		private var _login:Login;


		//-----------------------------------------------------------
		// INIT
		//-----------------------------------------------------------
		/**
		 * Constructor
		 */
		public function ModelLocator( sentry:SingletonSentry, target:IEventDispatcher=null )
		{
			super( target );
		}
		
		/**
		 * Returns an instance of this singleton class
		 */		
		static public function getInstance():ModelLocator
		{
			if( !_instance )
			{
				_instance = new ModelLocator( new SingletonSentry() );
			}
			
			return _instance;
		}
		
		
		//-----------------------------------------------------------
		// GETTER/SETTERS
		//-----------------------------------------------------------
		[Bindable( event="loginChange" )]
		public function get login():Login
		{
			return _login;
		}
		public function set login( value:Login ):void
		{
			if( value != _login )
			{
				_login = value;
				dispatchEvent( new Event( "loginChange" ) );
			}
		}
	}
}
class SingletonSentry{}