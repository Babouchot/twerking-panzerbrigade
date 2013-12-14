package ;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.Stage;
import openfl.Assets;


class AnimatedBackground {

	public var z:Int;
	private var repeatNumber:Int;
	public var sprites:Array<Bitmap>;
	private var initialWidth:Float;
	private var initialHeight:Float;
	
	public function new(y:Int, z:Int, file:String) {
		this.repeatNumber = 2;
		this.z = z;
		this.sprites = new Array<Bitmap>();
		
		var image:Bitmap;
		
		for(i in 0...repeatNumber) {
			image = new Bitmap(Assets.getBitmapData (file));
			image.x = i * image.width;
			image.y = y;
			sprites.push(image);
			
			initialWidth = image.width;
			initialHeight = image.height;
		}

	}
	
	public function addAsChild(stage:Stage) {
		for (i in sprites) stage.addChild(i);
	}
	
	public function move(delta:Int, speed:Int) {
		var deltaX = delta * speed / 10 / z;
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
	
	/**
	 * Add images if needed to complete the loop
	 * @param	stageWidth New width of the stage
	 * @param	stageHeight New height of the stage
	 */
	public function resize(stageWidth:Int, stageHeight:Int ) {
		var scaleY = (stageHeight / initialHeight),
			scaleX = (stageWidth / initialWidth);
			
		for (i in 0...repeatNumber) {
			sprites[i].scaleX = scaleX;
			sprites[i].scaleY = scaleY;
			// Prevent split between two images
			if(i > 0) sprites[i].x = sprites[0].x + i * sprites[0].width;
		}
	}
	
}