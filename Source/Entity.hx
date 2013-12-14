import flash.display.Stage;
import flash.display.Bitmap;
import spritesheet.AnimatedSprite;
import spritesheet.Spritesheet;
import spritesheet.data.BehaviorData;
import spritesheet.importers.BitmapImporter;

import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import openfl.Assets;


class Entity extends AnimatedSprite {
	private var SkinSheet:Spritesheet;
	private var XPosition(default,set):Int;
	private var YPosition(default,set):Int;
	private var Skin(default,default):Bitmap;
	// private var stage:Stage;

	function set_XPosition(value: Int):Int {
		Skin.x = value;
		return XPosition=value;
	}

	function set_YPosition(value: Int):Int {
		Skin.y = value;
		return YPosition=value;
	}

	public function new (xPosition:Int, yPosition:Int, imagePath:String, stage:Stage) {

		// stage = this.stage;
		Skin = new Bitmap (Assets.getBitmapData (imagePath));
		XPosition = xPosition;
		YPosition = yPosition;
		//Skin.x = XPositon;
		//Skin.y = YPosition;
		//initialize(xPosition, yPosition, imagePath);

		SkinSheet = BitmapImporter.create(Assets.getBitmapData(imagePath), 3, 3, 100, 100);

		SkinSheet.addBehavior(new BehaviorData("normal",[0, 1, 2], true));
		SkinSheet.addBehavior(new BehaviorData("hit",[1, 2, 3], false, 15));
		SkinSheet.addBehavior(new BehaviorData("attack",[4, 5, 6], false, 15));
		

		super (SkinSheet, true);

		showBehavior("normal");

		
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
	public override function update (deltaTime:Int) : Void {
		super.update(deltaTime);
	}
	
	public function onPress(event:KeyboardEvent) {
		
	}
}