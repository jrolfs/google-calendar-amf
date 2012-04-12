@copy@
package @namespace@.model
{
	@imports@
	import com.adobe.cairngorm.model.IModelLocator;
	import com.adobe.cairngorm.CairngormError;
	import com.adobe.cairngorm.CairngormMessageCodes;
    
	@model@
    [Bindable]
	public final class ModelLocator implements IModelLocator
	{
		@singleton@
		
		/**
		 * Defines the Singleton instance of the Application ModelLocator
		 */
		private static var instance:ModelLocator;

		public function ModelLocator( access:Private )
		{
			if (access == null)
			{
			    throw new CairngormError( CairngormMessageCodes.SINGLETON_EXCEPTION, "ModelLocator" );
			}
			instance = this;
		}
		 
		/**
		 * Returns the Singleton instance of the Application ModelLocator
		 */
		public static function getInstance():ModelLocator
		{
			if (instance == null)
			{
				instance = new ModelLocator( new Private() );
			}
			return instance;
		}
		
		@constants@
		
		
		@declarations@
	}
}

/**
 * Inner class which restricts constructor access to Private
 */
class Private {}
