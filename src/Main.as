package {
	import com.adobe.utils.*;
	import com.S3DGameEngine;
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
			var self = this;
			_renderer.init(stage);
			_renderer._on_init = function() {
				_game_engine.init(stage, _renderer);
				_renderer._logic_update = _game_engine.update;
				self.addEventListener(Event.ENTER_FRAME, update);
			};
		}
		
		public function update(e:Event):void {
			_renderer.update();
		}
		
	}
	
}