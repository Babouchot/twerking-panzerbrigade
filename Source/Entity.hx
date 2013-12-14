import flash.display.Stage;

import flash.display.Bitmap;

import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import openfl.Assets;


class Entity extends MyAnimation {

	private var XPosition(default,set):Int;
	private var YPosition(default,set):Int;
	// private var stage:Stage;

	function set_XPosition(value: Int):Int {
		x = value;
		return XPosition=value;
	}

	function set_YPosition(value: Int):Int {
		y = value;
		return YPosition=value;
	}

	public function new (xPosition:Int, yPosition:Int, stage:Stage, imagePath:Array<String>, lastingTime:Int, infinite:Bool) {
		// stage = this.stage;
		XPosition = xPosition;
		YPosition = yPosition;
		//Skin.x = XPositon;
		//Skin.y = YPosition;
		//initialize(xPosition, yPosition, imagePath);

		super (imagePath, lastingTime, infinite);
	}
	/**
	 * Function called when the entity collide another one
	 */

	public function onCollision () : Void{


	}
	
	public function onPress(event:KeyboardEvent) {
		
	}
}