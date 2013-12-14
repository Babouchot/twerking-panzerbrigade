package;

import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

class Child extends Entity {

    private var lane(default, set):Int; // Lane number the character is in
	public var speed:Int;

	public function new (stage:Stage, lane:Int) {
		var array:Array<String> = new Array<String>();
		array.push("assets/ChildMale0-0-0.png");
		array.push("assets/ChildMale0-1-0.png");
		array.push("assets/Childmale0-2-0.png");

		super(stage.stageWidth, stage.stageHeight - 50, stage, array, 230, true);
		scaleX = 0.3;
		scaleY = 0.3;
		this.lane = lane;
		speed = 10;
	}		

				
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
	

	public override function onCollision () : Void {
		super.onCollision();
		// TODO
	}

	public override function update () : Void {
		super.update();
		// TODO 
		XPosition -= speed;
	}
	
}
