package gameobjects {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;
	
	public class TestDecoration extends S3DObj{
		
		public var _t:Number = 0;
		
		//(-8, -3, 2)->( -8, 9, -140)
		//(-8, 12t-3, -142t+2)
		public function TestDecoration(context:Context3D, texbmp:Bitmap) {
			super(context, texbmp);
			this.set_anchor_point(0.5, 0);
			this._scale = Util.rand_range(5,6);
		}
		
		public function update(game:S3DGameEngine):void {
			this.set_position( _x, 12 * _t - 3, -142 * _t + 2);
			_t -= 0.007 * game._dt_scale;
			if (_t < -0.2) _t = 2 - (Math.abs(_t) - 0.2);
		}
		
	}

}