package  {
    // TODO: Ships on screen depends on BPM
	import flash.geom.Vector3D;
	import uiparticle.*
	import flash.display.Stage;
	import gameobjects.*;
	import flash.ui.Keyboard;
    import models.*;
	
	public class S3DGameEngine {
		public const TIME_BEFORE_SONG:int = 2000;
		
		public var _renderer:S3DRenderer;
		public var _stage:Stage;
		
		public var _ground:S3DObj, _ground_fill:S3DObj, _sky_fill:S3DObj;
		
		private var _player:PlayerGirl = new PlayerGirl();
		
		public var _layer_bg:Vector.<S3DObj> = new Vector.<S3DObj>();
		public var _layer_objects:Vector.<S3DObj> = new Vector.<S3DObj>();
		
		private var _decorations:Vector.<TestDecoration> = new Vector.<TestDecoration>();
		private var _enemies:Vector.<BaseEnemy> = new Vector.<BaseEnemy>();

		private var _music_has_started:Boolean = false;

		private var _song:Song;
		private var _ui_particles:Vector.<UIParticle> = new Vector.<UIParticle>();
		
		private var _ingame_ui:IngameUI;
		
		public function init(stage:Stage, renderer:S3DRenderer, song:Song):void {
			_renderer = renderer;
			_stage = stage;
			_song = song;
			
			_renderer._layers.push(_layer_bg);
			_renderer._layers.push(_layer_objects);
			
			_renderer._camera.set_position(0, 7, 10);
			_renderer._camera._look_at_target.x = 0;
			_renderer._camera._look_at_target.y = 7;
			_renderer._camera._look_at_target.z = 0;
			
			_sky_fill = new S3DObj(_renderer._context, Resource.RESC_SKY);
			_sky_fill.set_position(0, -40, -261);
			_sky_fill.set_anchor_point(0.5, 0);
			_sky_fill._scale = 290;
			_sky_fill.update_vertex(0, S3DObj.I_ELE_X, -1.2);
			_sky_fill.update_vertex(1, S3DObj.I_ELE_X, -1.2);
			_sky_fill.update_vertex(2, S3DObj.I_ELE_X, 1.2);
			_sky_fill.update_vertex(3, S3DObj.I_ELE_X, 1.2);
			_sky_fill.upload_vertex_uv_buffers();
			_layer_bg.push(_sky_fill);
			
			_ground_fill = new S3DObj(renderer._context, Resource.RESC_GROUND_FILL);
			_ground_fill.set_position(0, 10, -200);
			_ground_fill.set_anchor_point(0.5, 1);
			_ground_fill._scale = 600;
			_layer_bg.push(_ground_fill);
			
			_ground = new S3DObj(renderer._context, Resource.RESC_GROUND);
			_ground.set_position(0, -3, 2);
			_ground._scale = 30;
			_ground._rotation_x = -85;
			_ground.set_anchor_point(0.5, 0.5);
			_ground.extend_y(15);
			_ground._shader = S3DObj.REPEAT_SHADER;
			_layer_bg.push(_ground);
			
			var side_i:int = 0;
			for (var i:Number = -0.2; i < 2; i += 0.049) {
				var cur:TestDecoration = new TestDecoration(renderer._context, Resource.RESC_LAMPPOST);
				cur._t = i;
				cur._x = side_i % 2 == 0? -9:9;
				if (side_i%2 != 0) {
					cur.update_vertex(0, S3DObj.I_ELE_U, 1);
					cur.update_vertex(1, S3DObj.I_ELE_U, 1);
					cur.update_vertex(2, S3DObj.I_ELE_U, 0);
					cur.update_vertex(3, S3DObj.I_ELE_U, 0);
					cur.upload_vertex_uv_buffers();
				}
				side_i++;
				_decorations.push(cur);
				_layer_objects.push(cur);
				
				cur = new TestDecoration(renderer._context, 
					[Resource.RESC_BUILING_0,Resource.RESC_BUILING_1,Resource.RESC_BUILING_2][Math.floor(Math.random()*3)] );
				cur._t = i;
				if (side_i%2 != 0) {
					cur.update_vertex(0, S3DObj.I_ELE_U, 1);
					cur.update_vertex(1, S3DObj.I_ELE_U, 1);
					cur.update_vertex(2, S3DObj.I_ELE_U, 0);
					cur.update_vertex(3, S3DObj.I_ELE_U, 0);
					cur.upload_vertex_uv_buffers();
				}
				cur._scale = Util.rand_range(20,30);
				cur._building_mode = true;
				cur._x = (side_i % 2 == 0? -1:1)*Util.rand_range(25,45);
				_decorations.push(cur);
				_layer_objects.push(cur);
				
			}
			
			// Time
			_start_time = (new Date()).getTime() + TIME_BEFORE_SONG;
			_legit_start_time = 0;
			update_dt();
			
			_stage.addChild(_player);
			_player.init();
			
			_ingame_ui = new IngameUI(_stage);
			
			Resource.RESC_SFX_CROWD.play();
		}
		
		public var _start_time:Number = NaN;
		public var _legit_start_time:Number = NaN;
		public var _last_time:Number = NaN;
		public var _dt:Number = NaN;
		public var _dt_scale:Number = NaN;
		private function update_dt():void {
			var cur_time:Number = ((new Date()).getTime() - _start_time - _legit_start_time);
			_dt = cur_time - _last_time;
			_dt_scale = _dt / 20;
			_last_time = cur_time ;
		}
		
		private var _test_ct:Number = 0;
		private var _test_ct2:Number = 0;
		private var _last_left:Boolean = false, _last_right:Boolean = false, _last_top:Boolean = false;
		
		public function update():void {
			update_dt();
			if (isNaN(_dt)) return;

			// Start the music if it has not been started yet
			if (!_music_has_started && _last_time > 0) {
				_legit_start_time = _last_time;
				_song.music.play();
				_music_has_started = true;
			}
            // TODO: remove debug
            trace(_last_time);
			
			_player.update(this);
			var tar_side:String = "";
			var tar_vec:Vector3D = Vector3D.Z_AXIS.clone();
			var particle_spawn_pos:Vector3D = tar_vec;
			var hit_result:EnemyResult = null;
			// User input
			if (KB.is_key_down(Keyboard.LEFT) && !_last_left) {
				_player.push_tmp_anim(_player.ANIM_PUNCH_LEFT, 10);
				
				tar_side = BaseEnemy.SIDE_LEFT;
				tar_vec = BaseEnemy.POS_LEFT_HIT;
				particle_spawn_pos = new Vector3D(_player.x-100, _player.y - 140,0);
				hit_result = attack_enemy_on_side(particle_spawn_pos, Enemy.SIDE_LEFT);

			} else if (KB.is_key_down(Keyboard.RIGHT) && !_last_right) {
				_player.push_tmp_anim(_player.ANIM_PUNCH_RIGHT, 10);
				
				tar_side = BaseEnemy.SIDE_RIGHT;
				tar_vec = BaseEnemy.POS_RIGHT_HIT;
				particle_spawn_pos = new Vector3D(_player.x+100, _player.y - 140,0);
				hit_result = attack_enemy_on_side(particle_spawn_pos, Enemy.SIDE_RIGHT);
				
			} else if (KB.is_key_down(Keyboard.UP) && !_last_top) {
				_player.push_tmp_anim(_player.ANIM_PUNCH_TOP, 10);
				tar_side = BaseEnemy.SIDE_TOP;
				tar_vec = BaseEnemy.POS_TOP_HIT;
				particle_spawn_pos = new Vector3D(_player.x, _player.y - 250 ,0);
				hit_result = attack_enemy_on_side(particle_spawn_pos, Enemy.SIDE_UP);
				
			}
			
			if (tar_side != "") {
				if (hit_result != null) {
					if (hit_result.type == EnemyResult.TYPE_GREAT || hit_result.type == EnemyResult.TYPE_PERFECT) {
						Resource.RESC_SFX_HIT.play();
					} else if (hit_result.type == EnemyResult.TYPE_OK) {
						Resource.RESC_SFX_HIT_OK.play();
					} else {
						Resource.RESC_SFX_MISS.play();
					}
					
				} else {
					Resource.RESC_SFX_MISS.play();
				}

			}
			
			_last_left = KB.is_key_down(Keyboard.LEFT);
			_last_right = KB.is_key_down(Keyboard.RIGHT);
			_last_top = KB.is_key_down(Keyboard.UP);
			
			// Generate new enemies
			var newEnemies:Array = _song.popAllEnemiesBeforeMoment(_last_time + 4000);
			for each (var enemy:Enemy in newEnemies) {
				var side:String = enemy.sideAsBaseEnemySide();
				var baseEnemy:BaseEnemy = new BaseEnemy(_renderer._context).init(_last_time, _last_time+4000, side);
				enemy.baseEnemy = baseEnemy;
				_enemies.push(baseEnemy);
			}
			
			_layer_objects.length = 0;			
			_ground.move_texture_uv(0.03, _dt_scale);
			for each (var dec:TestDecoration in _decorations) {
				_layer_objects.push(dec);
				dec.update(this);
			}
			
			var itr_enemy:BaseEnemy;
			for (var i_enemy:int = _enemies.length-1; i_enemy >= 0; i_enemy--) {
				itr_enemy = _enemies[i_enemy];
				itr_enemy.update(this);
				if (itr_enemy.should_remove()) {
					itr_enemy.do_remove();
					_enemies.splice(i_enemy, 1);
				} else {
					_layer_objects.push(itr_enemy);
				}
			}
			
			for (var i_particle:int = _ui_particles.length-1; i_particle >= 0; i_particle--) {
				var itr_particle:UIParticle = _ui_particles[i_particle];
				itr_particle.update(this);
				if (itr_particle.should_remove()) {
					itr_particle.do_remove();
					_ui_particles.splice(i_particle, 1);
					_stage.removeChild(itr_particle);
				}
			}
			
			_layer_objects.sort(function(a:S3DObj, b:S3DObj):Number {
				return a._z - b._z;
			});
			
			_ingame_ui.update(this);
		}

		// Arguments:
		//     particle_spawn_pos: A Vector3D object representing the coordinate to spawn particle effects from
		//	   side: A Enemy.SIDE_* constant describing the side of the girl to attack an enemy on.
		public function attack_enemy_on_side(particle_spawn_pos:Vector3D, side:String): EnemyResult {
			var enemyResult:EnemyResult = _song.markEnemy(_last_time, side);
			if (enemyResult) {
				var baseEnemy:BaseEnemy = enemyResult.enemy.baseEnemy;
				baseEnemy.force_remove();
				spawn_death_effect(baseEnemy, particle_spawn_pos);
			}
			return enemyResult;
		}

		private static var STAR_COLORS:Array = [0xff8383,0xffc5c5,0xffc3a5,0xff6e90,0xff2256];
		public function spawn_death_effect(enemy:BaseEnemy, particle_spawn_pos:Vector3D): void {
			for (var i:int = 0; i < 25; i++) {
				var neu_dorito:UIParticle = (new RotatingGravityFadeoutUIParticle(
					particle_spawn_pos.x, 
					particle_spawn_pos.y, 
					30, 
					Resource.RESC_STAR)
				).set_velocity(Util.rand_range(-10, 10), Util.rand_range(-10, 1))
				.set_vr(Util.rand_range(-25, 25))
				.set_scale(Util.rand_range(0.2, 0.8))
				.set_color(STAR_COLORS[Math.floor(Math.random()*STAR_COLORS.length)]);
				
				_ui_particles.push(neu_dorito);
				_stage.addChild(neu_dorito);
			}
			var neu:UIParticle = new FadeoutUIParticle(particle_spawn_pos.x, particle_spawn_pos.y, 20, Resource.RESC_EFFECT_POW);
			_ui_particles.push(neu);
			_stage.addChild(neu);
			
			var neu_popup:UIParticle = new FlyUpFadeoutUIParticle(particle_spawn_pos.x, particle_spawn_pos.y - 40, 30, Resource.RESC_POPUP_EXCELLENT);
			_ui_particles.push(neu_popup);
			_stage.addChild(neu_popup);
		}
	}

}
