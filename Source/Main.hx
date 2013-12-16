package;

import flash.ui.Keyboard;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.text.TextField;
import flash.events.Event;
import flash.events.KeyboardEvent;

import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.filters.BlurFilter;
import flash.filters.DropShadowFilter;

import openfl.Assets;
import flash.Lib;

class Main extends Sprite {
	
    private var Background:Bitmap;
    private var Title:TextField;
    
    public function new () {
        
        super ();
        
        initialize ();
        construct ();
        
        var font = Assets.getFont ("assets/fonts/FreebooterUpdated.ttf");
        var defaultFormat = new TextFormat (font.fontName, 60, 0xFFFFFF);
        defaultFormat.align = TextFormatAlign.RIGHT;
        
        #if js
        defaultFormat.align = TextFormatAlign.LEFT;
        #end
        
        Title.x = 100;
        Title.width = 600;
        Title.y = 12;
        Title.selectable = false;
        Title.defaultTextFormat = defaultFormat;
        
        #if !js
        Title.filters = [ new BlurFilter (1.5, 1.5), new DropShadowFilter (1, 45, 0, 0.2, 5, 5) ];
        #else
        Title.y = 0;
        Title.x += 90;
        #end
        
        Title.embedFonts = true;
        Title.text = "Last present from Santa Claus";
        stage.addChild(Title);

        resize (stage.stageWidth, stage.stageHeight);
        stage.addEventListener (Event.RESIZE, stage_onResize);
        stage.addEventListener (KeyboardEvent.KEY_DOWN, onPress );
    }

    private function construct ():Void {
        stage.addChild (Background);
    }
    
    
    private function initialize ():Void {
        
        Background = new Bitmap (Assets.getBitmapData ("assets/KickAssSanta.png"));
        Title = new TextField();
    }

    private function resize (newWidth:Int, newHeight:Int):Void {
        
        Background.width = newWidth;
        Background.height = newHeight;
        
    }
    
    
    private function stage_onResize (event:Event):Void {
        
        resize (stage.stageWidth, stage.stageHeight);
        
    }
    
    function onPress(event:KeyboardEvent) {
        switch(event.keyCode) {
            case Keyboard.ENTER:
                stage.removeEventListener(KeyboardEvent.KEY_DOWN, onPress);
                stage.removeChild(Background);
                stage.removeChild(Title);
                var intro = new Cinematic(0, stage);
				addChild(intro);
            default:
        }
        
    }
    
}
