package States 
{
	import Objects.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class MarioLevel extends IAG_GameLevelState 
	{
		public function MarioLevel() 
		{
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_MalioMap, Resources.GFX_MalioTileSet, 32, 32);
			tmap.setTileProperties(1, FlxObject.NONE);
			tmap.setTileProperties(6, FlxObject.NONE);
			tmap.setTileProperties(11, FlxObject.NONE, player.fall);
		
		}
		override public function create():void 
		{
			super.create();		
		}
	}

}