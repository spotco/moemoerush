package  {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	public class TextRenderer {
	
		static var tf:TextField = new TextField();
		
		
		
		public static function render_text(tar:Graphics, text:String, x:Number, y:Number, fontsize:Number = 12) {
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.textColor = 0xFFFFFF;
			tf.defaultTextFormat = new TextFormat(null, fontsize);
			tf.text = text;
			var text_bitmap:BitmapData = new BitmapData(tf.width, tf.height, true, 0x00000000);
			text_bitmap.draw(tf);
			//trace(tf.textWidth);
			//trace(tf.textHeight);
			
			var typeTextTranslationX:Number =  x;
			var typeTextTranslationY:Number = y;
			var matrix:Matrix = new Matrix();
			matrix.translate(typeTextTranslationX, typeTextTranslationY);
			
			tar.lineStyle();
			tar.beginBitmapFill(text_bitmap, matrix, true, true);
			tar.drawRect(typeTextTranslationX, typeTextTranslationY, tf.width, tf.height);
			tar.endFill();
		}
		
	}

}