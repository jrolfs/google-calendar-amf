@copy@
package @namespace@.@control@
{
	@imports@
	import com.adobe.cairngorm.control.FrontController;
    import @namespace@.command.*;
    import @namespace@.event.*;
    
	public final class @projectname@Controller extends FrontController
	{
		/**
		 * Constructor
		 *
		 */
		public function @projectname@Controller()
		{
			this.initialize();
		}

		/**
		 * @public - attach events to corresponding commands
		 * 
		 */
		private function initialize():void
		{
			//TODO: add commands
		}
	}
}
