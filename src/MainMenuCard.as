package {
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.display.Graphics;
	import flash.display.Sprite;
	/**
	 * @author spotco
	 */
	public class MainMenuCard extends Sprite {
		
		private var _main:Main;
		
		public function MainMenuCard(main:Main) {
			_main = main;
			
			this.addChild(Resource.RESC_MAINMENUCARD);			
			
			var btn1:Sprite = new Sprite();
			render_button(btn1.graphics, "Weed Circulation", "Hanazawa Kana ft. Snoop Dogg", "(Easy)");
			btn1.x = Util.WID * 0.725;
			btn1.y = Util.HEI * 0.21;
			this.addChild(btn1);
			Util.add_mouse_over(btn1);
			btn1.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				Resource.TAR_SONG_SOUND = Resource.RESC_SONG_WEEDCIRCULATION;
				Resource.TAR_SONG_BEATMAP = Resource.RESC_SONG_WEEDCIRCULATION_BEATMAP;
				exit_menu_to_intro_anim();
			});
			
			btn1 = new Sprite();
			render_button(btn1.graphics, "Days of Dash", "Konomi Suzuki", "(Normal)", 0xDEC776);
			btn1.x = Util.WID * 0.725;
			btn1.y = Util.HEI * 0.41;
			this.addChild(btn1);
			Util.add_mouse_over(btn1);
			btn1.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				Resource.TAR_SONG_SOUND = Resource.RESC_SONG_DAYSOFDASH;
				Resource.TAR_SONG_BEATMAP = Resource.RESC_SONG_DAYSOFDASH_BEATMAP;
				exit_menu_to_intro_anim();
			});
			
			btn1 = new Sprite();
			render_button(btn1.graphics, "Irony", "Claris", "(Insane)", 0xEF843C);
			btn1.x = Util.WID * 0.725;
			btn1.y = Util.HEI * 0.81;
			this.addChild(btn1);
			Util.add_mouse_over(btn1);
			btn1.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				Resource.TAR_SONG_SOUND = Resource.RESC_SONG_DROP;
				Resource.TAR_SONG_BEATMAP = Resource.RESC_SONG_DROP_BEATMAP;
				exit_menu_to_intro_anim();
			});
			
			btn1 = new Sprite();
			render_button(btn1.graphics, "Ikimashou", "YuriYuri", "(Hard)", 0xFF0000);
			btn1.x = Util.WID * 0.725;
			btn1.y = Util.HEI * 0.61;
			this.addChild(btn1);
			Util.add_mouse_over(btn1);
			btn1.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				Resource.TAR_SONG_SOUND = Resource.RESC_SONG_IKIMASHOU;
				Resource.TAR_SONG_BEATMAP = Resource.RESC_SONG_IKIMASHOU_BEATMAP;
				exit_menu_to_intro_anim();
			});
			
			
			var desc:Sprite = new Sprite();
			TextRenderer.render_text(desc.graphics, "Select Song:", Util.WID*0.7, Util.WID*0.02, 20, 0x000000);
			TextRenderer.render_text(desc.graphics, "Arrow keys (left, right, up) to play!", Util.WID*0.1, Util.HEI*0.91, 20, 0x000000);
			this.addChild(desc);
			Util.add_mouse_over(btn1);
			
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.align = "left";
			format.font = "Game";
			format.color = 0x000000;
			
			var credits:TextField = new TextField();
			credits.multiline = true;
			credits.defaultTextFormat = format;
			credits.embedFonts = true;
			credits.width = 300;
			credits.height = 500;
			credits.htmlText = "Game By:\n<a href='http://www.spotcos.com'>Shiny Yang</a>";
			credits.htmlText += "<a href='http://www.davidpmah.com'>David Mah</a>";
			credits.htmlText += "<a href='http://www.cierajohl.com/'>Ciera Johl</a>";
			credits.htmlText += "<a href='http://yasukawamura.carbonmade.com/'>Yasu Kawamura</a>";
			credits.htmlText += "<a href='https://www.facebook.com/kyle.lam.56211'>Kyle Lam</a>";
			credits.htmlText += "<a href='https://www.facebook.com/tkaghan'>Thomas Kaghan</a>";
			
			//this.addChild(credits);
			
			
		}
		
		private function exit_menu_to_intro_anim():void {
			while (_main.numChildren > 0) _main.removeChildAt(0);
			_main.addChild(new IntroCartoon(_main));
		}
		
		private static function render_button(graphics:Graphics, maintext:String, subtext:String, difdesc:String, difcolor:uint = 0x00FF00):void {
			graphics.lineStyle(3,0x000000);
			graphics.beginFill(0xFFFFFF)
			graphics.drawRoundRect(-115, -40, 370, 80, 30);
			graphics.endFill();

			TextRenderer.render_text(graphics, maintext, -30, -30, 25, 0x000000);
			TextRenderer.render_text(graphics, subtext, -30, 5, 13, 0x000000);
			TextRenderer.render_text(graphics, difdesc, -105, -10, 13, difcolor);
		}
		
	}
}
