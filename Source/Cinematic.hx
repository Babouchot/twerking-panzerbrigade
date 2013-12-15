package ;

import flash.display.Stage;
import flash.ui.Keyboard;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import openfl.Assets;
/**
 * ...
 * @author Elie Jacquelin
 */
class Cinematic extends Sprite
{

	var images : Array<Bitmap>;
	var current:Int;
	var which:Int;
	var mstage:Stage;
	var main:Main;
	
	public function new(which:Int, stage:Stage) 
	{
		super();
		images = new Array();
		this.which = which;

		if (which == 0) {//intro
			images.push(new Bitmap (Assets.getBitmapData ("assets/Start-1.png")));
			images.push(new Bitmap (Assets.getBitmapData ("assets/Start-2.png")));
			images.push(new Bitmap (Assets.getBitmapData ("assets/Start-3.png")));
			images.push(new Bitmap (Assets.getBitmapData ("assets/Start-4.png")));
		} else if (which == 1) {
			images.push(new Bitmap (Assets.getBitmapData ("assets/End-1.png")));
			images.push(new Bitmap (Assets.getBitmapData ("assets/End-2.png")));
			images.push(new Bitmap (Assets.getBitmapData ("assets/End-3.png")));
			images.push(new Bitmap (Assets.getBitmapData ("assets/End-4.png")));
		}

		for ( i in 0...images.length) {
			images[i].width = stage.width;
			images[i].height = stage.height;
		}

		stage.addChild(images[0]);
		current = 0;
		mstage = stage;
		stage.addEventListener (KeyboardEvent.KEY_DOWN, onPress );
	}
	
	function nextImage() {
		mstage.removeChild(images[current]);
		current++;
		if (current < images.length) {
			mstage.addChild(images[current]);
		}
		else {
			if( which ==0 ){
				mstage.removeEventListener(KeyboardEvent.KEY_DOWN, onPress);
			 	var game = new Game(main);
				mstage.addChild(game);
			}
		}
	}
	
	function onPress(event:KeyboardEvent) {
        switch(event.keyCode) {
            case Keyboard.ENTER:
               nextImage();
            default:
        }
        
    }
}