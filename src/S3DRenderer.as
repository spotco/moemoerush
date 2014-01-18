package {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;
	import flash.ui.Keyboard;
	
	public class S3DRenderer {
		
		public var _stage:Stage;
		
		public function init(stage:Stage):void {
			_stage = stage;
			_stage.stage3Ds[0].addEventListener( Event.CONTEXT3D_CREATE, init3d ); 
			_stage.stage3Ds[0].requestContext3D();
		}
		
		public var _context:Context3D;
		public var _camera:S3DCamera;
		public var _layers:Vector.<Vector.<S3DObj>> = new Vector.<Vector.<S3DObj>>();
		
		public var _logic_update:Function = function(dt:Number, dt_scale:Number):void { };
		public var _on_init:Function = function():void { };
		
		public function init3d(e:Event):void {
			_context = _stage.stage3Ds[0].context3D;
			_context.configureBackBuffer(1000, 500, 1);
			
			_context.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA, Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
			_context.enableErrorChecking = true;
			_context.setCulling(Context3DTriangleFace.BACK);
			
			_camera = new S3DCamera(_stage.stageWidth / _stage.stageHeight);
			_camera.set_position(0, 0, 1);		
			
			_on_init();
		}		

		private static var output_matrix:Matrix3D = new Matrix3D();
		
		private var _last_time:Number = NaN;
		public function update():void {
			if (!_context) return;
			var cur_time:Number = (new Date()).getTime();
			var dt:Number = cur_time - _last_time;
			var dt_scale:Number = dt / 20;
			_last_time = cur_time;
			if (isNaN(dt)) return;
			
			_logic_update(dt, dt_scale);
			
			_context.clear(1, 1, 1, 1);
			
			var output_view:Matrix3D = _camera.get_view_matrix().clone();
			output_view.invert();
			
			for each (var layer:Vector.<S3DObj> in _layers) {
				for each (var o:S3DObj in layer) {
					output_matrix.identity();
					output_matrix.append(o.get_matrix());
					output_matrix.append(_camera._world);
					output_matrix.append(output_view);
					output_matrix.append(_camera._projection);
					_context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, output_matrix, true);
					o.render();
				}
			}
			_context.present();
		}
		
	}
	
}