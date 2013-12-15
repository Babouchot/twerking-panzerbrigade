package;

import flash.ui.Keyboard;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.text.TextField;
import flash.events.Event;
import flash.events.KeyboardEvent;

import openfl.Assets;
import flash.Lib;

class Main extends Sprite {
	
    private var Background:Bitmap;
    private var Title:TextField;
    
    public function new () {
        
        super ();
        
        initialize ();
        construct ();
        
        resize (stage.stageWidth, stage.stageHeight);
        stage.addEventListener (Event.RESIZE, stage_onResize);
        stage.addEventListener (KeyboardEvent.KEY_DOWN, onPress );
		
		
    }

    private function construct ():Void {
        
        // var font = Assets.getFont ("fonts/FreebooterUpdated.ttf");
        // var defaultFormat = new TextFormat (font.fontName, 60, 0x000000);
        // defaultFormat.align = TextFormatAlign.RIGHT;
        
        // #if js
        // defaultFormat.align = TextFormatAlign.LEFT;
        // #end

        Title.x = stage.stageWidth - 200;
        Title.width = 200;
        Title.y = 12;
        Title.selectable = false;
        // Title.defaultTextFormat = defaultFormat;
        Title.text = "Ceci est le titre de Main";

        addChild (Background);
        addChild (Title);
        
    }
    
    
    private function initialize ():Void {
        
        Background = new Bitmap (Assets.getBitmapData ("assets/KickAssSanta.jpg"));
        Title = new TextField ();
    }

    private function resize (newWidth:Int, newHeight:Int):Void {
        
        Background.width = newWidth;
        Background.height = newHeight;
        
    }
    
    
    private function stage_onResize (event:Event):Void {
        
        resize (stage.stageWidth, stage.stageHeight);
        
    }
	
	public function startOutro(game:Game) {
		removeChild(game);
		var outro = new Cinematic(1, stage);
		addChild(outro);
	}
    
    
    function onPress(event:KeyboardEvent) {
        switch(event.keyCode) {
            case Keyboard.ENTER:
                stage.removeEventListener(KeyboardEvent.KEY_DOWN, onPress);
                removeChild(Background);
                removeChild(Title);
                var intro = new Cinematic(0,stage);
				addChild(intro);
            default:
        }
        
    }
    
}
