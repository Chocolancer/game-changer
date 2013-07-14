package States 
{
	import Objects.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class BossFight extends IAG_GameLevelState 
	{
		
		public function BossFight() 
		{
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_BossMap, Resources.GFX_TSET_Boss, 32, 32);
			tmap.setTileProperties(1, FlxObject.NONE);
		}
		
		override public function create():void 
		{
			super.create();		
		}
	}

}