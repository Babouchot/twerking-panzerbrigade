package;

import flash.events.TimerEvent;
import flash.media.Sound;
import flash.media.SoundTransform;
import flash.ui.Keyboard;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.Lib;
import flash.display.Stage;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.filters.BlurFilter;
import flash.filters.DropShadowFilter;

import openfl.Assets;

class Game extends Sprite {

	private var Plans:Array<Sprite>;
	private var Backgrounds:Array<AnimatedBackground>;
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
	private var main:Main;
	private var score:Int;
	private var scoreField:TextField;
	private var mobTimer:Int;
	
	public function new (main:Main) {
		
		super ();
		this.main = main;
		var stage = Lib.current.stage;
		
		initialize ();
		construct ();

		mobTimer = Lib.getTimer();
		
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
		entities = new Array<Entity>();
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
		var font = Assets.getFont ("assets/fonts/FreebooterUpdated.ttf");
		var defaultFormat = new TextFormat (font.fontName, 60, 0xFFFFFF);
		defaultFormat.align = TextFormatAlign.RIGHT;
		
		#if js
		defaultFormat.align = TextFormatAlign.LEFT;
		#end
		
		speedField.x = stage.width - 200;
		speedField.width = 200;
		speedField.y = 12;
		speedField.selectable = false;
		speedField.defaultTextFormat = defaultFormat;
		
		#if !js
		speedField.filters = [ new BlurFilter (1.5, 1.5), new DropShadowFilter (1, 45, 0, 0.2, 5, 5) ];
		#else
		speedField.y = 0;
		speedField.x += 90;
		#end
		
		speedField.embedFonts = true;
		sprite.addChild(speedField);
		
		scoreField.x = 2;
		scoreField.width = 200;
		scoreField.y = 12;
		scoreField.selectable = false;
		scoreField.defaultTextFormat = defaultFormat;
		
		#if !js
		scoreField.filters = [ new BlurFilter (1.5, 1.5), new DropShadowFilter (1, 45, 0, 0.2, 5, 5) ];
		#else
		scoreField.y = 0;
		scoreField.x += 90;
		#end
		
		scoreField.embedFonts = true;
		sprite.addChild(scoreField);

		Plans.push(sprite);
		/////////////////////////////////////////////////////////////
		//////// ADDING SPRITE LAYERS TO STAGE NOTHING ELSE ////////
		///////////////////////////////////////////////////////////
		for (p in Plans) stage.addChild(p);
		
	}
	
	
	private function initialize ():Void {
		attacking = false;
		bonus = 0;
		score = 0;
		speedField = new TextField();

		scoreField = new TextField();
		
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
		speedField.x = newWidth - 200;
		speedField.width = 200;
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
		scoreField.text = Std.string(score) + " pts";

		if(player.speed == 88) {
			// End of the game WIN
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onPress);
			
			for (p in Plans) {
				stage.removeChild(p);
			}
			
			//removeChildren();
			var outro = new Cinematic(1, stage);
			stage.addChild(outro);
		}

		if(player.speed < 10) {
			player.speed = 10;
		}

		var delta = Lib.getTimer() - time;
		time = Lib.getTimer();
		
		speedField.text = Std.string(player.speed) + " mp/h"; //update the speed textfield with the new player speed 

		whipEffect.update();
		//ChildGenerator
		if(Lib.getTimer() - mobTimer > 600 * (10.1/player.speed)) {
			if (Math.random() < (1-1/player.speed)) {
				var child = new Child(stage, Std.random(3));
				entities.push(child);
				Plans[1].addChild(child);
				child.start();
			}
			mobTimer = Lib.getTimer();
		}
		//Remove the child off the screen
		for(a in entities) {
			if (a.x < -100) {
				Plans[1].removeChild(a);
				entities.remove(a);
			}
		}

		if (Std.random(100) < 1) {
			var lutin = new Lutin(stage, Std.random(3));
			entities.push(lutin);
			Plans[1].addChild(lutin);
			lutin.start();
			sound.lutins.play();
		}
		
		for (entity in entities) {
			if (attacking) {
				if (entity.WhipOverlaps(player.lane, Std.int(player.animatedWhip.images[0].bitmapData.width * player.scaleX))) {
					//remove the child from the stage in a bloody way
					whipEffect.effect(bonus, Std.int(entity.x), Std.int(entity.y), entity.scaleX, entity.scaleY);
					if (entity.isLutin()) {
						bonus = entity.getType();
						switch (bonus) {
							case 1:
								sound.explosion.play(0, 0, new SoundTransform(0.2));
								score -= 50;
							case 2:
								sound.elec.play(0, 0, new SoundTransform(0.5));
								score -= 50;
							default:
						}
					}
					else {
						score += 1+bonus;
					}
					entities.remove(entity);
					Plans[1].removeChild(entity);
				}
			}

			if(player.collideWithSleigh(entity.lane, entity)) {
				entities.remove(entity);
				Plans[1].removeChild(entity);
				player.speed -= 1;
				if (entity.isLutin()) {
					score += 10;
				}
				else {
					score -= 10;
				}
			}
		}
		attacking = false;
		for (b in Backgrounds) b.move(delta, player.speed);

		for (entity in entities) {
			entity.update(); //update every entity in the level in each frame
			entity.speed = Std.int(0.015 * player.speed * delta);
		}
		player.update();
		whipEffect.update();
	}

}
