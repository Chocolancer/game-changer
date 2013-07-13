package States 
{
	import Objects.*;
	import org.flixel.*;
	
	public class DiscoLevel extends IAG_GameLevelState 
	{
		
		public function DiscoLevel() 
		{
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_DiscoMap, Resources.GFX_DiscoTileSet, 32, 32);
			tmap.setTileProperties(6, FlxObject.NONE);
		}
		
		override public function create():void 
		{
			super.create();		
		}
	}

}