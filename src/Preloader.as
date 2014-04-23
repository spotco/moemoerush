package{
    import org.flixel.system.*;
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.net.*;
	
	
	public class Preloader extends FlxPreloader
	{
		public function Preloader():void
		{
			className = "Main";
			super();
		}
		
		var adContainer:MovieClip = new MovieClip;
		
		override protected function create():void {
			super.create();
		}
		
		override protected function destroy():void {
			super.destroy();
			
		}
		
	}
}