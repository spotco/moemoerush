package {
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
            Resource.RESC_GIRL_END.play();

            this.height = 500;
            this.scaleX = this.scaleY;
			
			if (true) {
				_scoreText.text = "Thanks for playing!";
				_scoreText.x = Util.WID * 2.5;
				_scoreText.y = Util.HEI * 1.5;
				_scoreText.width = 2000;
				_scoreText.height = 2000;
				
				var format:TextFormat = new TextFormat();
				format.size = 90;
				format.align = "right";
				format.font = "Game";
				format.color = 0xFFFFFF;
				_scoreText.embedFonts = true;
				_scoreText.defaultTextFormat = format;
				_scoreText.setTextFormat(format);
				this.addChild(_scoreText);
			}
			
        }
	}
}
