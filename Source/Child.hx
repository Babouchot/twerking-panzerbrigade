package;

class Child extends Entity {

    private static var counter:Int;
	
	public function new (xPositon:Int, yPosition:Int) {
		
		super (xPositon, yPosition, "assets/child.png");
				
	}



	public override function onCollision () : Void {
		super.onCollision();
		// TODO
	}

	public override function update (deltaTime:Int) : Void {
		super.update(deltaTime);
		// TODO 
	}
	
}
