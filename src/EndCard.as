package {
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.media.SoundTransform;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.display.Sprite;

	public class EndCard extends Sprite{
		
		private var _main:Main;
		public var _scoreText:TextField = new TextField();
		public function EndCard(main:Main) {
            _main = main;
			
            trace("end card added");
			this.addChild(Resource.RESC_END_CARD);
			var t:Timer = new Timer(500,1);
			t.addEventListener(TimerEvent.TIMER, function(e:TimerEvent){
				Resource.RESC_GIRL_END.play(0,0,new SoundTransform(0.6));
			});
			t.start();
			Resource.RESC_SFX_END_JINGLE.play(0,0,new SoundTransform(0.6));
			
			var total:Number = S3DGameEngine.CT_PERFECT + S3DGameEngine.CT_GOOD+S3DGameEngine.CT_OK + S3DGameEngine.CT_MISS;
			var rank:String = "Failed";
			if (!S3DGameEngine.DID_FAIL) {
				if (S3DGameEngine.CT_PERFECT/total > 0.9) {
					rank = "A+";					
				} else if (S3DGameEngine.CT_PERFECT/total > 0.8) {
					rank = "A";
				} else if (S3DGameEngine.CT_PERFECT/total > 0.7) {
					rank = "B";
				} else if (S3DGameEngine.CT_PERFECT/total > 0.6) {
					rank = "C";
				} else {
					rank = "F";
				}
			}
			
			_scoreText.text = "Thanks for playing!\n\nScore:"+S3DGameEngine.SCORE+
			"\n\nPerfect:"+S3DGameEngine.CT_PERFECT+
			"\nGreat:"+S3DGameEngine.CT_GOOD+
			"\nOk:"+S3DGameEngine.CT_OK+
			"\n\nMax Combo: "+S3DGameEngine.CT_MAX_COMBO+
			"\n\nRank: "+rank;
			
			_scoreText.x = Util.WID * 0.65;
			_scoreText.y = Util.HEI * 0.05;
			_scoreText.width = 300;
			_scoreText.height = 300;
			
			var format:TextFormat = new TextFormat();
			format.size = 21;
			format.align = "right";
			format.font = "Game";
			format.color = 0xFFFFFF;
			_scoreText.embedFonts = true;
			_scoreText.defaultTextFormat = format;
			_scoreText.setTextFormat(format);
			this.addChild(_scoreText);
			
			var btn:Sprite = new Sprite();
			btn.x = Util.WID*0.85;
			btn.y = Util.HEI*0.75;
			btn.graphics.lineStyle(3,0x000000);
			btn.graphics.beginFill(0xFFFFFF)
			btn.graphics.drawRoundRect(-100, -40, 200, 80, 30);
			btn.graphics.endFill();
			TextRenderer.render_text(btn.graphics, "Main Menu", -85, -20, 25, 0x000000);
			Util.add_mouse_over(btn);
			btn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
				while (_main.numChildren > 0) _main.removeChildAt(0);
				_main.addChild(new MainMenuCard(_main));
			}) ;
			this.addChild(btn);
			
        }
	}
}
