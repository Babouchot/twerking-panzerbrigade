import flash.display.Stage;
import spritesheet.AnimatedSprite;
import flash.display.Bitmap;
import flash.geom.Point;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import openfl.Assets;

//class Entity extends AnimatedSprite {
class Entity {
	private var XPosition(default,set):Int;
	private var YPosition(default,set):Int;
	private var Skin(default,default):Bitmap;
	private var stage:Stage;

	function set_XPosition(value: Int):Int {
		Skin.x = value;
		return XPosition=value;
	}
	
	function set_YPosition(value: Int):Int {
		Skin.y = value;
		return YPosition=value;
	}
	
	public function new (xPosition:Int, yPosition:Int, imagePath:String, stage:Stage) {
		
		//super ();
		stage = this.stage;
		Skin = new Bitmap (Assets.getBitmapData (imagePath));
		XPosition = xPosition;
		YPosition = yPosition;
		//Skin.x = XPositon;
		//Skin.y = YPosition;
		//initialize(xPosition, yPosition, imagePath);
		
	}

	
	public function getSkin():Bitmap {
		return Skin;
	}
	
	

	

	/**
	 * Function called when the entity collide another one
	 */
	public function onCollision () : Void{

	}

	/**
	 * Function called when the entity collide another one
	 */
	public function update(){

	}
	
	public function onPress(event:KeyboardEvent) {
		
	}
}