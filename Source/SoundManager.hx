package;

import flash.media.Sound;
import flash.media.SoundChannel;
import flash.net.URLRequest;

import flash.events.Event;

class SoundManager {
	
	// Environment sounds
	public var elec(default, default):Sound;
	public var explosion(default, default):Sound;
	public var fouet(default, default):Sound;
	public var grelots(default, default):Sound;
	public var grelots_debut(default, default):Sound;
	public var lutins(default, default):Sound;


	private var music:Sound;
	private var musicPaused:Bool;
	private var musicChannel:SoundChannel;
	private var pausePostion:Float;

	private var musicsMap:Map<String, String>;

	private var loopedSounds:Map<String, SoundChannel>;


	public function new () {
		elec = new Sound(new URLRequest("assets/sound/elec.ogg"));
		explosion = new Sound(new URLRequest("assets/sound/explosion.ogg"));
		fouet = new Sound(new URLRequest("assets/sound/fouet.ogg"));
		grelots = new Sound(new URLRequest("assets/sound/grelots.ogg"));
		grelots_debut = new Sound(new URLRequest("assets/sound/grelots_beginning.ogg"));
		lutins = new Sound(new URLRequest("assets/sound/lutins.ogg"));


		musicsMap = ["carol" => "assets/music/carol_of_the_bells.ogg",
												"e_nutcracker" => "assets/music/Evil_Nutcracker.ogg",
												"jingle_bells" => "assets/music/jingle_bells.ogg",
												"nightmare_bc" => "assets/music/nightmare_bc.ogg",
												"nutcracker" => "assets/music/Nutcracker1.ogg"];

		musicPaused = true;
		loopedSounds = new Map <String, SoundChannel>();
	}


	public function playMusic (name:String) :Void {
		music = new Sound (new URLRequest(musicsMap.get(name)));
		musicChannel = music.play();
		musicChannel.addEventListener(Event.SOUND_COMPLETE, onPlaybackComplete);
		musicPaused = false;
	}

	public function play() : Void {
		if (pausePostion != 0) {
			musicChannel = music.play(pausePostion);
			musicPaused = false;
		}
	}

	public function pause() : Void {
		pausePostion = musicChannel.position;
		musicChannel.stop();
		musicPaused = true;
	}


	public function stop() : Void {
		musicChannel.stop();
		pausePostion = 0;
	}

	public function playPause () {
		if (musicPaused) {
			play();
		}
		else {
			pause();
		}
	}


	private function onPlaybackComplete(event:Event) : Void {
			musicChannel = music.play(0);
	}


	public function loopSound (sound:Sound, id:String) {
		// TODO pas proooooooooopre !
		var soundChannel:SoundChannel = sound.play(0, 9999);
		// soundChannel.addEventListener(Event.SOUND_COMPLETE, onLoopSoundComplete);
		loopedSounds.set(id, soundChannel);
	}

	// private function onLoopSoundComplete(event:Event) : Void {
	// 	var sound:Sound = event.currentTarget;
	// 	sound.play();
	// }

	public function unLoopSound (id: String) {
		loopedSounds.get(id).stop();
		loopedSounds.remove(id);
	}

}