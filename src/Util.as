package  {
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class Util {
		
		public static var WID:Number = 1000;
		public static var HEI:Number = 500;
		
		public static function round_dec(numIn:Number, decimalPlaces:int):Number {
			var nExp:int = Math.pow(10,decimalPlaces) ;
			var nRetVal:Number = Math.round(numIn * nExp) / nExp
			return nRetVal;
		}
		
		public static function sig_n(chk:Number,val:Number=1):Number {
			if (chk < 0) {
				return -val;
			} else if (chk > 0) {
				return val;
			} else {
				return val;
			}
		}
		
		public static function d2r(d:Number):Number {
			return d * (Math.PI / 180);
		}
		
		public static function r2d(r:Number):Number {
			return r * (180 / Math.PI);
		}
		
		public static function rand_range(min:Number, max:Number):Number {
			return Math.random() * (max - min) + min;
		}

        public static function assert(expression:Boolean, description:String = ""):void
        {
            if (!expression)
                throw new Error("Assertion failed! " + description);
        }
	}
}
