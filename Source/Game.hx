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

class Game extends Sprite {

	private var Background:Bitmap;
    private var Title:TextField;
	private var pn:Sprite;
	private var Child:Sprite;
	private var Bam:Sound;
	private var time:Int;
	private var whipEffect:Whip;
	
	
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
		
		addChild (Background);
		addChild (pn);
		addChild (Child);
        addChild (Title);
        addChild (whipEffect);
	}
	
	
	private function initialize ():Void {
		
		Background = new Bitmap (Assets.getBitmapData ("assets/background.jpg"));
		
		pn = new Sprite();
		pn.addChild(new Bitmap (Assets.getBitmapData ("assets/pn.png")));
		
		Child = new Sprite();
		Child.addChild(new Bitmap (Assets.getBitmapData ("assets/child.png")));
		
		Title = new TextField ();
		
		Bam = Assets.getSound("assets/bam.mp3");
		
		time = 	Lib.getTimer();

		whipEffect = new Whip ();
	}

	private function resize (newWidth:Int, newHeight:Int):Void {
		
		Background.width = newWidth;
		Background.height = newHeight;
		
	}
	
	
	private function stage_onResize (event:Event):Void {
		
		resize (stage.stageWidth, stage.stageHeight);
		
	}
	
	
	function onPress(event:KeyboardEvent):Void {
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
				whipEffect.attack(1, 10, 10);
			default:
		}
		
	}
	
	/**
	 * Move sprites depending on delta time
	 * Event called before each render
	 * @param	event
	 */
	function onEnterFrame(event:Event): Void {
		
		var delta:Int = Lib.getTimer() - time;
		Child.x -= delta / 1000;
		whipEffect.updateMe(delta);
	}
	
}
