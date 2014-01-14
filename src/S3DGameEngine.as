package  {
	import flash.display.Stage;
	import gameobjects.TestDecoration;
	public class S3DGameEngine {
		
		public var _renderer:S3DRenderer;
		public var _stage:Stage;
		
		public var _ground:S3DObj, _ground_fill:S3DObj, _sky_fill:S3DObj;
		
		private var _decorations:Vector.<TestDecoration> = new Vector.<TestDecoration>();
		
		public function init(stage:Stage, renderer:S3DRenderer):void {
			_renderer = renderer;
			_stage = stage;
			
			_renderer._camera.set_position(0, 0, 10);
			_renderer._camera._look_at_target.x = 0;
			_renderer._camera._look_at_target.y = 0;
			_renderer._camera._look_at_target.z = 0;
			
			_sky_fill = new S3DObj(_renderer._context, Resource.RESC_SKY);
			_sky_fill.set_position(0, 14.5, -201);
			_sky_fill.set_anchor_point(0.5, 0);
			_sky_fill._scale = 125;
			_sky_fill.update_vertex(0, S3DObj.I_ELE_X, -2);
			_sky_fill.update_vertex(1, S3DObj.I_ELE_X, -2);
			_sky_fill.update_vertex(2, S3DObj.I_ELE_X, 2);
			_sky_fill.update_vertex(3, S3DObj.I_ELE_X, 2);
			_sky_fill.upload_vertex_uv_buffers();
			_renderer._bg_objects.push(_sky_fill);
			
			_ground_fill = new S3DObj(renderer._context, Resource.RESC_GROUND_FILL);
			_ground_fill.set_position(0, 14.5, -200);
			_ground_fill.set_anchor_point(0.5, 1);
			_ground_fill._scale = 600;
			_renderer._bg_objects.push(_ground_fill);
			
			_ground = new S3DObj(renderer._context, Resource.RESC_GROUND);
			_ground.set_position(0, -3, 2);
			_ground._scale = 30;
			_ground._rotation_x = -85;
			_ground.set_anchor_point(0.5, 0.5);
			_ground.extend_y(6);
			_ground._shader = S3DObj.REPEAT_SHADER;
			_renderer._bg_objects.push(_ground);
			
			var side_i:int = 0;
			for (var i:Number = 0; i < 2; i += 0.049) {
				var cur:TestDecoration = new TestDecoration(renderer._context, Resource.RESC_TREE);
				cur._t = i;
				cur._x = side_i % 2 == 0? -9:9;
				side_i++;
				_decorations.push(cur);
				_renderer._decoration_objects.push(cur);
			}

		}
		
		var t:Number = 0;
		public function update(dt:Number, dt_scale:Number) {
			
			_renderer._decoration_objects.length = 0;
			_decorations.sort(function(a:TestDecoration, b:TestDecoration) {
				return a._z - b._z;
			});
			
			
			_ground.move_texture_uv(0.03, dt_scale);
			for each (var dec:TestDecoration in _decorations) {
				_renderer._decoration_objects.push(dec);
				dec.update(dt_scale);
			}
		}
	}

}