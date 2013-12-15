package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/background.jpg", __ASSET__assets_background_jpg);
		type.set ("assets/background.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Boom-0-0.png", __ASSET__assets_boom_0_0_png);
		type.set ("assets/Boom-0-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Boom-1-0.png", __ASSET__assets_boom_1_0_png);
		type.set ("assets/Boom-1-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Boom-2-0.png", __ASSET__assets_boom_2_0_png);
		type.set ("assets/Boom-2-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/ChildMale0-0-0.png", __ASSET__assets_childmale0_0_0_png);
		type.set ("assets/ChildMale0-0-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/ChildMale0-1-0.png", __ASSET__assets_childmale0_1_0_png);
		type.set ("assets/ChildMale0-1-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/ChildMale0-2-0.png", __ASSET__assets_childmale0_2_0_png);
		type.set ("assets/ChildMale0-2-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/ChildMale0.png", __ASSET__assets_childmale0_png);
		type.set ("assets/ChildMale0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/FX.png", __ASSET__assets_fx_png);
		type.set ("assets/FX.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Ground.png", __ASSET__assets_ground_png);
		type.set ("assets/Ground.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Mountains.png", __ASSET__assets_mountains_png);
		type.set ("assets/Mountains.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/music/108604_Ash_Tarrant___What_.mp3", __ASSET__assets_music_108604_ash_tarrant___what__mp3);
		type.set ("assets/music/108604_Ash_Tarrant___What_.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/111767_Dirge_s_Nutcracker.mp3", __ASSET__assets_music_111767_dirge_s_nutcracker_mp3);
		type.set ("assets/music/111767_Dirge_s_Nutcracker.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/38352_newgrounds_nikky_.mp3", __ASSET__assets_music_38352_newgrounds_nikky__mp3);
		type.set ("assets/music/38352_newgrounds_nikky_.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/515215_The-Evil-Nutcracker.mp3", __ASSET__assets_music_515215_the_evil_nutcracker_mp3);
		type.set ("assets/music/515215_The-Evil-Nutcracker.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/68552_newgrounds_carol_.mp3", __ASSET__assets_music_68552_newgrounds_carol__mp3);
		type.set ("assets/music/68552_newgrounds_carol_.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/carol_of_the_bells.ogg", __ASSET__assets_music_carol_of_the_bells_ogg);
		type.set ("assets/music/carol_of_the_bells.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/Evil-Nutcracker.ogg", __ASSET__assets_music_evil_nutcracker_ogg);
		type.set ("assets/music/Evil-Nutcracker.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/jingle_bells.ogg", __ASSET__assets_music_jingle_bells_ogg);
		type.set ("assets/music/jingle_bells.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/nightmare_bc.ogg", __ASSET__assets_music_nightmare_bc_ogg);
		type.set ("assets/music/nightmare_bc.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/Nutcracker1.ogg", __ASSET__assets_music_nutcracker1_ogg);
		type.set ("assets/music/Nutcracker1.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/openfl.svg", __ASSET__assets_openfl_svg);
		type.set ("assets/openfl.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/Santa.png", __ASSET__assets_santa_png);
		type.set ("assets/Santa.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Santa2-0-0.png", __ASSET__assets_santa2_0_0_png);
		type.set ("assets/Santa2-0-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Santa2-1-0.png", __ASSET__assets_santa2_1_0_png);
		type.set ("assets/Santa2-1-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Santa2-2-0.png", __ASSET__assets_santa2_2_0_png);
		type.set ("assets/Santa2-2-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Santa2-3-0.png", __ASSET__assets_santa2_3_0_png);
		type.set ("assets/Santa2-3-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Sky.png", __ASSET__assets_sky_png);
		type.set ("assets/Sky.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Sleigh-0-0.png", __ASSET__assets_sleigh_0_0_png);
		type.set ("assets/Sleigh-0-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Sleigh-1-0.png", __ASSET__assets_sleigh_1_0_png);
		type.set ("assets/Sleigh-1-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Sleigh-2-0.png", __ASSET__assets_sleigh_2_0_png);
		type.set ("assets/Sleigh-2-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Sleigh-3-0.png", __ASSET__assets_sleigh_3_0_png);
		type.set ("assets/Sleigh-3-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Sleigh.png", __ASSET__assets_sleigh_png);
		type.set ("assets/Sleigh.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sound/elec.ogg", __ASSET__assets_sound_elec_ogg);
		type.set ("assets/sound/elec.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sound/explosion.ogg", __ASSET__assets_sound_explosion_ogg);
		type.set ("assets/sound/explosion.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sound/fouet.ogg", __ASSET__assets_sound_fouet_ogg);
		type.set ("assets/sound/fouet.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sound/grelots.ogg", __ASSET__assets_sound_grelots_ogg);
		type.set ("assets/sound/grelots.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sound/grelots_beginning.ogg", __ASSET__assets_sound_grelots_beginning_ogg);
		type.set ("assets/sound/grelots_beginning.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sound/lutins.ogg", __ASSET__assets_sound_lutins_ogg);
		type.set ("assets/sound/lutins.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/Trees.png", __ASSET__assets_trees_png);
		type.set ("assets/Trees.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/Village.png", __ASSET__assets_village_png);
		type.set ("assets/Village.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/WhipFX-0-1.png", __ASSET__assets_whipfx_0_1_png);
		type.set ("assets/WhipFX-0-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/WhipFX-0-2.png", __ASSET__assets_whipfx_0_2_png);
		type.set ("assets/WhipFX-0-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/WhipFX-0-3.png", __ASSET__assets_whipfx_0_3_png);
		type.set ("assets/WhipFX-0-3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/WhipFX-1-1.png", __ASSET__assets_whipfx_1_1_png);
		type.set ("assets/WhipFX-1-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/WhipFX-1-2.png", __ASSET__assets_whipfx_1_2_png);
		type.set ("assets/WhipFX-1-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/WhipFX-1-3.png", __ASSET__assets_whipfx_1_3_png);
		type.set ("assets/WhipFX-1-3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/WhipFX-2-0.png", __ASSET__assets_whipfx_2_0_png);
		type.set ("assets/WhipFX-2-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/WhipFX-2-1.png", __ASSET__assets_whipfx_2_1_png);
		type.set ("assets/WhipFX-2-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/WhipFX-2-2.png", __ASSET__assets_whipfx_2_2_png);
		type.set ("assets/WhipFX-2-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/WhipFX-2-3.png", __ASSET__assets_whipfx_2_3_png);
		type.set ("assets/WhipFX-2-3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		
		#elseif html5
		
		path.set ("assets/background.jpg", "assets/background.jpg");
		type.set ("assets/background.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Boom-0-0.png", "assets/Boom-0-0.png");
		type.set ("assets/Boom-0-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Boom-1-0.png", "assets/Boom-1-0.png");
		type.set ("assets/Boom-1-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Boom-2-0.png", "assets/Boom-2-0.png");
		type.set ("assets/Boom-2-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/ChildMale0-0-0.png", "assets/ChildMale0-0-0.png");
		type.set ("assets/ChildMale0-0-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/ChildMale0-1-0.png", "assets/ChildMale0-1-0.png");
		type.set ("assets/ChildMale0-1-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/ChildMale0-2-0.png", "assets/ChildMale0-2-0.png");
		type.set ("assets/ChildMale0-2-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/ChildMale0.png", "assets/ChildMale0.png");
		type.set ("assets/ChildMale0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/FX.png", "assets/FX.png");
		type.set ("assets/FX.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Ground.png", "assets/Ground.png");
		type.set ("assets/Ground.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Mountains.png", "assets/Mountains.png");
		type.set ("assets/Mountains.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/music/108604_Ash_Tarrant___What_.mp3", "assets/music/108604_Ash_Tarrant___What_.mp3");
		type.set ("assets/music/108604_Ash_Tarrant___What_.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/music/111767_Dirge_s_Nutcracker.mp3", "assets/music/111767_Dirge_s_Nutcracker.mp3");
		type.set ("assets/music/111767_Dirge_s_Nutcracker.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/music/38352_newgrounds_nikky_.mp3", "assets/music/38352_newgrounds_nikky_.mp3");
		type.set ("assets/music/38352_newgrounds_nikky_.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/music/515215_The-Evil-Nutcracker.mp3", "assets/music/515215_The-Evil-Nutcracker.mp3");
		type.set ("assets/music/515215_The-Evil-Nutcracker.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/music/68552_newgrounds_carol_.mp3", "assets/music/68552_newgrounds_carol_.mp3");
		type.set ("assets/music/68552_newgrounds_carol_.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/music/carol_of_the_bells.ogg", "assets/music/carol_of_the_bells.ogg");
		type.set ("assets/music/carol_of_the_bells.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/music/Evil-Nutcracker.ogg", "assets/music/Evil-Nutcracker.ogg");
		type.set ("assets/music/Evil-Nutcracker.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/music/jingle_bells.ogg", "assets/music/jingle_bells.ogg");
		type.set ("assets/music/jingle_bells.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/music/nightmare_bc.ogg", "assets/music/nightmare_bc.ogg");
		type.set ("assets/music/nightmare_bc.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/music/Nutcracker1.ogg", "assets/music/Nutcracker1.ogg");
		type.set ("assets/music/Nutcracker1.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/openfl.svg", "assets/openfl.svg");
		type.set ("assets/openfl.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/Santa.png", "assets/Santa.png");
		type.set ("assets/Santa.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Santa2-0-0.png", "assets/Santa2-0-0.png");
		type.set ("assets/Santa2-0-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Santa2-1-0.png", "assets/Santa2-1-0.png");
		type.set ("assets/Santa2-1-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Santa2-2-0.png", "assets/Santa2-2-0.png");
		type.set ("assets/Santa2-2-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Santa2-3-0.png", "assets/Santa2-3-0.png");
		type.set ("assets/Santa2-3-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Sky.png", "assets/Sky.png");
		type.set ("assets/Sky.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Sleigh-0-0.png", "assets/Sleigh-0-0.png");
		type.set ("assets/Sleigh-0-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Sleigh-1-0.png", "assets/Sleigh-1-0.png");
		type.set ("assets/Sleigh-1-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Sleigh-2-0.png", "assets/Sleigh-2-0.png");
		type.set ("assets/Sleigh-2-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Sleigh-3-0.png", "assets/Sleigh-3-0.png");
		type.set ("assets/Sleigh-3-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Sleigh.png", "assets/Sleigh.png");
		type.set ("assets/Sleigh.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sound/elec.ogg", "assets/sound/elec.ogg");
		type.set ("assets/sound/elec.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sound/explosion.ogg", "assets/sound/explosion.ogg");
		type.set ("assets/sound/explosion.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sound/fouet.ogg", "assets/sound/fouet.ogg");
		type.set ("assets/sound/fouet.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sound/grelots.ogg", "assets/sound/grelots.ogg");
		type.set ("assets/sound/grelots.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sound/grelots_beginning.ogg", "assets/sound/grelots_beginning.ogg");
		type.set ("assets/sound/grelots_beginning.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sound/lutins.ogg", "assets/sound/lutins.ogg");
		type.set ("assets/sound/lutins.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/Trees.png", "assets/Trees.png");
		type.set ("assets/Trees.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/Village.png", "assets/Village.png");
		type.set ("assets/Village.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/WhipFX-0-1.png", "assets/WhipFX-0-1.png");
		type.set ("assets/WhipFX-0-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/WhipFX-0-2.png", "assets/WhipFX-0-2.png");
		type.set ("assets/WhipFX-0-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/WhipFX-0-3.png", "assets/WhipFX-0-3.png");
		type.set ("assets/WhipFX-0-3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/WhipFX-1-1.png", "assets/WhipFX-1-1.png");
		type.set ("assets/WhipFX-1-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/WhipFX-1-2.png", "assets/WhipFX-1-2.png");
		type.set ("assets/WhipFX-1-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/WhipFX-1-3.png", "assets/WhipFX-1-3.png");
		type.set ("assets/WhipFX-1-3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/WhipFX-2-0.png", "assets/WhipFX-2-0.png");
		type.set ("assets/WhipFX-2-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/WhipFX-2-1.png", "assets/WhipFX-2-1.png");
		type.set ("assets/WhipFX-2-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/WhipFX-2-2.png", "assets/WhipFX-2-2.png");
		type.set ("assets/WhipFX-2-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/WhipFX-2-3.png", "assets/WhipFX-2-3.png");
		type.set ("assets/WhipFX-2-3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		
		#else
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<AssetData> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							path.set (asset.id, asset.path);
							type.set (asset.id, asset.type);
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest");
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		//return null;		
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

class __ASSET__assets_background_jpg extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_boom_0_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_boom_1_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_boom_2_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_childmale0_0_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_childmale0_1_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_childmale0_2_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_childmale0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_fx_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_ground_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_mountains_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_music_108604_ash_tarrant___what__mp3 extends null { }
class __ASSET__assets_music_111767_dirge_s_nutcracker_mp3 extends null { }
class __ASSET__assets_music_38352_newgrounds_nikky__mp3 extends null { }
class __ASSET__assets_music_515215_the_evil_nutcracker_mp3 extends null { }
class __ASSET__assets_music_68552_newgrounds_carol__mp3 extends null { }
class __ASSET__assets_music_carol_of_the_bells_ogg extends null { }
class __ASSET__assets_music_evil_nutcracker_ogg extends null { }
class __ASSET__assets_music_jingle_bells_ogg extends null { }
class __ASSET__assets_music_nightmare_bc_ogg extends null { }
class __ASSET__assets_music_nutcracker1_ogg extends null { }
class __ASSET__assets_openfl_svg extends null { }
class __ASSET__assets_santa_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_santa2_0_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_santa2_1_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_santa2_2_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_santa2_3_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sky_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sleigh_0_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sleigh_1_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sleigh_2_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sleigh_3_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sleigh_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sound_elec_ogg extends null { }
class __ASSET__assets_sound_explosion_ogg extends null { }
class __ASSET__assets_sound_fouet_ogg extends null { }
class __ASSET__assets_sound_grelots_ogg extends null { }
class __ASSET__assets_sound_grelots_beginning_ogg extends null { }
class __ASSET__assets_sound_lutins_ogg extends null { }
class __ASSET__assets_trees_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_village_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_whipfx_0_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_whipfx_0_2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_whipfx_0_3_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_whipfx_1_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_whipfx_1_2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_whipfx_1_3_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_whipfx_2_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_whipfx_2_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_whipfx_2_2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_whipfx_2_3_png extends flash.display.BitmapData { public function new () { super (0, 0); } }


#elseif html5






















































#end