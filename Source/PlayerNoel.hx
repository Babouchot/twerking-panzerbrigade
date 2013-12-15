package ;

import flash.display.DisplayObjectContainer;
import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import openfl.Assets;
import flash.display.Bitmap;

import flash.media.SoundTransform;
/**
 * ...
 * @author Elie Jacquelin
 */
class PlayerNoel extends Entity
{

	//public var lane(default, set):Int; // Lane number the character is in
	public var speed:Int;
	private var time_window:Int = 50; //the number of frames to increase the speed
	private var current_frame:Int;
	public var animatedWhip:MyAnimation;

	override function set_lane(value:Int):Int {
		switch(value) {
			case 0:
				YPosition = 300;
				scaleX = 0.3;
				scaleY = 0.3;
				animatedWhip.scaleX = 0.3;
				animatedWhip.scaleY = 0.3;
			case 1:
				YPosition = 250;
				scaleX = 0.25;
				scaleY = 0.25;
				animatedWhip.scaleX = 0.25;
				animatedWhip.scaleY = 0.25;
			case 2 :
				YPosition = 200;
				scaleX = 0.2;
				scaleY = 0.2;
				animatedWhip.scaleX = 0.2;
				animatedWhip.scaleY = 0.2;


		}
		//YPosition = value * 100 + 50;
		
		return lane=value;
	}
	
	public function new(stage:Stage) 
	{

		var array:Array<String> = new Array<String>();
		array.push("assets/Sleigh-0-0.png");
		array.push("assets/Sleigh-1-0.png");
		array.push("assets/Sleigh-2-0.png");
		array.push("assets/Sleigh-3-0.png");
		
		var array2:Array<String> = new Array<String>();
		array2.push("assets/Santa2-0-0.png");
		array2.push("assets/Santa2-1-0.png");
		array2.push("assets/Santa2-2-0.png");
		array2.push("assets/Santa2-3-0.png");

		animatedWhip = new MyAnimation(array2, 40, true, true);

		animatedWhip.scaleX = 0.3;
		animatedWhip.scaleY = 0.3;

		addChild(animatedWhip);
		animatedWhip.start();
		super(15, stage.stageHeight - 50, stage, array, 140, true, false);
		scaleX = 0.3;
		scaleY = 0.3;
		current_frame = 0;
		lane = 0;
		speed = 5;
	}
	
	override function update() : Void{
		animatedWhip.update();
		lastingTime = Std.int(140 - speed/3);
		super.update();
		current_frame++;
		if (current_frame >= time_window) {
			speed++;
			current_frame = 0;
		}
	}
	
	override public function onPress(event:KeyboardEvent) {
        switch(event.keyCode) {
			case Keyboard.UP:
				if (lane < 2) {
					lane++;
				}
			case Keyboard.DOWN:
				if (lane > 0) {
					lane --;
				}
			case Keyboard.SPACE:
				animatedWhip.restart();
				if(!animatedWhip.running)
					SoundManager.get_instance().fouet.play(0, 0, new SoundTransform(0.30));
			default:
		}
    }

    override function set_XPosition(value: Int):Int {
    	animatedWhip.x = value - 12;
		return super.set_XPosition(value);
	}

	override function set_YPosition(value: Int):Int {
		animatedWhip.y = value;
		return super.set_YPosition(value);
	}
}