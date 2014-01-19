package gameobjects {
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class PlayerGirl extends Sprite{
	
		public function PlayerGirl() {}
		
		private var _image_anchor:Sprite = new Sprite();
		private static var IMG_ANCHOR_SCALING_CONSTANT:Number = 0.55;
				
		public function init():void {
			this.x = Util.WID * 0.5;
			this.y = Util.HEI * 0.925;
			
			this.addChild(_image_anchor);
			
			var imgwid:Number = Resource.RESC_GIRL_RUN_0.width;
			var imghei:Number = Resource.RESC_GIRL_RUN_0.height;
			
			_image_anchor.scaleX = _image_anchor.scaleY = IMG_ANCHOR_SCALING_CONSTANT;
			_image_anchor.x = -0.5 * imgwid * IMG_ANCHOR_SCALING_CONSTANT;
			_image_anchor.y = -imghei * IMG_ANCHOR_SCALING_CONSTANT;
			
			_image_anchor.addChild(Resource.RESC_GIRL_RUN_0);
			
			anim_init();
		}
		
		private var WALK_CYCLE:Vector.<Bitmap> = new Vector.<Bitmap>();
		private static var WALK_CYCLE_SPEED:Number = 4;
		private var _i_walk_cycle:Number = 0;
		private var _ct_walk_cycle:Number = WALK_CYCLE_SPEED;
		
		public var ANIM_PUNCH_LEFT:Vector.<Bitmap> = new Vector.<Bitmap>();
		public var ANIM_PUNCH_RIGHT:Vector.<Bitmap> = new Vector.<Bitmap>();
		
		public var ANIM_PUNCH_TOP:Vector.<Bitmap> = new Vector.<Bitmap>();
		private var ANIM_PUNCH_TOP_ALT:Vector.<Bitmap> = new Vector.<Bitmap>();
		public var ANIM_HIT:Vector.<Bitmap> = new Vector.<Bitmap>();
		
		private function anim_init():void {
			WALK_CYCLE.push(
				Resource.RESC_GIRL_RUN_0,
				Resource.RESC_GIRL_RUN_1,
				Resource.RESC_GIRL_RUN_2,
				Resource.RESC_GIRL_RUN_3,
				Resource.RESC_GIRL_RUN_4,
				Resource.RESC_GIRL_RUN_5,
				Resource.RESC_GIRL_RUN_6,
				Resource.RESC_GIRL_RUN_7,
				Resource.RESC_GIRL_RUN_8,
				Resource.RESC_GIRL_RUN_9,
				Resource.RESC_GIRL_RUN_10,
				Resource.RESC_GIRL_RUN_11
			);
			ANIM_PUNCH_LEFT.push(Resource.RESC_GIRL_PUNCH_LEFT_0);
			ANIM_PUNCH_RIGHT.push(Resource.RESC_GIRL_PUNCH_RIGHT_0);
			ANIM_PUNCH_TOP.push(Resource.RESC_GIRL_PUNCH_UP_0);
			ANIM_PUNCH_TOP_ALT.push(Resource.RESC_GIRL_PUNCH_UP_1);
			ANIM_HIT.push(Resource.RESC_GIRL_HIT_0);
		}
		
		private var _punch_top_alternator:Number = 0;
		public var _ct_tmp_anim:Number = 0;
		public var _ct_total_tmp_anim:Number = 0;
		public var _tmp_anim_frames:Vector.<Bitmap>;
		public function push_tmp_anim(anim:Vector.<Bitmap>, duration:Number):void {
			if (anim == ANIM_PUNCH_TOP) {
				_punch_top_alternator++;
				if (_punch_top_alternator%2==0) {
					_tmp_anim_frames = ANIM_PUNCH_TOP_ALT;
				} else {
					_tmp_anim_frames = anim;
				}
				
			} else {
				_tmp_anim_frames = anim;
			}
			_ct_tmp_anim = duration;
			_ct_total_tmp_anim = duration;
			
		}
		
		private function anim_update(dt_scale:Number):void {
			if (_ct_tmp_anim > 0) {
				_ct_tmp_anim -= dt_scale;
				while (_image_anchor.numChildren > 0) _image_anchor.removeChildAt(0);
				
				if (_ct_tmp_anim > 0) {
					var i_tmp_anim:int = _tmp_anim_frames.length - 1 - Math.floor(_ct_tmp_anim/_ct_total_tmp_anim * _tmp_anim_frames.length);
					if (i_tmp_anim < 0 || i_tmp_anim >= _tmp_anim_frames.length) {
						trace("err with i_tmp_anim, it's ",i_tmp_anim);
						i_tmp_anim = 0;
					}
					_image_anchor.addChild(_tmp_anim_frames[i_tmp_anim]);
					
				} else {
					_image_anchor.addChild(WALK_CYCLE[_i_walk_cycle]);
					
				}
				
			} else {
				_ct_walk_cycle -= dt_scale;
				if (_ct_walk_cycle <= 0) {
					_ct_walk_cycle = WALK_CYCLE_SPEED + (_ct_walk_cycle);
					_i_walk_cycle=(_i_walk_cycle+1)%(WALK_CYCLE.length);
					
					while (_image_anchor.numChildren > 0) _image_anchor.removeChildAt(0);
					_image_anchor.addChild(WALK_CYCLE[_i_walk_cycle]);
				}
				
			}
		}
		
		public function update(game:S3DGameEngine):void {
			anim_update(game._dt_scale);
		}
		
	}
}
