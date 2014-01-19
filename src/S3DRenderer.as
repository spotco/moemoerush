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
		public var _context:Context3D;
		public var _camera:S3DCamera;
		public var _layers:Vector.<Vector.<S3DObj>> = new Vector.<Vector.<S3DObj>>();
		
		public function init(stage:Stage, context:Context3D):void {
			_context = context;
			_stage = stage;
			_camera = new S3DCamera(_stage.stageWidth / _stage.stageHeight);
			_camera.set_position(0, 0, 1);
		}		

		private static var output_matrix:Matrix3D = new Matrix3D();
		
		
		public function update():void {
			if (!_context) return;
			
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