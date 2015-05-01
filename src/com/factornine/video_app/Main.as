package com.factornine.video_app {
	import com.factornine.collection.Collection;
	import com.factornine.ui.Square;
	import com.factornine.video.F9VideoPlayer;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;


	/**
	 * See: http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/media/Video.html
	 */
	public class Main extends Sprite {
		
		private var _player : F9VideoPlayer;
		private var _collection : Collection;
		
		
		
		
		
		/**
		 * A simple test for video in AS3
		 */
		public function Main() {
			this.addEventListener( Event.ADDED_TO_STAGE, onReadyHandler );
		}

		private function onReadyHandler(event : Event) : void {
			create();
		}

		private function create() : void {
			
			// 384 x 216
			_player = new F9VideoPlayer();
			
			addChild(_player);
			
			centerHorizontally( _player );
			
			centerVertically( _player );
			
			_player.addEventListener(MouseEvent.CLICK, onClickEvent, false, 0, true);
			
			// collection
			_collection = new Collection();
			
			addChild(_collection);
		}
		
		private function onClickEvent(event : MouseEvent) : void {
			
			trace("Main.onClickEvent(event)");
			
			closeVideo();
			
			openDraggableItems();
		}

		private function openDraggableItems() : void {
			
			_collection.show();
		}

		private function closeVideo() : void {
			_player.close();
			this.removeChild(_player);
		}

		
		
		private function centerHorizontally( clip : * ) : void {
			clip.x = ( this.stage.stageWidth * 0.5 ) - ( clip.width * 0.5 ) ; 
			
		}
		private function centerVertically(clip : *) : void {
			clip.y = ( this.stage.stageHeight * 0.5 ) - ( clip.height * 0.5 ) ; 
		}

		

	}
}
