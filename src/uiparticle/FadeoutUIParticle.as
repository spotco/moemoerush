package uiparticle {
		import flash.geom.Matrix;
		import flash.display.Bitmap;
		import flash.display.Sprite;
	/**
	 * @author spotco
	 */
	public class FadeoutUIParticle extends UIParticle {
		
		private var _ct:Number, _ct_max:Number;
		
		public function FadeoutUIParticle(x:Number, y:Number, duration:Number, tex:Bitmap) {
			
			var anchor:Sprite = new Sprite();
			addChild(anchor);
			
			anchor.x = -tex.width/2;
			anchor.y = -tex.height/2;
			
			anchor.graphics.beginBitmapFill(tex.bitmapData);
			anchor.graphics.drawRect(0, 0, tex.width, tex.height);
			anchor.graphics.endFill();
			
			this.x = x;
			this.y = y;
			
			_ct = duration;
			_ct_max = duration;
		}
		public override function update(game:S3DGameEngine):void{
			_ct -= game._dt_scale;
			this.alpha = _ct/_ct_max;
		}
		public override function should_remove():Boolean{ 
			return _ct <= 0; 
		}
		public override function do_remove():void {}
		
	}
}
