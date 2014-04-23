package {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;
	import flash.ui.Keyboard;
    import models.*;
    import misc.*;
    import testsrc.StubModels;
	
	 [SWF(width = "1000", height = "500", frameRate = "60", backgroundColor = "#FFFFFF")]
	 [Frame(factoryClass="Preloader")]
	public class Main extends Sprite {
		
		public var _renderer:S3DRenderer;
		public var _game_engine:S3DGameEngine;
		
		public static var _context:Context3D;
        public var game_timer:Timer;
		
		public static var _stage:Stage;
		
		public function Main():void {
			var fn:Function = function(e:Event) {
				_stage = stage;
				stage.stage3Ds[0].addEventListener( Event.CONTEXT3D_CREATE, function(e:Event):void {
					_context = stage.stage3Ds[0].context3D;
					_context.configureBackBuffer(1000, 500, 1);
					
					_context.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA, Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
					//_context.enableErrorChecking = true;
					_context.setCulling(Context3DTriangleFace.BACK);
					
					init();
				}); 
				stage.stage3Ds[0].requestContext3D();
			}
			
			if (stage == null) {
				this.addEventListener(Event.ADDED_TO_STAGE, fn);
			} else {
				fn(null);
			}
		}
		
		public function init():void {
			new KB(stage);
			this.addChild(new MainMenuCard(this));
			//this.addChild(new IntroCartoon(this));
		}
		
		public function begin_game():void {
            //var song:Song = BeatMapParser.parseBeatmapFile(Resource.RESC_SONG_BEATMAP);
            //song.music = Resource.RESC_SONG_MP3;
            if (Resource.TAR_SONG_BEATMAP == null) {
				trace("tar song is null");
				return;
			}
            var song:Song = BeatMapParser.parseBeatmapFile(Resource.TAR_SONG_BEATMAP);
            song.music = Resource.TAR_SONG_SOUND;
			
			_game_engine = new S3DGameEngine();
			_renderer = new S3DRenderer();
			
            var self:Main = this;
            _renderer.init(stage,_context);
			_game_engine.init(stage, this, _renderer, song);
            game_timer = (new Timer(20));
            game_timer.addEventListener(TimerEvent.TIMER, update);
            game_timer.start();
		}

        public function end_game(): void {
            this.addChild(new EndCard(this));
			_game_engine.dispose();
            game_timer.stop();
        }

        public function lose_game(): void {
            this.addChild(new EndCard(this));
			_game_engine.dispose();
            game_timer.stop();
        }
		
		public function update(e:TimerEvent):void {
			_game_engine.update();
			_renderer.update();
		}
		
	}
	
}
