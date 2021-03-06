package {
	import flash.media.SoundTransform;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.ui.Keyboard;
	/**
	 * @author spotco
	 */
	public class IntroCartoon extends Sprite{
		
		private var _frames:Array = [];
		private var _i_frame:Number = 0;
		private var _anim_mode:Number = 0; //0 in, 1 hold, 2 out
		private var _anim_ct:Number = 0;
		
		private var _main:Main;
		
		public function IntroCartoon(main:Main) {
			main.stage.addEventListener(Event.ENTER_FRAME, intro_cartoon_update);
			
			_main = main;
			
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0, 0, Util.WID, Util.HEI);
			this.graphics.endFill();
			
			_frames.push(Resource.RESC_INTRO_0);
			this.addChild(Resource.RESC_INTRO_0);
			
			_frames.push(Resource.RESC_INTRO_1);
			this.addChild(Resource.RESC_INTRO_1);
			
			_frames.push(Resource.RESC_INTRO_2);
			this.addChild(Resource.RESC_INTRO_2);
			
			_frames.push(Resource.RESC_INTRO_3);
			this.addChild(Resource.RESC_INTRO_3);
			
			for (var i:int = 0; i < this.numChildren; i++) {
				this.getChildAt(i).alpha = 0;		
			}
			
			var disp:Sprite = new Sprite();
			TextRenderer.render_text(disp.graphics, "Press ESC to skip", 0, 0);
			this.addChild(disp);
		}
		
		public function intro_cartoon_update(e:Event):void {
			if (KB.is_key_down(Keyboard.ESCAPE)) _i_frame = 9999;
			if (_i_frame < this.numChildren - 1) {
				var cur_frame:Bitmap = this.getChildAt(_i_frame) as Bitmap;
				if (_anim_mode == 0) {
					cur_frame.alpha = Math.min(cur_frame.alpha+0.05,1);
					if (cur_frame.alpha == 1) {
						_anim_mode = 1;
						_anim_ct = 75;
						
						if (_i_frame == 0) {
							Resource.RESC_SFX_CROWD.play(0,0,new SoundTransform(0.5));
							_anim_ct = 150;
								
						} else if (_i_frame == 1) {
							Resource.RESC_SFX_CROWD.play(0,0,new SoundTransform(0.2));
							// Resource.RESC_SFX_HAI.play();
                            Resource.RESC_FIRST_GIRL.play();
							_anim_ct = 400;
							
						} else if (_i_frame == 2) {
							Resource.RESC_SFX_CROWD.play(0,0,new SoundTransform(0.5));
							_anim_ct = 200;
							
						} else if (_i_frame == 3) {
							// Resource.RESC_SFX_WHATTHEHELL.play();
                            Resource.RESC_SERGEANT.play();
							_anim_ct = 170;
							
						}
						
					}
					
				} else if (_anim_mode == 1) {
					_anim_ct--;
					if (_anim_ct <= 0) {
						_anim_mode = 2;
					}
					
				} else if (_anim_mode == 2) {
					cur_frame.alpha = Math.max(cur_frame.alpha-0.05, 0);
					if (cur_frame.alpha == 0) {
						_i_frame++;
						_anim_mode = 0;
					}
				}
				
			} else {
				_main.stage.removeEventListener(Event.ENTER_FRAME, intro_cartoon_update);
				while (_main.numChildren > 0) _main.removeChildAt(0);
				_main.begin_game();
				
			}
			
		}
		
	}
}
