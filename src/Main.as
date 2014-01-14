package {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;
	import flash.ui.Keyboard;
	
	[SWF(width="500", height="500", frameRate="60", backgroundColor="#FFFFFF")]
	public class Main extends Sprite {
		
		public function Main():void {
			init();
		}
		
		public function init():void {
			stage.addChild(this);
			stage.stage3Ds[0].addEventListener( Event.CONTEXT3D_CREATE, init3d ); 
			stage.stage3Ds[0].requestContext3D(); 
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private var _context:Context3D;
		private var _camera:S3DCamera;
		private var _objects:Vector.<S3DObj> = new Vector.<S3DObj>();
		
		public function init3d(e:Event):void {
			_context = stage.stage3Ds[0].context3D;
			_context.configureBackBuffer(500, 500, 1);
			
			_camera = new S3DCamera();
			
			
			var testobj:S3DObj = new S3DObj(_context);
			testobj.set_position(0, 0, 5);
			_objects.push(testobj);
			
			testobj = new S3DObj(_context);
			testobj.set_position(0, -3, 2);
			testobj._scale = 10;
			testobj._rotation_x = -85;
			_objects.push(testobj);
			
			_context.enableErrorChecking = true;
			_context.setCulling(Context3DTriangleFace.BACK);
			_projection.perspectiveFieldOfViewRH(45, stage.stageWidth / stage.stageHeight, 0.1, 100);
			_view.appendTranslation(0, 0, 10);
		}
		
		private static const CAM_FACING:Vector3D = new Vector3D(0, 0, -1);
		private static const CAM_UP:Vector3D = new Vector3D(0, -1, 0);
		
		private var _projection:PerspectiveMatrix3D = new PerspectiveMatrix3D();
		private var _world:Matrix3D = new Matrix3D();
		private var _view:Matrix3D = new Matrix3D();
		private static var output_matrix:Matrix3D = new Matrix3D();
		
		var theta = 0;
		private var _last_time:Number = NaN;
		public function update(e:Event):void {
			if (!_context) return;
			var cur_time:Number = (new Date()).getTime();
			var dt:Number = cur_time - _last_time;
			var dt_scale:Number = dt / 20;
			_last_time = cur_time;
			if (isNaN(dt)) return;
			
			theta += 0.1*dt_scale;
			_view.pointAt(new Vector3D(Math.cos(theta) * 2, Math.sin(theta) * 2, 0), CAM_FACING, CAM_UP);
			
			
			var camera:Matrix3D = _view.clone();
			camera.invert();
			
			_context.clear(1, 1, 1, 1);
			for each (var o:S3DObj in _objects) {
				output_matrix.identity();
				output_matrix.append(o.get_matrix());
				output_matrix.append(_world);
				output_matrix.append(camera);
				output_matrix.append(_projection);
				
				_context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, output_matrix, true);
				
				o.render();
			}
			_context.present();
		}
		
	}
	
}