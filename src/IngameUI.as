package {
	import models.Song;
	import flash.display.*;
	import flash.geom.*;
	import flash.text.*;
	import flash.utils.*;
	import flash.events.*;
	import com.greensock.TweenLite;
	import models.*;
	
	/**
	 * @author spotco
	 */
	public class IngameUI {
		
		private var _scoreGradient:Sprite = new Sprite();
		private var BLUE_MAX:Number = 2.0;
		private var BLUE_MIN:Number = 0.8;
		private var _blueMultiplier:Number = 1.0;
		private var _blueMultInc:int = 1;
		
		public var _scoreText:TextField = new TextField();
		public var _currentScore:int = 0;
		private var _displayScore:int = 0;
		
		public var _comboText:TextField = new TextField();
		public var _currentCombo:int = 2;
		private var COMBO_CENTER_X:Number = 50;
		private var COMBO_CENTER_Y:Number = 350;
		
		public function clear():void {
			if (_comboText.parent != null) _comboText.parent.removeChild(_comboText);
			if (_scoreText.parent != null) _scoreText.parent.removeChild(_scoreText);
			if (_hpbar_back.parent != null) _hpbar_back.parent.removeChild(_hpbar_back);
			if (Resource.RESC_COMBOTOAST.parent != null) Resource.RESC_COMBOTOAST.parent.removeChild(Resource.RESC_COMBOTOAST); 
		}
		
		public function IngameUI(stage:Stage) {
			_scoreText.text = "00000000";
			_scoreText.x = Util.WID * 0.73;
			_scoreText.y = Util.HEI * 0.83;
			_scoreText.width = 260;
			_scoreText.height = 34;
			
			var format:TextFormat = new TextFormat();
			format.size = 25;
			format.align = "right";
			format.font = "Game";
			format.color = 0xFFFFFF;
			_scoreText.embedFonts = true;
			_scoreText.defaultTextFormat = format;
			_scoreText.setTextFormat(format);
			stage.addChild(_scoreText);
			
			Resource.RESC_COMBOTOAST.x = Util.WID*0;
			Resource.RESC_COMBOTOAST.y = Util.HEI*0.83;
			stage.addChild(Resource.RESC_COMBOTOAST);
			
			var radius:Number = 50;			
			_comboText.text = "×1";
			_comboText.antiAliasType = "advanced";
			_comboText.autoSize = TextFieldAutoSize.CENTER;
			_comboText.width = radius*2;
			_comboText.height = radius*2;
			_comboText.embedFonts = true;
			_comboText.x = COMBO_CENTER_X - _comboText.width / 2;
			_comboText.y = Util.HEI*0.93;
			
			format.size = 30;
			format.align = "center";
			format.color = 0xFFFFFF;
			_comboText.defaultTextFormat = format;
			_comboText.setTextFormat(format);
			stage.addChild(_comboText);
			
			stage.addChild(_hpbar_back);
			_hpbar_back.addChild(_hpbar_fill);
			
			_hpbar_back.x = Util.WID - Resource.RESC_HEALTHBAR_BACK.width;
			_hpbar_back.y = Util.HEI - Resource.RESC_HEALTHBAR_BACK.height;
			
			_hpbar_back.graphics.beginBitmapFill(Resource.RESC_HEALTHBAR_BACK.bitmapData);
			_hpbar_back.graphics.drawRect(0, 0, Resource.RESC_HEALTHBAR_BACK.width, Resource.RESC_HEALTHBAR_BACK.height);
			_hpbar_back.graphics.endFill();
		}
		
		//0.9 -> 0.04
		private var _hpbar_back:Sprite = new Sprite();
		private var _hpbar_fill:Sprite = new Sprite();
		private var _hpbar_back_tar_y:Number = Util.HEI - Resource.RESC_HEALTHBAR_BACK.height;
		public function set_hp_bar_pct(pct:Number):void {
			var real:Number = Resource.RESC_HEALTHBAR_FILL.width * (1-pct);
			
			_hpbar_fill.graphics.clear();
			_hpbar_fill.graphics.beginBitmapFill(Resource.RESC_HEALTHBAR_FILL.bitmapData);
			_hpbar_fill.graphics.drawRect(real, 0, Resource.RESC_HEALTHBAR_FILL.width * 0.9 - real, Resource.RESC_HEALTHBAR_FILL.height);
			_hpbar_fill.graphics.endFill();
		}
		
		public function updateScore(pointValue:int):void {
			_scoreText.text = pointValue + "";
		}
		
		public function updateComboMultiplier(comboMultiplier:int):void {
			if (_currentCombo != comboMultiplier) {
				_currentCombo = comboMultiplier;
				_comboText.text = "×" + _currentCombo;
				
				var ghostComboText:TextField = new TextField();
				ghostComboText.x = _comboText.x;
				ghostComboText.y = _comboText.y - 150;
				ghostComboText.width = _comboText.width;
				ghostComboText.height = _comboText.height;
				ghostComboText.antiAliasType = "advanced";
				ghostComboText.text = _comboText.text;
				ghostComboText.alpha = 0;
				
				var format:TextFormat = new TextFormat();
				format.size = 60;
				format.align = "center";
				format.color = 0xFFFFFF;
				ghostComboText.defaultTextFormat = format;
				ghostComboText.setTextFormat(format);
				_comboText.parent.addChild(ghostComboText);
				
				TweenLite.to(ghostComboText, 0.3, {alpha:1, y:_comboText.y, onComplete:ghostComboText.parent.removeChild, onCompleteParams:[ghostComboText]});
			}
		}
		
		public function resetComboMultiplier():void {
			_currentCombo = 1;
			_comboText.text = "×" + _currentCombo;
		}
		
		private var _last_hpval:Number = 0;
		public function updateHealth(health:Number):void {
			// Max possible value is stored at Song.MAX_HEALTH
			if (_last_hpval != health*1.0 / Song.MAX_HEALTH) {
				_hpbar_back.y -= 15;
			}
			_last_hpval = health*1.0 / Song.MAX_HEALTH;
			this.set_hp_bar_pct(_last_hpval);			
		}
		
		public function update(game:S3DGameEngine):void {
			_hpbar_back.y = (_hpbar_back_tar_y - _hpbar_back.y)*0.5 + _hpbar_back.y;
		}
		
	}
}
