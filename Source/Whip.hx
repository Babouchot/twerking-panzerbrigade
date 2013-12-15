package;

import flash.events.TimerEvent;
import flash.media.Sound;
import flash.ui.Keyboard;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.Lib;
import flash.display.Stage;

import spritesheet.AnimatedSprite;
import spritesheet.data.BehaviorData;
import spritesheet.importers.BitmapImporter;
import spritesheet.Spritesheet;

import openfl.Assets;

class Whip extends Sprite {

	private var fx:Int;
	private var offsetX:Int;
    private var offsetY:Int;
    private var whipEffects:Array<MyAnimation>;


	public function new (whipNormal:Array<String>, whipFire:Array<String>, whipElec:Array<String>) {
        super();
        whipEffects = new Array<MyAnimation>();
        whipEffects[0] = new MyAnimation(whipNormal, 40, false, false);
        whipEffects[1] = new MyAnimation(whipFire, 40, false, false);
        whipEffects[2] = new MyAnimation(whipElec, 40, false, false);

        for(a in whipEffects)
            addChild(a);
	}

	public function effect (fx, x, y, scaX, scaY) {
        x = x + offsetX;
        y = y + offsetY;
        scaleX = scaX;
        scaleY = scaY;
        whipEffects[fx].start();
	}

    override public function update () {
        for(a in whipEffects)
            a.update();
        super.update();
    }
}