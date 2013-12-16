package;

import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
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

	private var fouetChannel:SoundChannel;

	private var musicIterator:Iterator<Sound>;

	// private var musicsMap:Map<String, String>;
	private var musicsArray:Array<Sound>;

	private var loopedSounds:Map<String, SoundChannel>;


	public static var instance:SoundManager = null;



	public function new () {
		elec = new Sound(new URLRequest("assets/sound/elec.wav"));
		explosion = new Sound(new URLRequest("assets/sound/explosion.wav"));
		fouet = new Sound(new URLRequest("assets/sound/fouet.wav"));
		grelots = new Sound(new URLRequest("assets/sound/grelots.wav"));
		grelots_debut = new Sound(new URLRequest("assets/sound/grelots_beginning.wav"));
		lutins = new Sound(new URLRequest("assets/sound/lutins.wav"));


		musicsArray = [new Sound (new URLRequest("assets/music/nightmare_bc.mp3"))];

		// musicsMap = ["jingle_bells" => "assets/music/jingle_bells.ogg",
		// 										"carol" => "assets/music/carol_of_the_bells.ogg",
		// 										"e_nutcracker" => "assets/music/Evil-Nutcracker.ogg",
		// 										"nightmare_bc" => "assets/music/nightmare_bc.ogg",
		// 										"nutcracker" => "assets/music/Nutcracker1.ogg"];

		musicPaused = true;
		loopedSounds = new Map <String, SoundChannel>();
	}


	public static function get_instance() {
		if (instance == null) {
			return instance = new SoundManager();
		}
		else {
			return instance;
		}
	}

	public function playMusic (id:Int) :Void {
		music = musicsArray[id];
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
			musicChannel.addEventListener(Event.SOUND_COMPLETE, onPlaybackComplete);
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

	public function gameMusicLoop () {
		// musicIterator = musicsMap.iterator();
		musicIterator = musicsArray.iterator();
		playMusicInLoop();
	}

	private function playMusicInLoop() {
		if (musicIterator.hasNext()) {
			// music = new Sound(new URLRequest(musicIterator.next()));
			music = musicIterator.next();
			musicChannel = music.play(0, 0, new SoundTransform(0.2));
			musicChannel.addEventListener(Event.SOUND_COMPLETE, onMusicLoopPlaybackComplete);
			musicPaused = false;
		}
		else {
			gameMusicLoop();
		}
	}

	private function onMusicLoopPlaybackComplete(event:Event) {
		musicChannel.stop();
		playMusicInLoop();
	}


	public function playFouet() : Void {
		// if (fouetChannel == null || fouetChannel.position == 0) {
		// 	fouetChannel = fouet.play();
		// 	fouetChannel.addEventListener(Event.SOUND_COMPLETE, onFouetComplete);
		// }
	}

	private function onFouetComplete (event : Event) {
		fouetChannel.stop();
		fouet.play();
	}

}