package gameobjects {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;
	import models.*;

	public class BaseEnemy extends S3DObj {
		
		public static var SIDE_LEFT:String = "side_left";
		public static var SIDE_RIGHT:String = "side_right";
		public static var SIDE_TOP:String = "side_top";
		
		public static var POS_LEFT_HIT:Vector3D = new Vector3D(-2,5,0);
		public static var POS_RIGHT_HIT:Vector3D = new Vector3D(2,5,0);
		public static var POS_TOP_HIT:Vector3D = new Vector3D(0,9,0);
		
		public var _spawn_time:Number;
		public var _end_time:Number;
		
		public var _parametric_start:Number;
		public var _parametric_end:Number;
		
		public var _pos_start:Vector3D;
		public var _pos_end:Vector3D;
		
		public var _enemy:Enemy;
		public var _side:String;
		
		public function BaseEnemy(context:Context3D) {
			super(context,Resource.RESC_COPTER_0);
		}
		
		public function init(cur_time:Number, end_time:Number, side:String):BaseEnemy {
			this._scale = Util.rand_range(5,6);
			
			if (side == SIDE_LEFT) {
				this._pos_start = new Vector3D(Util.rand_range(-160, -80),Util.rand_range(40, 80),-120);
				this._pos_end = POS_LEFT_HIT.clone();
				
			} else if (side == SIDE_RIGHT) {
				this._pos_start = new Vector3D(Util.rand_range(80, 160),Util.rand_range(40, 80),-120);
				this._pos_end = POS_RIGHT_HIT.clone();
				
			} else if (side == SIDE_TOP) {
				this._pos_start = new Vector3D(Util.rand_range(-80, 80),Util.rand_range(50, 80),-120);
				this._pos_end = POS_TOP_HIT.clone();
				
			}
			this._side = side;
			
			this.set_position(_pos_start.x, _pos_start.y, _pos_start.z);
			this.set_anchor_point(0.5, 0.5);
			
			_spawn_time = cur_time;
			_end_time = end_time;
		
			return this;
		}
		
		private var _should_remove:Boolean = false;
		
		public function update(game:S3DGameEngine):void {
			
			var time_pct:Number = (game._last_time - this._spawn_time) / (this._end_time - this._spawn_time);
			
		   if (time_pct >= 1.05) {
				_should_remove = true;
				game._song.markEnemyMiss(this._enemy);
			}
			
			this._x = time_pct * (_pos_end.x-_pos_start.x) + _pos_start.x;
			this._y = time_pct * (_pos_end.y-_pos_start.y) + _pos_start.y;
			this._z = time_pct * (_pos_end.z-_pos_start.z) + _pos_start.z;
		}
		
		public function force_remove():void {
			_should_remove = true;
		}
		
		public function should_remove():Boolean {
			return _should_remove;
		}
		
		public function do_remove():void {
			super.dispose();
		}
		
	}
}
