package com.factornine.video {
	import com.factornine.ui.CloseButton;

	import flash.display.Sprite;
	import flash.events.AsyncErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;

	/**
	 * @author factornine
	 * 
	 * See: http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/media/Video.html
	 */
	public class F9VideoPlayer extends Sprite {
		private var videoURL : String = "videos/wild_wolves_en.flv";
		private var connection : NetConnection;
		private var _stream : NetStream;
		private var _background : *;
		private var _video : Video;
		private var _closeButton:CloseButton;
		
		// width of video = 384 - therefore 15 margin left and right
		public static var WIDTH: Number = 414;
		
		public static var HEIGHT : Number = 266;
		
		public static var MARGIN : Number = 15;
		
		public static var CURVE : Number = 10;


		/**
		 * The constructor
		 */
		public function F9VideoPlayer() {
			
			// create a `backround` shape
			_background = new Sprite();
			
			_background.graphics.beginFill(0xAAAAAA, 1);		
			_background.graphics.drawRoundRect(0, 0, WIDTH, HEIGHT, CURVE);
			_background.graphics.endFill();
			
			addChild(_background);
			
			// assign the `NetConnection`
			connection = new NetConnection();
			connection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			connection.connect(null);
		}
		
		/**
		 * The handler for the `NetConnection's` status event
		 * 
		 */
		private function netStatusHandler(event : NetStatusEvent) : void {
			switch (event.info.code) {
                case "NetConnection.Connect.Success":
                    connectStream();
                    break;
                case "NetStream.Play.StreamNotFound":
                    trace("Unable to locate video: " + videoURL);
                    break;
				default :
					trace('default: ', event.info);
					break;
            }
		}

		/**
		 * Creates the `stream`, and the `video` to attach it to.
		 */
		private function connectStream() : void {
			_stream = new NetStream(connection);
			_stream.client= {
				onMetaData:onMetaData
			};
            _stream.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            _stream.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
			
            _video = new Video();
            _video.attachNetStream(_stream);
			
            _stream.play(videoURL);
            addChild(_video);
		}

		/**
		 * Handles the metadata event
		 */
		private function onMetaData(item : Object) : void {		
			draw();
		}
		
		/**
		 * Draws the visual assets
		 */
		private function draw() : void {
			
			// the video
			_video.width = 384;
			_video.height = 216;
			
			centerHorizontally(_video);
			
			_video.y = MARGIN;
			
			// close button
			_closeButton = new CloseButton();
			
			addChild(_closeButton);
			
			_closeButton.x = WIDTH - ( MARGIN * 0.5 );
			
			_closeButton.y =  ( MARGIN * 0.5 );
			
			_closeButton.addEventListener(MouseEvent.CLICK, onClickEvent, false, 0, true);
		}

		private function onClickEvent(event : MouseEvent) : void {
			trace("F9VideoPlayer.onClickEvent(event)");
		}

		public function close() : void {
			_closeButton.removeEventListener(MouseEvent.CLICK, onClickEvent);
			
			_stream.close(); 
			//then use vid.clear(), so that the video object can be transparent again.
			_video.clear();
		};
		
		
		

		private function asyncErrorHandler(event : AsyncErrorEvent) : void {
		}
		/**
		 * 
		 */
		private function securityErrorHandler(event : SecurityErrorEvent) : void {
		}
		
		
		/**
		 * Utilities
		 */
		private function centerHorizontally( clip : * ) : void {
			clip.x = ( WIDTH * 0.5 ) - ( clip.width * 0.5 ) ; 
			
		}
		private function centerVertically(clip : *) : void {
			clip.y = ( this.stage.stageHeight * 0.5 ) - ( clip.height * 0.5 ) ; 
		}
	}
}
