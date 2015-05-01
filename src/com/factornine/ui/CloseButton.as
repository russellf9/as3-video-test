package com.factornine.ui {
	import flash.system.System;
	import flash.events.MouseEvent;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	/**
	 * @author factornine
	 */
	public class CloseButton extends Sprite {
		
		private var _radius:Number = 4;
		/**
		 * 
		 */
		public function CloseButton() {
			this.addEventListener(Event.ADDED_TO_STAGE, onReadyHandler);
		}

		private function onReadyHandler(event : Event) : void {
			trace("CloseButton.onReadyHandler(event)");

			var button : Shape = new Shape();
			addChild(button);

			button.graphics.lineStyle(1, 0x121212, 1);
			button.graphics.beginFill(0xEFEFEF, 1);
			button.graphics.drawCircle(0, 0, _radius);
			button.graphics.endFill();
			
			
			this.buttonMode = true;
			
			this.addEventListener(MouseEvent.CLICK, onClickEvent, false, 0, true);
			
				
			
		}

		private function onClickEvent(event : MouseEvent) : void {
			
			trace("CloseButton.onClickEvent(event)");
		}
	}
}
