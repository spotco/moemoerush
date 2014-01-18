package {
	import flash.display.Stage;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;
	
	public class KB {
		
		private static var INST:KB;
		
		public var _keys_down:Vector.<uint> = new Vector.<uint>();
		
		public function KB(stage:Stage) {
			INST = this;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		public static function is_key_down(k:uint):Boolean {
			return INST._keys_down.indexOf(k) != -1;
		}
		
		private function onKeyPress(e:KeyboardEvent):void {
			_keys_down.push(e.keyCode);
		}
		
		private function onKeyUp(e:KeyboardEvent):void {
            while (_keys_down.indexOf(e.keyCode) != -1) {
                    _keys_down.splice(_keys_down.indexOf(e.keyCode),1);
            }
		}
		
	}
}
