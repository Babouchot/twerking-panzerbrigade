package;

import flash.events.TimerEvent;
import flash.media.Sound;
import flash.ui.Keyboard;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.Lib;
import flash.display.Stage;

import openfl.Assets;

class MyAnimation extends Sprite {

	private var images:Array<Bitmap>;
	private var lastingTime:Int;
	private var lastTime:Int;
	private var actualImage:Int;
	
	public function new (paths:Array<String>, time:Int) {
		
		super ();
		lastingTime = time;
		actualImage = 0;
		for(s in paths) {
			images.push(new Bitmap (Assets.getBitmapData (s)));
		}
	}

	function start(): Void {
		addChild(images[actualImage]);
		lastTime = Lib.getTimer();
		running = true;
	}

	function update(): Void {
		var now:Int = Lib.getTimer();
		if(running && (now - lastTime > lastingTime) {
			removeChild(images[actualImage]);
			actualImage++;
			if(actualImage > images.length) {
				running = false;
				break;
			}	
			addChild(images[actualImage]);
			lastTime = now;
		}
	}
	
}
