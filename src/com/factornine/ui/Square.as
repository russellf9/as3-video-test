package com.factornine.ui {
	import flash.display.Sprite;

	/**
	 * @author factornine
	 */
	public class Square extends Draggableitem {
		
		public static var WIDTH: Number = 100;
		
		public static var HEIGHT : Number = 75;
		
		public static var MARGIN : Number = 15;
		
		public static var CURVE : Number = 10;
		
		private var _color:Number = 0x333333;
		
		
		public function Square( obj:Object = null) {
			
			super();
			
			if(obj.color) {
				_color = obj.color;
			}
			
			// 1 create shape
			var _background :Sprite = new Sprite();
			
			
			_background.graphics.beginFill(_color, 1);		
			_background.graphics.drawRoundRect(0, 0, WIDTH, HEIGHT, CURVE);
			_background.graphics.endFill();
			
			addChild(_background);
		}
	}
}
