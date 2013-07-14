package States 
{
	import Objects.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class TowerLevel extends IAG_GameLevelState 
	{
		public function TowerLevel() 
		{
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_TowerMap, Resources.GFX_TowerTileSet, 32, 32);
			//player.x = 50;
			//player.y = 10; temporary until set starting points are laid out for user.
			tmap.setTileProperties(1, FlxObject.NONE);
			tmap.setTileProperties(3, FlxObject.NONE);
		}
		
		override public function create():void 
		{
			super.create();
			
			//var cameraFollow: TrailingCameraFollow = new TrailingCameraFollow(tmap);
			//camera.follow(cameraFollow, FlxCamera.STYLE_PLATFORMER);
		}
	}

}