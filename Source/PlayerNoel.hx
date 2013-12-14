package ;

import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
/**
 * ...
 * @author Elie Jacquelin
 */
class PlayerNoel extends Entity
{

	private var lane(default, set):Int; // Lane number the character is in
	public var speed:Int;
	private var time_window:Int = 50; //the number of frames to increase the speed
	private var current_frame:Int;
	
	
	function set_lane(value:Int):Int {
		switch(value) {
			case 0:
				YPosition = 300;
			case 1:
				YPosition = 200;
			case 2 :
				YPosition = 150;

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
		super(15, stage.stageHeight - 50, stage, array, 160, true);
		scaleX = 0.3;
		scaleY = 0.3;
		//stage.addEventListener (KeyboardEvent.KEY_DOWN, onPress);
		current_frame = 0;
		lane = 0;
		speed = 5;
	}
	
	override function update() : Void{
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
				/*
				var min = 0;
				pn.y -= 10;
				if (pn.y < min) pn.y = 0;
				*/
			case Keyboard.DOWN:
				if (lane > 0) {
					lane --;
				}
				/*
				var max = stage.stageHeight - pn.height;
				pn.y += 10;
				if (pn.y > max) pn.y = max;
				*/
			case Keyboard.SPACE:
				
				//Bam.play();
			default:
		}
        
    }
}