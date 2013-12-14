import flash.display.Stage;

import flash.display.Bitmap;

import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import openfl.Assets;


class Entity extends MyAnimation {

	private var XPosition(default,set):Int;
	private var YPosition(default, set):Int;
	private var radius:Float;
	public var lane(default,set):Int;
	// private var stage:Stage;

	function set_lane(value:Int):Int {
		return 0;
	}
	
	function set_XPosition(value: Int):Int {
		x = value;
		return XPosition=value;
	}

	function set_YPosition(value: Int):Int {
		y = value;
		return YPosition=value;
	}

	public function new (xPosition:Int, yPosition:Int, stage:Stage, imagePath:Array<String>, lastingTime:Int, infinite:Bool, starti:Bool) {
		// stage = this.stage;
		XPosition = xPosition;
		YPosition = yPosition;
		//Skin.x = XPositon;
		//Skin.y = YPosition;
		//initialize(xPosition, yPosition, imagePath);

		super (imagePath, lastingTime, infinite, starti);
	}
	/**
	 * Function called when the entity collide another one
	 */

	public function onCollision (){


	}
	
	public function onPress(event:KeyboardEvent) {
		
	}
	
	public inline function WhipOverlaps(lane:Int) {
		if(this.lane==lane){
			var whipX = 300;
			if (XPosition - radius < whipX && XPosition + radius > whipX) {
				onCollision();
				return true;
			};
		}
		return false;
	}
	
	//collision between 2 entities
	public inline function overlaps(e:Entity) {
	  var maxDist = radius + e.radius;
	  // classic distance formula
	  var distSqr = (e.x-x)*(e.x-x) + (e.y-y)*(e.y-y);
	  if( distSqr<=maxDist*maxDist )
	   // square root computed here for performances sake
	   if ( Math.sqrt(distSqr) <= maxDist) {
		   onCollision();
	   }

	}
}