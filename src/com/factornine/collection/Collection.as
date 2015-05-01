package com.factornine.collection {
	import com.factornine.ui.Square;
	import com.factornine.utilities.Style;
	import flash.display.Sprite;

	/**
	 * @author factornine
	 */
	public class Collection extends Sprite {
		public function Collection() {
			
			hide();
			
			createDraggableItems();		
		}
		
		public function createDraggableItems() : void {
			
			// test with singular items first
			var square : Square = new Square( {
				color: Style.DARK_BLUE 
			});
			
			addChild(square);
			
			
		}
		
		public function show(): void{
			this.visible = true;
		}
		public function hide(): void{
			this.visible = false;
		}
	}
}
