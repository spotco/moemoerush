package uiparticle {
	/**
	 * @author spotco
	 */
	public class FlyupTextParticle extends UIParticle {
		
		private var _ct:Number, _ct_max:Number;
		
		public function FlyupTextParticle(x:Number, y:Number, text:String, duration:Number) {
			this.x = x;
			this.y = y;
			_ct= duration;
			_ct_max = duration;
			TextRenderer.render_text(this.graphics, text, 0, 0, 25, 0x00FF00);
		}
		
		public override function update(game:S3DGameEngine):void{
			_ct -= game._dt_scale;
			this.alpha = _ct/_ct_max;
			
			this.y -= 3 * game._dt_scale;
		}
		public override function should_remove():Boolean{ 
			return _ct <= 0; 
		}
		public override function do_remove():void {}
		
	}
}
