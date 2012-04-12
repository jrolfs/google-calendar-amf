@copy@
package @namespace@.control.commands
{
	import com.realeyes.control.ICommand;
	import com.realeyes.event.REEvent;

	import @namespace@.control.events.@sequence@Event;
	import @namespace@.model.ModelLocator;

	/**
	 * @sequence@Command - 
	 * 
	 * @author	@author@ - Realeyes Media
	 * @version 1.0
	 * 
	 */
	public class @sequence@Command implements ICommand
	{
		@declarations@
		/**
		 * a reference to the modelLocator
		 */
		private var _modelLocator:ModelLocator;
		
		/**
		 * The event this command is paired with
		 */
		private var _event:@sequence@Event;
		
			
		//-----------------------------------------------------------
		//	INIT
		//-----------------------------------------------------------
		public function @sequence@Command()
		{
			_modelLocator = ModelLocator.getInstance();
		}
		
		
		//-----------------------------------------------------------
		//	CONTROL METHODS
		//-----------------------------------------------------------
		/**
		 * The main logic of this command
		 */
		public function execute( event:REEvent ):void
		{
			_event = event as @sequence@Event;
		}
	}
}