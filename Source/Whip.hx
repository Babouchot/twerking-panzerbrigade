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

class Whip extends AnimatedSprite {

	private var fx:Int;
	private var offsetX:Int;
    private var offsetY:Int;

    private var whip:Spritesheet;

	public function new () {
        whip = BitmapImporter.create(Assets.getBitmapData("assets/FX.png"), 3, 4, 400, 600);

        offsetX = 0;
        offsetY = 0;

        whip.addBehavior(new BehaviorData("void", [0, 1, 2], true));
        whip.addBehavior(new BehaviorData("normal", [3, 4, 5], false, 1));
        whip.addBehavior(new BehaviorData("fire", [6, 7, 8], false));
        whip.addBehavior(new BehaviorData("electric", [9, 10, 11], false));

        super(whip, true);
        showBehavior("void");
	}

	public function attack (fx, x, y) {
        this.x = x + offsetX;
        this.y = y + offsetY;
        switch (fx) {
            case 1: // Normal
                showBehavior("normal");
            case 2: // Fire
                showBehavior("fire");
            case 3: // Electricity
                showBehavior("electric");
        }
	}

    public function updateMe (delta:Int) {
        super.update(delta);
    }
}