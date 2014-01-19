package uiparticle {
	import flash.display.Bitmap;
	/**
	 * @author spotco
	 */
	public class RotatingGravityFadeoutUIParticle extends FadeoutUIParticle {
		
		public var _vx:Number, _vy:Number, _vr:Number;
		
		public function RotatingGravityFadeoutUIParticle(x:Number, y:Number, duration:Number, tex:Bitmap) {
			super(x,y,duration,tex);
			_vx = 0;
			_vy = 0;
			_vr = 0;
		}
		
		public function set_velocity(vx:Number, vy:Number):RotatingGravityFadeoutUIParticle {
			_vx = vx;
			_vy = vy;	
			return this;
		}
		
		public function set_vr(vr:Number):RotatingGravityFadeoutUIParticle {
			_vr = vr;
			return this;
		}
		
		public function set_scale(s:Number):RotatingGravityFadeoutUIParticle {
			this.scaleX = s;
			this.scaleY = s;
			return this;
		}
		
		public override function update(game:S3DGameEngine):void{
			super.update(game);
			this.rotation += _vr * game._dt_scale;
			this.x += _vx * game._dt_scale;
			this.y += _vy * game._dt_scale;
			_vy += 0.5 * game._dt_scale;
		}
	}
}
