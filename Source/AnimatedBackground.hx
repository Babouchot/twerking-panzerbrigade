package ;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.Stage;
import openfl.Assets;

/**
 * 
 * @author G
 */
class AnimatedBackground {

	public var z:Int;
	private var repeatNumber:Int;
	public var sprites:Array<Sprite>;
	
	public function new(y:Int, z:Int, file:String) {
		this.repeatNumber = 4;
		this.z = z;
		this.sprites = new Array<Sprite>();

		// First image
		var sprite:Sprite, image:Bitmap;
		
		for(i in 0...repeatNumber) {
			sprite = new Sprite();
			image = new Bitmap(Assets.getBitmapData (file));
			sprite.x = i * image.width;
			sprite.y = y;
			sprite.addChild(image);
			this.sprites.push(sprite);
		}
		
	}
	
	public function addAsChild(stage:Stage) {
		for (s in sprites) stage.addChild(s);
	}
	
	public function move(delta:Int) {
		var deltaX = delta / 1000 / z;
		sprites[0].x -= deltaX;
		for (i in 1...repeatNumber)
			sprites[i].x = sprites[0].x + i * sprites[0].width;
		
		// If first image is out of the screen we reset positions
		if (sprites[0].x <= -sprites[0].width)
			for (i in 0...repeatNumber) sprites[i].x = i * sprites[0].width;
		
	}
	
	public function getY():Float {
		return sprites[0].y;
	}
	public function setY(y:Float) {
		for( s in sprites) s.y = y;
	}
	
	public function setHeight(h:Float) {
		for (s in sprites) s.height = h;
	}
	public function getHeight():Float {
		return sprites[0].height;
	}
	
	public function setWidth(w:Float) {
		for (s in sprites) s.width = w;
	}
	public function getWidth():Float {
		return sprites[0].width;
	}
	
	public function resize(stageWidth:Int, stageHeight:Int ) {
		
	}
	
}