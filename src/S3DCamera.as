package  {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;
	
	public class S3DCamera {
		
		public var _perspective:PerspectiveMatrix3D;
		public var _camera_view:PerspectiveMatrix3D = new PerspectiveMatrix3D();
		
		public var _x:Number = 0, _y:Number = 0, _z:Number = 0;
		public function set_position(x:Number, y:Number, z:Number):void { _x = x; _y = y; _z = z; }
		public var _rotation_x:Number = 0, _rotation_y:Number = 0, _rotation_z:Number = 0;
		
		public function S3DCamera() {
			_perspective = new PerspectiveMatrix3D();
			_perspective.perspectiveFieldOfViewLH(90 * Math.PI / 180, 1, 0.1, 1000);
			this.update();
		}
		
		public function update():void {
			//_camera_view.identity();
			//_camera_view.appendTranslation(_x, _y, _z);
			//_camera_view.appendRotation(_rotation_x, Vector3D.X_AXIS);
			//_camera_view.appendRotation(_rotation_y, Vector3D.Y_AXIS);
			//_camera_view.appendRotation(_rotation_z, Vector3D.Z_AXIS);
			
			
			//_camera_view.pointAt(new Vector3D(_x, _y, _z), tmp_pos, Vector3D.Y_AXIS);
			
			//_camera_view.invert();
			
			//trace(tmp_pos);
		}
		
	}

}