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

	public var images:Array<Bitmap>;
	public var lastingTime:Int;
	private var lastTime:Int;
	private var actualImage:Int;
	public var running:Bool;
	private var inf:Bool;
	private var pause:Bool;
	private var first:Bool;
	//private var mstage:Stage;

	public function new (paths:Array<String>, time:Int, infinite:Bool, firstImageStop:Bool) {
		
		super ();
		lastingTime = time;
		actualImage = 0;
		inf = infinite;
		images = new Array<Bitmap>();
		//mstage=Lib.current.stage;
		first = firstImageStop;
		if(firstImageStop)
			pause = true;
		else
			pause = false;
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

	public function restart(): Void {
		pause = false;
		running = true;
	}

	public function update(): Void {
		var now:Int = Lib.getTimer();
		if(!pause && running && (now - lastTime > lastingTime)) {
			removeChild(images[actualImage]);
			actualImage++;
			if(actualImage >= images.length) {
				if(inf) {
					actualImage = 0;
					if(first) {
						pause = true;
						addChild(images[actualImage]);
					}	
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
