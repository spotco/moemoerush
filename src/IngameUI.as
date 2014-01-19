package {
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
		}
		
		public function updateScore(pointValue:int):void {
			_currentScore += pointValue * _currentCombo;
			_scoreText.text = _currentScore.toString();
		}
		
		public function updateComboMultiplier(comboMultiplier:int):void {
			_currentCombo = comboMultiplier;
			_comboText.text = "×" + _currentCombo.toString();
			
			_comboText.alpha = 0;
			TweenLite.to(_comboText, 0.3, {alpha:1});
		}
		
		public function resetComboMultiplier():void {
			_currentCombo = 1;
			_comboText.text = "×" + _currentCombo.toString();
		}
		
		public function updateHealth(health:Number):void {
			
		}
		
		public function update(game:S3DGameEngine):void {
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
