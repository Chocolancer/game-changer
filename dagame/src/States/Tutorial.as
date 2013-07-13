package States 
{
	import Objects.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Tutorial extends IAG_GameLevelState 
	{
		private var player:Player = new Player();
		private var tmap:FlxTilemap;
		private var camera:FlxCamera;
		
		[Embed(source = "/../art/test_player.png")] public static var GFX_Player:Class; 
		[Embed(source = "/../art/testtileart.png")] public static var GFX_TileSet:Class; 
		[Embed(source = "/../tilemaps/testtile.txt", mimeType = "application/octet-stream")] public var TMAP_Map:Class;
		
		public function Tutorial() 
		{
		
			
			
		}
		
		override public function create():void 
		{
			super.create();
				tmap = new FlxTilemap();
			tmap.loadMap(new TMAP_Map, GFX_TileSet, 32, 32);
			this.add(tmap); 
			this.add(player); 
			
			FlxG.worldBounds = new FlxRect( -500, -500, 1000, 1000);
			camera = new FlxCamera(0, 0, FlxG.width, FlxG.height, 2);
			camera.setBounds( -500, -500, 1000, 1000);
			FlxG.resetCameras(camera);
			
			camera.follow(player, FlxCamera.STYLE_LOCKON);
		}
		
		override public function update():void 
		{
			super.update();
			
			FlxG.collide(tmap, player);
		}
		
	}

}