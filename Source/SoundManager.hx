package;

import flash.media.Sound;
import flash.media.SoundChannel;

import flash.events.Event;

class SoundManager {
	
	// Environment sounds
	public var elec(default, default):Sound;
	public var explosion(default, default):Sound;
	public var fouet(default, default):Sound;
	public var grelots(default, default):Sound;
	public var grelots_debut(default, default):Sound;
	public var lutins(default, default):Sound;

	private var musicChannel:SoundChannel;
	private var pausePostion:Int;

	private var musicsMap:Map<String, String> = ["carol" => "assets/music/carol_of_the_bells.ogg",
												"e_nutcracker" => "assets/music/Evil_Nutcracker.ogg",
												"jingle_bells" => "assets/music/jingle_bells.ogg",
												"nightmare_bc" => "assets/music/nightmare_bc.ogg",
												"nutcracker" => "assets/music/Nutcracker1.ogg"];


	public function new () {
		elec = new Sound("assets/sound/elec.ogg");
		explosion = new Sound("assets/sound/explosion.ogg");
		fouet = new Sound("assets/sound/fouet.ogg");
		grelots = new Sound("assets/sound/grelots.ogg");
		grelots_debut = new Sound("assets/sound/grelots_beginning.ogg");
		lutins = new Sound("assets/sound/lutins.ogg");
	}


	public function playMusic (name:String) :Void {
		var music = new Sound (musicsMap.get(name));
		musicChannel = music.play();
		channel.addEventListener(Event.SOUND_COMPLETE, onPlaybackComplete);
	}

	public function play() : Void {
		if (pausePostion != 0) {
			musicChannel.play(pausePostion);
		}
	}

	public function pause() : Void {
		pausePostion = musicChannel.position;
		musicChannel.stop();
	}


	public function stop() : Void {
		musicChannel.stop();
		pausePostion = 0;
	}


	private function onPlaybackComplete(event:Event) : Void {
		musicChannel.play(0);
	}

}