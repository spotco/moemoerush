package  {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;
	
	public class S3DCamera {
		
		private static const CAM_FACING:Vector3D = new Vector3D(0, 0, -1);
		private static const CAM_UP:Vector3D = new Vector3D(0, -1, 0);
		
		public var _projection:PerspectiveMatrix3D = new PerspectiveMatrix3D();
		public var _world:Matrix3D = new Matrix3D();
		private var _view:Matrix3D = new Matrix3D();
		
		public var _x:Number = 0, _y:Number = 0, _z:Number = 0;
		public function set_position(x:Number, y:Number, z:Number):void { _x = x; _y = y; _z = z; }
		
		public function S3DCamera(aspect_ratio:Number) {
			_projection.perspectiveFieldOfViewRH(45, aspect_ratio, 0.1, 10000);
		}
		
		public var _look_at_target:Vector3D = new Vector3D(0, 0, 0);
		public function look_at(l_x:Number, l_y:Number, l_z:Number):void{
			_look_at_target.x = l_x;
			_look_at_target.y = l_y;
			_look_at_target.z = l_z;
		}
		
		public function get_view_matrix():Matrix3D {
			_view.identity();
			_view.appendTranslation(_x, _y, _z);
			_view.pointAt(_look_at_target,CAM_FACING,CAM_UP);
			return _view;
		}
		
		public function update():void {
		}
		
	}

}