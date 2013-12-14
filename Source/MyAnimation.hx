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
	private var running:Bool;
	private var inf:Bool;

	public function new (paths:Array<String>, time:Int, infinite:Bool) {
		
		super ();
		lastingTime = time;
		actualImage = 0;
		inf = infinite;
		images = new Array<Bitmap>();
		for(s in paths) {
			images.push(new Bitmap (Assets.getBitmapData (s)));
		}
	}

	public function start(): Void {
		actualImage = 0;
		addChild(images[actualImage]);
		lastTime = Lib.getTimer();
		running = true;
	}

	public function update(): Void {
		var now:Int = Lib.getTimer();
		if(running && (now - lastTime > lastingTime)) {
			removeChild(images[actualImage]);
			actualImage++;
			if(actualImage >= images.length) {
				if(inf) {
					actualImage = 0;
				} else {
					running = false;
					return;
				}
			}
			addChild(images[actualImage]);
			lastTime = now;
		}
	}
	
}
