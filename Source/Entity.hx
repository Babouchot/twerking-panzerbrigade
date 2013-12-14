import spritesheet.AnimatedSprite;
import flash.display.Bitmap;
import flash.geom.Point;

class Entity extends AnimatedSprite {

	private var XPositon:Int;
	private var YPosition:Int;
	private var Skin:Bitmap;


	public function new (xPosition:Int, xPosition:Int, imagePath:String) {
		
		super ();
		
		initialize (xPosition, yPosition, imagePath);
		construct ();
		
	}

	private function construct ():Void {
		
        Skin.x = stage.stageWidth;
        Skin.selectable = false;

		addChild (Skin);
		
	}
	
	
	private function initialize (xPositon:Int, yPosition:Int, imagePath):Void {
		
		XPositon = xPositon;
		YPosition = yPosition;
		Skin = new Bitmap (Assets.getBitmapData (imagePath));
		
	}


	/**
	 * Function called when the entity collide another one
	 */
	public function onCollision () : Void{

	}

	/**
	 * Function called when the entity collide another one
	 */
	public function update () : Void {

	}
}