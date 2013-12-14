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

	private var Background:Bitmap;
    private var Title:TextField;
	private var speedField:TextField;
	private var pn:Sprite;
	private var Bam:Sound;
	private var time:Int;
	private var whipEffect:MyAnimation;
	private var entities	: Array<Entity>;
	private var player : PlayerNoel;
	
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

		entities = new Array<Entity>();
		player = new PlayerNoel(stage);
		entities.push(player);
		entities.push(new Child(stage,0));
		/*
		pn.scaleX = 0.3;
		pn.scaleY = 0.3;
		pn.x = 15;
		pn.y = stage.stageHeight - pn.height - 10;
		
		
		Child.x = stage.stageWidth  + 10;
		Child.y = stage.stageHeight / 2;
		*/
		addChild (Background);
		
		//draw all the entities
		for (i in 0...entities.length) {
			addChild(entities[i]);
			entities[i].start();
		}
		
		//addChild (pn);
		//addChild(Child);
        addChild (Title);
		speedField.x = stage.stageWidth/2;
        speedField.width = 200;
        speedField.y = 100;
        speedField.selectable = false;
        speedField.text = Std.string(player.speed);
		addChild(speedField);
        addChild (whipEffect);
	}
	
	
	private function initialize ():Void {
		
		Background = new Bitmap (Assets.getBitmapData ("assets/background.jpg"));
		
		Title = new TextField ();
		speedField = new TextField();
		
		Bam = Assets.getSound("assets/bam.mp3");
		
		time = Lib.getTimer();

		var array:Array<String> = new Array<String>();
		array.push("assets/WhipFX-0-1.png");
		array.push("assets/WhipFX-1-1.png");
		array.push("assets/WhipFX-2-1.png");

		whipEffect = new MyAnimation (array, 400, false);
	}

	private function resize (newWidth:Int, newHeight:Int):Void {
		
		Background.width = newWidth;
		Background.height = newHeight;
		
	}
	
	
	private function stage_onResize (event:Event):Void {
		
		resize (stage.stageWidth, stage.stageHeight);
		
	}
	
	
	function onPress(event:KeyboardEvent):Void {
		for (i in 0...entities.length) {
			entities[i].onPress(event);
		}
		switch(event.keyCode) {
			/*
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
				*/
			default:
				
		}
		
	}
	
	/**
	 * Move sprites depending on delta time
	 * Event called before each render
	 * @param	event
	 */
	function onEnterFrame(event:Event): Void {		
		
		var delta = Lib.getTimer() - time;

		for (entity in entities) {
			entity.update(); //update every entity in the level in each frame
		}
		speedField.text = Std.string(player.speed); //update the speed textfield with the new player speed 
		//Child.x -= delta / 1000;
		whipEffect.update();
		
		
		//ChildGenerator
		if (Std.random(90) % 5 == 0) {
			var child = new Child(stage, Std.random(3));
			entities.push(child);
			addChild(child);
			child.start();
		}
		//Remove the child off the screen
		if (entities[1].x < 0) {
			removeChild(entities[1]);
			entities.splice(1, 1);
		}
	}
	
}
