package  {
	import flash.display.Stage;
	import gameobjects.*;
	import flash.ui.Keyboard;
	
	public class S3DGameEngine {
		
		public var _renderer:S3DRenderer;
		public var _stage:Stage;
		
		public var _ground:S3DObj, _ground_fill:S3DObj, _sky_fill:S3DObj;
		
		private var _player:PlayerGirl = new PlayerGirl();
		
		public var _layer_bg:Vector.<S3DObj> = new Vector.<S3DObj>();
		public var _layer_objects:Vector.<S3DObj> = new Vector.<S3DObj>();
		
		private var _decorations:Vector.<TestDecoration> = new Vector.<TestDecoration>();
		private var _enemies:Vector.<BaseEnemy> = new Vector.<BaseEnemy>();
		
		public function init(stage:Stage, renderer:S3DRenderer):void {
			_renderer = renderer;
			_stage = stage;
			
			_renderer._layers.push(_layer_bg);
			_renderer._layers.push(_layer_objects);
			
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
			_layer_bg.push(_sky_fill);
			
			_ground_fill = new S3DObj(renderer._context, Resource.RESC_GROUND_FILL);
			_ground_fill.set_position(0, 14.5, -200);
			_ground_fill.set_anchor_point(0.5, 1);
			_ground_fill._scale = 600;
			_layer_bg.push(_ground_fill);
			
			_ground = new S3DObj(renderer._context, Resource.RESC_GROUND);
			_ground.set_position(0, -3, 2);
			_ground._scale = 30;
			_ground._rotation_x = -85;
			_ground.set_anchor_point(0.5, 0.5);
			_ground.extend_y(6);
			_ground._shader = S3DObj.REPEAT_SHADER;
			_layer_bg.push(_ground);
			
			var side_i:int = 0;
			for (var i:Number = 0; i < 2; i += 0.049) {
				var cur:TestDecoration = new TestDecoration(renderer._context, Resource.RESC_TREE);
				cur._t = i;
				cur._x = side_i % 2 == 0? -9:9;
				side_i++;
				_decorations.push(cur);
				_layer_objects.push(cur);
			}
			
			
			
			_stage.addChild(_player);
			_player.init();
		}
		
		public var _last_time:Number = NaN;
		public var _dt:Number = NaN;
		public var _dt_scale:Number = NaN;
		public function update():void {
			var cur_time:Number = (new Date()).getTime();
			_dt = cur_time - _last_time;
			_dt_scale = _dt / 20;
			_last_time = cur_time;
			if (isNaN(_dt)) return;
			
			
			_player.update(this);
			if (KB.is_key_down(Keyboard.LEFT)) {
				_player.push_tmp_anim(_player.ANIM_PUNCH_LEFT, 3);
				
			} else if (KB.is_key_down(Keyboard.RIGHT)) {
				_player.push_tmp_anim(_player.ANIM_PUNCH_RIGHT, 3);
				
			} else if (KB.is_key_down(Keyboard.UP)) {
				_player.push_tmp_anim(_player.ANIM_PUNCH_TOP, 3);
				
			}
			
			
			_layer_objects.length = 0;			
			_ground.move_texture_uv(0.03, _dt_scale);
			for each (var dec:TestDecoration in _decorations) {
				_layer_objects.push(dec);
				dec.update(this);
			}
			
			_layer_objects.sort(function(a:S3DObj, b:S3DObj):Number {
				return a._z - b._z;
			});
		}
	}

}