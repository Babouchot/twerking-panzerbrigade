import spritesheet.AnimatedSprite;
import spritesheet.Spritesheet;
import spritesheet.data.BehaviorData;
import spritesheet.importers.BitmapImporter;

import openfl.Assets;


class Entity extends AnimatedSprite {

	private var XPositon:Int;
	private var YPosition:Int;
	private var Skin:Spritesheet;


	public function new (xPosition:Int, yPosition:Int, imagePath:String) {
		
		Skin = BitmapImporter.create(Assets.getBitmapData(imagePath), 3, 3, 100, 100);

		Skin.addBehavior(new BehaviorData("normal",[0, 1, 2], true));
		Skin.addBehavior(new BehaviorData("hit",[1, 2, 3], false, 15));
		Skin.addBehavior(new BehaviorData("attack",[4, 5, 6], false, 15));
		

		super (Skin, true);

		XPositon = xPosition;
		YPosition = yPosition;

		showBehavior("normal");
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
}