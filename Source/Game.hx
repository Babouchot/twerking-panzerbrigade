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

	private var Plans:Array<Sprite>;
	private var Backgrounds:Array<AnimatedBackground>;
	private var speedField:TextField;
	private var pn:Sprite;
	private var Bam:Sound;
	private var time:Int;
	private var whipEffect:Whip;
	private static var entities	: Array<Child>;
	private var player : PlayerNoel;
	private var sound:SoundManager;
	private var attacking :Bool;
	
	public function new () {
		
		super ();
		var stage = Lib.current.stage;
		
		initialize ();
		construct ();
		
		sound = SoundManager.get_instance();
		sound.gameMusicLoop();
		sound.loopSound(sound.grelots, "grelots");

		resize (stage.stageWidth, stage.stageHeight);
		stage.addEventListener (Event.RESIZE, stage_onResize);
		stage.addEventListener (KeyboardEvent.KEY_DOWN, onPress);
		stage.addEventListener (Event.ENTER_FRAME, onEnterFrame);
	}

	private function construct ():Void {
		var stage = Lib.current.stage;
		var sprite = new Sprite();
		
		// bg
		for (b in Backgrounds) b.addAsChild(sprite);
		Plans.push(sprite);
		
		// Children
		sprite = new Sprite();
		entities = new Array<Child>();
		Plans.push(sprite);
		
		// Santa
		sprite = new Sprite();
		player = new PlayerNoel(stage);
		sprite.addChild (whipEffect);
        sprite.addChild(player);
        player.start();
		Plans.push(sprite);
		
		// Speedfield
		sprite = new Sprite();
		speedField.x = stage.stageWidth/2;
        speedField.width = 200;
        speedField.y = 100;
        speedField.selectable = false;
        speedField.text = Std.string(player.speed);
		sprite.addChild(speedField);
		Plans.push(sprite);
		
		
		
		
		/////////////////////////////////////////////////////////////
		//////// ADDING SPRITE LAYERS TO STAGE NOTHING ELSE ////////
		///////////////////////////////////////////////////////////
		for (p in Plans) stage.addChild(p);
		
	}
	
	
	private function initialize ():Void {
		attacking = false;
		speedField = new TextField();
		
		time = Lib.getTimer();

		// Whip Effects
		var array:Array<String> = new Array<String>();
		array.push("assets/WhipFX-0-1.png");
		array.push("assets/WhipFX-1-1.png");
		array.push("assets/WhipFX-2-1.png");

		var array2:Array<String> = new Array<String>();
		array2.push("assets/WhipFX-0-2.png");
		array2.push("assets/WhipFX-1-2.png");
		array2.push("assets/WhipFX-2-2.png");

		var array3:Array<String> = new Array<String>();
		array3.push("assets/WhipFX-0-3.png");
		array3.push("assets/WhipFX-1-3.png");
		array3.push("assets/WhipFX-2-3.png");

		whipEffect = new Whip (array, array2, array3);
		
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
		
		Plans = new Array<Sprite>();
	}

	private function resize (newWidth:Int, newHeight:Int):Void {
		for ( b in Backgrounds) b.resize (newWidth, newHeight);
	}

	private function stage_onResize (event:Event):Void {
		resize (stage.stageWidth, stage.stageHeight);
	}

	private function onPress(event:KeyboardEvent):Void {

		player.onPress(event);

		if (event.keyCode == Keyboard.SPACE) {
			attacking = true;
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
		for(a in entities) {
			if (a.x < -100) {
				removeChild(a);
				entities.remove(a);
			}
		}
		
		//Whip attack
		if (attacking) {
			for (entity in entities) {
				if (entity.WhipOverlaps(player.lane, Std.int(player.animatedWhip.images[0].bitmapData.width * player.scaleX))) {
					//remove the child from the stage in a bloody way
					whipEffect.effect(0, Std.int(entity.x), Std.int(entity.y), entity.scaleX, entity.scaleY);
					entities.remove(entity);
					stage.removeChild(entity);
				}
			}
			attacking = false;
		}
		for (b in Backgrounds) b.move(delta, player.speed);

		for (entity in entities) {
			entity.update(); //update every entity in the level in each frame
			entity.speed = Std.int(0.015 * player.speed * delta);
		}
		player.update();
		whipEffect.update();
	}
}
