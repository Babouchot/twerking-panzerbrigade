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

	private var Backgrounds:Array<AnimatedBackground>;
    private var Title:TextField;
	private var speedField:TextField;
	private var pn:Sprite;
	private var Bam:Sound;
	private var time:Int;
	private var whipEffect:MyAnimation;
	private var entities	: Array<Entity>;
	private var player : PlayerNoel;
	private var sound:SoundManager;
	
	public function new () {
		
		super ();
		var stage = Lib.current.stage;
		
		initialize ();
		construct ();
		
		sound = new SoundManager();
		sound.playMusic("nightmare_bc");
		sound.loopSound(sound.grelots, "grelots");

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
		
		for (b in Backgrounds) b.addAsChild(stage);
		
		entities = new Array<Entity>();
		player = new PlayerNoel(stage);
		entities.push(new Child(stage,0));
		//draw all the entities
		for (i in 0...entities.length) {
			addChild(entities[i]);
			entities[i].start();
		}

        stage.addChild (Title);
		speedField.x = stage.stageWidth/2;
        speedField.width = 200;
        speedField.y = 100;
        speedField.selectable = false;
        speedField.text = Std.string(player.speed);
		stage.addChild(speedField);
        stage.addChild (whipEffect);
        stage.addChild(player);
        entities.push(player);
        player.start();
	}
	
	
	private function initialize ():Void {
		
		Title = new TextField ();
		speedField = new TextField();
		
		time = Lib.getTimer();

		var array:Array<String> = new Array<String>();
		array.push("assets/WhipFX-0-1.png");
		array.push("assets/WhipFX-1-1.png");
		array.push("assets/WhipFX-2-1.png");

		whipEffect = new MyAnimation (array, 400, false, false);

		time = 	Lib.getTimer();
		
		// Background
		Backgrounds = new Array<AnimatedBackground>();
		
		var a = new AnimatedBackground(0, 500, "assets/Sky.png", .42, 0);
		Backgrounds.push(a);
		
		a = new AnimatedBackground(0, 100, "assets/Mountains.png", .42, 0);
		Backgrounds.push(a);
		
		a = new AnimatedBackground(0, 50, "assets/Trees.png", .42, 0);
		Backgrounds.push(a);
		
		a = new AnimatedBackground(0, 10, "assets/Village.png", .42, 0);
		Backgrounds.push(a);
		
		a = new AnimatedBackground(a.getHeight(), 10, "assets/Ground.png", .58, .42 /* Depends on Image's Heigth*/);
		Backgrounds.push(a);
	}

	private function resize (newWidth:Int, newHeight:Int):Void {
		for ( b in Backgrounds) b.resize (newWidth, newHeight);
	}

	private function stage_onResize (event:Event):Void {
		resize (stage.stageWidth, stage.stageHeight);
	}

	private function onPress(event:KeyboardEvent):Void {

		for (i in 0...entities.length) {
			entities[i].onPress(event);
		}

		switch(event.keyCode) {
			case Keyboard.SPACE:
				sound.fouet.play();
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
		time = Lib.getTimer();
		for (entity in entities) {
			entity.update(); //update every entity in the level in each frame
		}
		speedField.text = Std.string(player.speed); //update the speed textfield with the new player speed 

		whipEffect.update();
		//ChildGenerator
		if (Std.random(90) % 5 == 0) {
			var child = new Child(stage, Std.random(3));
			entities.push(child);
			stage.addChild(child);
			child.start();
		}
		//Remove the child off the screen
		if (entities[0].x < -100) {
			removeChild(entities[0]);
			entities.splice(0, 1);
		}

		for (b in Backgrounds) b.move(delta, player.speed);
	}
	
}
