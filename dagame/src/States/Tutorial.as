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
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_Map, Resources.GFX_Player, 32, 32); 
		}
		
		override public function create():void 
		{
			super.create();		
		}
		
		override public function update():void 
		{
			super.update();
			
			FlxG.collide(tmap, player);
		}
	}

}