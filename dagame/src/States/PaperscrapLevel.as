package States 
{
	import Objects.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class PaperscrapLevel extends IAG_GameLevelState 
	{
		
		public function PaperscrapLevel() 
		{
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_PaperscrapsMap, Resources.GFX_PaperscrapsTileSet, 32, 32);
			tmap.setTileProperties(1, FlxObject.NONE);
		}
		
		override public function create():void 
		{
			super.create();		
		}
	}

}