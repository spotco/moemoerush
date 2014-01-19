package {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;
	import flash.ui.Keyboard;
	
	 [SWF(width="1000", height="500", frameRate="60", backgroundColor="#FFFFFF")]
	public class Main extends Sprite {
		
		public var _renderer:S3DRenderer = new S3DRenderer();
		public var _game_engine:S3DGameEngine = new S3DGameEngine();
		
		public function Main():void {
			this.init();
		}
		
		public function init():void {
			var self:Main = this;
			new KB(stage);
			_renderer.init(stage);
			_renderer._on_init = function():void {
				_game_engine.init(stage, _renderer);
				var t:Timer = (new Timer(20));
				t.addEventListener(TimerEvent.TIMER, update);
				t.start();
			};
		}
		
		public function update(e:TimerEvent):void {
			_game_engine.update();
			_renderer.update();
		}
		
	}
	
}