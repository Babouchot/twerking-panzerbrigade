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

class Game extends Sprite { //}

	private var Backgrounds:Array<AnimatedBackground>;
    private var Title:TextField;
	private var pn:Sprite;
	private var Child:Sprite;
	private var Bam:Sound;
	private var time:Int;
	
	
	public function new () {
		
		super ();
		var stage = Lib.current.stage;
		
		initialize ();
		construct ();
		
		resize (stage.stageWidth, stage.stageHeight);
		stage.addEventListener (Event.RESIZE, stage_onResize);
		stage.addEventListener (KeyboardEvent.KEY_DOWN, onPress);
		stage.addEventListener (Event.ENTER_FRAME, onEnterFrame);
	}

	private function construct ():Void {
		var stage = Lib.current.stage;
		
        Title.x = stage.stageWidth/2;
        Title.width = 200;
        Title.y = 12;
        Title.selectable = false;
        Title.text = "Ceci est le titre de Game";

		pn.scaleX = 0.3;
		pn.scaleY = 0.3;
		pn.x = 15;
		pn.y = stage.stageHeight - pn.height - 10;
		
		Child.x = stage.stageWidth  + 10;
		Child.y = stage.stageHeight / 2;
		
		for (b in Backgrounds) b.addAsChild(stage);
		
		stage.addChild (pn);
		stage.addChild (Child);
        stage.addChild (Title);	
	}
	
	
	private function initialize ():Void {
		
		pn = new Sprite();
		pn.addChild(new Bitmap (Assets.getBitmapData ("assets/pn.png")));
		
		Child = new Sprite();
		Child.addChild(new Bitmap (Assets.getBitmapData ("assets/child.png")));
		
		Title = new TextField ();
		
		Bam = Assets.getSound("assets/bam.mp3");
		
		time = 	Lib.getTimer();
		
		// Background
		Backgrounds = new Array<AnimatedBackground>();
		
		var a = new AnimatedBackground(0, 500, "assets/hills.png");
		Backgrounds.push(a);
		
		a = new AnimatedBackground(0, 100, "assets/houses.png");
		Backgrounds.push(a);
		
		a = new AnimatedBackground(0, 10, "assets/track.png");
		Backgrounds.push(a);
		
	}

	private function resize (stageWidth:Int, stageHeight:Int) {
		for ( b in Backgrounds) b.resize (stageWidth, stageHeight);
	}
	private function stage_onResize (event:Event):Void {
		resize (stage.stageWidth, stage.stageHeight);
	}
	
	
	private function onPress(event:KeyboardEvent):Void {
		switch(event.keyCode) {
			case Keyboard.UP:
				var min = 0;
				pn.y -= 10;
				if (pn.y < min) pn.y = 0;
			case Keyboard.DOWN:
				var max = stage.stageHeight - pn.height;
				pn.y += 10;
				if (pn.y > max) pn.y = max;
			case Keyboard.SPACE:
				Bam.play();
			default:
		}
		
	}
	
	/**
	 * Move sprites depending on delta time
	 * Event called before each render
	 * @param	event
	 */
	private function onEnterFrame(event:Event): Void {
		// Time difference with last frame rendering
		var delta = Lib.getTimer() - time;
		// Save actual time
		time = Lib.getTimer();
		
		Child.x -= delta / 6;
		
		for (b in Backgrounds) b.move(delta, 15/* TODO SPEED SANTA CLAUS*/);
		
	}
	
}
