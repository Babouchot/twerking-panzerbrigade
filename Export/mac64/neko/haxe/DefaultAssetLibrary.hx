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
		className.set ("assets/bam.mp3", __ASSET__assets_bam_mp3);
		type.set ("assets/bam.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
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
		path.set ("assets/bam.mp3", "assets/bam.mp3");
		type.set ("assets/bam.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
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
class __ASSET__assets_bam_mp3 extends null { }
class __ASSET__assets_childmale0_0_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_childmale0_1_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_childmale0_2_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_childmale0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_fx_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_openfl_svg extends null { }
class __ASSET__assets_santa_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_santa2_0_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_santa2_1_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_santa2_2_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_santa2_3_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sleigh_0_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sleigh_1_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sleigh_2_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sleigh_3_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sleigh_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
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