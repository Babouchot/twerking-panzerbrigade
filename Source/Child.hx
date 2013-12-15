package;

import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

class Child extends Entity {


	public function new (stage:Stage, lane:Int) {
		var array:Array<String> = new Array<String>();
		array.push("assets/ChildMale0-0-0.png");
		array.push("assets/ChildMale0-1-0.png");
		array.push("assets/ChildMale0-2-0.png");

		super(stage.stageWidth, stage.stageHeight - 50, stage, array, 230, true, false);
		scaleX = 0.3;
		scaleY = 0.3;
		this.lane = lane;
		speed = 10;
		radius = 20;
	}		

				
	override function set_lane(value:Int):Int {
		switch(value) {
			case 0:
				YPosition = 425;
				scaleX = 0.3;
				scaleY = 0.3;
			case 1:
				YPosition = 350;
				scaleX = 0.25;
				scaleY = 0.25;
			case 2 :
				YPosition = 275;
				scaleX = 0.2;
				scaleY = 0.2;

		}
		//YPosition = value * 100 + 50;
		
		return lane=value;
	}
	

	public override function onCollision () : Void {
		//remove the child from the list of entities
		//Game.destroyChild(this);
	}

	public override function update () : Void {
		super.update();
		// TODO 
		XPosition -= speed;
	}
	
	
}
