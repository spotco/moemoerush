package uiparticle {
		import flash.display.Bitmap;
		import flash.display.Sprite;
	
	/**
	 * @author spotco
	 */
	public class FlyUpFadeoutUIParticle extends FadeoutUIParticle {
		
		public function FlyUpFadeoutUIParticle(x:Number, y:Number, duration:Number, tex:Bitmap) {
			super(x,y,duration,tex);
			this.scaleX = this.scaleY = 0.15;
		}
		
		public override function update(game:S3DGameEngine):void {
			super.update(game);
			this.y -= 3 * game._dt_scale;
		}
		
	}
}
