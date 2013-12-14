package;

class Child extends Entity {

    private static var counter:Int;
	
	public function new () {
		
		super ("assets/child.jpg");
		
		initialize ();
		construct ();
		
	}

	private function construct ():Void {
		
	}
	
	
	private function initialize ():Void {
		
	}


	public override function onCollision () : Void {
		super();
		// TODO
	}

	public override function update () : Void {
		super();
		// TODO 
	}
	
}
