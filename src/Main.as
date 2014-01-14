package {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;
	import flash.ui.Keyboard;
	
	[SWF(width="1000", height="500", frameRate="60", backgroundColor="#FFFFFF")]
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
		
		public var _context:Context3D;
		public var _camera:S3DCamera;
		public var _objects:Vector.<S3DObj> = new Vector.<S3DObj>();
		
		public function init3d(e:Event):void {
			_context = stage.stage3Ds[0].context3D;
			_context.configureBackBuffer(1000, 500, 1);
			
			_context.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA, Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
			_context.enableErrorChecking = true;
			_context.setCulling(Context3DTriangleFace.BACK);
			
			_camera = new S3DCamera(stage.stageWidth / stage.stageHeight);
			_camera.set_position(0, 0, 10);
			
			
			var testobj:S3DObj;
			
			testobj = new S3DObj(_context, Resource.RESC_GROUND);
			testobj.set_position(0, -3, 2);
			testobj._scale = 30;
			testobj._rotation_x = -85;
			testobj.set_anchor_point(0.5, 0.5);
			testobj.extend_y(6);
			testobj._shader = S3DObj.REPEAT_SHADER;
			_objects.push(testobj);
			
			testobj = new S3DObj(_context, Resource.RESC_TREE);
			testobj.set_position(-8, -3, 2);
			testobj.set_anchor_point(0.5, 0);
			testobj._scale = 6;
			_objects.push(testobj);
			
		}		

		private static var output_matrix:Matrix3D = new Matrix3D();
		
		private var _last_time:Number = NaN;
		public function update(e:Event):void {
			if (!_context) return;
			var cur_time:Number = (new Date()).getTime();
			var dt:Number = cur_time - _last_time;
			var dt_scale:Number = dt / 20;
			_last_time = cur_time;
			if (isNaN(dt)) return;
			
			_context.clear(1, 1, 1, 1);
			
			var output_view:Matrix3D = _camera.get_view_matrix().clone();
			output_view.invert();
			
			for each (var o:S3DObj in _objects) {
				output_matrix.identity();
				output_matrix.append(o.get_matrix());
				output_matrix.append(_camera._world);
				output_matrix.append(output_view);
				output_matrix.append(_camera._projection);
				_context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, output_matrix, true);
				o.render();
			}
			_context.present();
		}
		
	}
	
}