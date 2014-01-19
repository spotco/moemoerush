package uiparticle {
	import flash.display.Sprite;
	/**
	 * @author spotco
	 */
	public class UIParticle extends Sprite {
		public function UIParticle(){}
		public function update(game:S3DGameEngine):void{}
		public function should_remove():Boolean{ return true; }
		public function do_remove():void {}
	}
}
