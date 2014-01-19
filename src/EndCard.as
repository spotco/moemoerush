package {
	import flash.media.SoundTransform;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.display.Sprite;

	public class EndCard extends Sprite{
		
		private var _main:Main;
		
		public function EndCard(main:Main) {
            _main = main;
            trace("end card added");
			this.addChild(Resource.RESC_END_CARD);
            Resource.RESC_GIRL_END.play();

            this.height = 500;
            this.scaleX = this.scaleY;
        }
	}
}
