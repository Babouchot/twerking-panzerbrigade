package;

import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;


class Lutin extends Entity {


	private var type: Int;

	public function new (stage:Stage, lane:Int) {
		var array:Array<String> = new Array<String>();
		type = Std.random(3);

		switch (type) {
			case 1: // Fire
				array.push("assets/Cadaver.png");
				array.push("assets/Cadaver.png");
				array.push("assets/Cadaver.png");
			case 2: // Thunder
				array.push("assets/Cadaver.png");
				array.push("assets/Cadaver.png");
				array.push("assets/Cadaver.png");
			default: // Blood
				array.push("assets/Cadaver.png");
				array.push("assets/Cadaver.png");
				array.push("assets/Cadaver.png");
		}

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
	

	public override function update () : Void {
		super.update();
		XPosition -= speed;
	}



	// Polymorphism V2 functions 

	public override function isLutin() : Bool {
		return true;
	}

	public override function getType() : Int {
		return type;
	}
	
}