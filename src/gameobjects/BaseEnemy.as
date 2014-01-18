package gameobjects {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;

	public class BaseEnemy extends S3DObj {
		
		public var _spawn_time:Number;
		public var _end_time:Number;
		
		public function BaseEnemy(context:Context3D, cur_time:Number, end_time:Number) {
			super(context,Resource.RESC_COPTER_0);
			this._scale = Util.rand_range(5,6);
			
			_spawn_time = cur_time;
			_end_time = end_time;
		}
		
		public function update(game:S3DGameEngine):void {
			
		}
		
	}
}
