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
		public function Tutorial() 
		{ 
			player.x = 64;
			player.y = 90;
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_Map, Resources.GFX_TestTileSet, 32, 32); 
		}
		
		override public function create():void 
		{
			super.create();		
		}		
	}

}