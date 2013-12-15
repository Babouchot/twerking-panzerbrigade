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
	private var whipEffect:Whip;
	private static var entities	: Array<Entity>;
	private var player : PlayerNoel;
	private var sound:SoundManager;
	private var attacking :Bool;
	private var bonus:Int;
	
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
		
        Title.x = stage.stageWidth/2;
        Title.width = 200;
        Title.y = 12;
        Title.selectable = false;
        Title.text = "Ceci est le titre de Game";
		
		for (b in Backgrounds) b.addAsChild(stage);
		
		entities = new Array<Entity>();
		player = new PlayerNoel(stage);

        stage.addChild (Title);
		speedField.x = stage.stageWidth/2;
        speedField.width = 200;
        speedField.y = 100;
        speedField.selectable = false;
        speedField.text = Std.string(player.speed);
		stage.addChild(speedField);
        stage.addChild (whipEffect);
        stage.addChild(player);
        player.start();
	}
	
	
	private function initialize ():Void {
		attacking = false;
		bonus = 0;
		Title = new TextField ();
		speedField = new TextField();
		
		time = Lib.getTimer();

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

		if (Std.random(100) < 1) {
			var lutin = new Lutin(stage, Std.random(3));
			entities.push(lutin);
			stage.addChild(lutin);
			lutin.start();
		}
		
		//Whip attack
		if (attacking) {
			for (entity in entities) {
				if (entity.WhipOverlaps(player.lane, Std.int(player.animatedWhip.images[0].bitmapData.width * player.scaleX))) {
					//remove the child from the stage in a bloody way
					whipEffect.effect(bonus, Std.int(entity.x), Std.int(entity.y), entity.scaleX, entity.scaleY);
					if (entity.isLutin()) {
						bonus = entity.getType();
					}
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
