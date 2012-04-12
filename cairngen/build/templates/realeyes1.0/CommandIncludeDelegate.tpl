@copy@
package @namespace@.command
{
	@imports@
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import @namespace@.business.@sequence@Delegate;
	import @namespace@.event.@sequence@Event;
	import @namespace@.model.ModelLocator;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class @sequence@Command implements ICommand, IResponder
	{
		@declarations@
		
		
		public function execute( event:CairngormEvent ):void
		{
			var evt:@sequence@Event = event as @sequence@Event;
			var delegate:@sequence@Delegate = new @sequence@Delegate( this );
		}
		
		public function result( event:Object ):void
		{
			var result:ResultEvent = event as ResultEvent;
		}
		
		public function fault( event:Object ):void
		{
			var faultEvent:FaultEvent = event as FaultEvent;
		}
	}
}
