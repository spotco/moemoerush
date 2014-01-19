package {
	import models.Song;
	import flash.display.*;
	import flash.geom.*;
	import flash.text.*;
	import flash.utils.*;
	import flash.events.*;
	import com.greensock.TweenLite;
	
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
		
		public function IngameUI(stage:Stage) {
			/*
			var hpBackground:Sprite = new Sprite();
			var hpBackgroundWidth:Number = 500;
			var hpBackgroundHeight:Number = 45;
			var hpBackgroundTopY:Number = 455;
			var hpBackgroundCenterX:Number = 600;
			var hpBackgroundOffsetShear:Number = 50;
			
			var gradientMatrix:Matrix = new Matrix();
			gradientMatrix.createGradientBox(hpBackgroundWidth, hpBackgroundHeight, 0, hpBackgroundWidth / 2, 0);
			hpBackground.graphics.beginGradientFill(GradientType.LINEAR, [0xf2bd36, 0xfff717], [1, 1], [0, 255], gradientMatrix);
			hpBackground.graphics.drawTriangles(Vector.<Number>([hpBackgroundCenterX - hpBackgroundWidth/2 + hpBackgroundOffsetShear, hpBackgroundTopY, hpBackgroundCenterX - hpBackgroundWidth/2, hpBackgroundTopY + hpBackgroundHeight, hpBackgroundCenterX + hpBackgroundWidth/2 + hpBackgroundOffsetShear, hpBackgroundTopY]));
			hpBackground.graphics.drawTriangles(Vector.<Number>([hpBackgroundCenterX - hpBackgroundWidth/2, hpBackgroundTopY + hpBackgroundHeight, hpBackgroundCenterX + hpBackgroundWidth/2, hpBackgroundTopY + hpBackgroundHeight, hpBackgroundCenterX + hpBackgroundWidth/2 + hpBackgroundOffsetShear, hpBackgroundTopY]));
			hpBackground.graphics.beginFill(0xffffff);
			var hpSizeOffset:Number = 20;
			hpBackgroundTopY += hpSizeOffset/2.0;
			hpBackground.graphics.drawTriangles(Vector.<Number>([hpBackgroundCenterX - (hpBackgroundWidth - hpSizeOffset)/2 + hpBackgroundOffsetShear, hpBackgroundTopY, hpBackgroundCenterX - (hpBackgroundWidth - hpSizeOffset*3)/2, hpBackgroundTopY + (hpBackgroundHeight - hpSizeOffset), hpBackgroundCenterX + (hpBackgroundWidth - hpSizeOffset*3)/2 + hpBackgroundOffsetShear, hpBackgroundTopY]));
			hpBackground.graphics.drawTriangles(Vector.<Number>([hpBackgroundCenterX - (hpBackgroundWidth - hpSizeOffset*3)/2, hpBackgroundTopY + (hpBackgroundHeight - hpSizeOffset), hpBackgroundCenterX + (hpBackgroundWidth - hpSizeOffset)/2, hpBackgroundTopY + (hpBackgroundHeight - hpSizeOffset), hpBackgroundCenterX + (hpBackgroundWidth - hpSizeOffset*3)/2 + hpBackgroundOffsetShear, hpBackgroundTopY]));
			stage.addChild(hpBackground);
			
			var scoreBackground:Sprite = new Sprite();
			var scoreBackgroundWidth:Number = 300;
			var scoreBackgroundHeight:Number = 45;
			var scoreBackgroundTopY:Number = 455;
			var scoreBackgroundCenterX:Number = 150;
			
			gradientMatrix.createGradientBox(scoreBackgroundWidth, scoreBackgroundHeight, 0, scoreBackgroundWidth / 2, 0);
			scoreBackground.graphics.beginGradientFill(GradientType.LINEAR, [0xff14de, 0xf2b1e1], [1, 1], [0, 150], gradientMatrix);
			scoreBackground.graphics.drawRoundRect(0, 500 - scoreBackgroundHeight, scoreBackgroundWidth, scoreBackgroundHeight, 10);
			scoreBackground.graphics.beginFill(0xffffff);
			scoreBackground.graphics.drawRoundRect(6, 500 - scoreBackgroundHeight + 6, scoreBackgroundWidth - 12, scoreBackgroundHeight - 12, 10);
			stage.addChild(scoreBackground);
			
			_scoreGradient.graphics.beginGradientFill(GradientType.LINEAR, [0x63f963, 0x56b1f0], [1, 1], [0, 150], gradientMatrix);
			_scoreGradient.graphics.drawRoundRect(7, 500 - scoreBackgroundHeight + 7, scoreBackgroundWidth - 14, scoreBackgroundHeight - 14, 10);
			stage.addChild(_scoreGradient);
			 */
			
			_scoreText.text = "0000";
			_scoreText.x = 20;
			_scoreText.y = 500 - 37;
			_scoreText.width = 260;
			_scoreText.height = 34;
			
			var format:TextFormat = new TextFormat();
			format.size = 30;
			format.align = "right";
			_scoreText.defaultTextFormat = format;
			_scoreText.setTextFormat(format);
			stage.addChild(_scoreText);
			
			var radius:Number = 50;			
			_comboText.text = "×1";
			_comboText.antiAliasType = "advanced";
			_comboText.autoSize = TextFieldAutoSize.CENTER;
			_comboText.width = radius;
			_comboText.height = radius;
			_comboText.x = COMBO_CENTER_X - _comboText.width / 2;
			_comboText.y = COMBO_CENTER_Y - _comboText.height / 2;
			
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
			
			_hpbar_back_tar_y = _hpbar_back.y;
			set_hp_bar_pct(1);
		}
		
		//0.9 -> 0.04
		private var _hpbar_back:Sprite = new Sprite();
		private var _hpbar_fill:Sprite = new Sprite();
		private var _hpbar_back_tar_y:Number;
		public function set_hp_bar_pct(pct:Number):void {
			var real:Number = Resource.RESC_HEALTHBAR_FILL.width * (1-pct);
			
			
			
			_hpbar_fill.graphics.clear();
			_hpbar_fill.graphics.beginBitmapFill(Resource.RESC_HEALTHBAR_FILL.bitmapData);
			_hpbar_fill.graphics.drawRect(real, 0, Resource.RESC_HEALTHBAR_FILL.width * 0.9 - real, Resource.RESC_HEALTHBAR_FILL.height);
			_hpbar_fill.graphics.endFill();
		}
		
		public function updateScore(pointValue:int):void {
			_currentScore = pointValue;
			_scoreText.text = _currentScore.toString();
		}
		
		public function updateComboMultiplier(comboMultiplier:int):void {
			_currentCombo = comboMultiplier;
			_comboText.text = "×" + _currentCombo.toString();
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
			
			/*
			var myColorTransform:ColorTransform = new ColorTransform();
			_blueMultiplier += 0.01 * _blueMultInc;
			if (_blueMultiplier > BLUE_MAX) {
				_blueMultiplier = BLUE_MAX;
				_blueMultInc *= -1;
			} else if (_blueMultiplier < BLUE_MIN) {
				_blueMultiplier = BLUE_MIN;
				_blueMultInc *= -1;
			}
			myColorTransform.blueMultiplier = _blueMultiplier;
			_scoreGradient.transform.colorTransform = myColorTransform;
			*/
			/*
			if (_displayScore < _currentScore) {
				_displayScore ++;
			} else {
				_displayScore = _currentScore;
			}
			_scoreText.text = _displayScore.toString();
			 */
		}
		
	}
}
