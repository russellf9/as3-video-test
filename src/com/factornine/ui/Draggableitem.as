package com.factornine.ui {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author factornine
	 */
	public class Draggableitem extends Sprite {
		
		var dropTarget_mc : DisplayObject = null;

		public function Draggableitem() {
			trace("Draggableitem.Draggableitem()");

			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler, false, 0, true);
			
			this.buttonMode = true;
			
		}

		private function mouseDownHandler(e : MouseEvent) : void {
			var obj = e.target;
			obj.startDrag();
		}
		
		private function mouseUpHandler(e : MouseEvent) : void {
				var obj = e.target;
				var target = obj.dropTarget;

				if (target != null && target.parent == dropTarget_mc) {
					trace('target hit');
				}
				obj.stopDrag();
			}
	}
}
