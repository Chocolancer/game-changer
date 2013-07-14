package States 
{
	import Objects.*;
	import org.flixel.*;
	import org.flixel.system.FlxTile;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class DungeonLevel extends IAG_GameLevelState 
	{		
		public function DungeonLevel() 
		{ 
			super();
			//player.x = 64;
			//player.y = 90;
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_Dungeon, Resources.GFX_TestTileSet, 32, 32);
			tmap.setTileProperties(3, 0x1111, playerEnemyCallback);
			tmap.setTileProperties(5, 0x1111, PopBoxCollisionCallback);
			checkPoints[0] = [ 312, 80];
		}
		
		override public function create():void 
		{
			super.create();	
			player.x = checkPoints[currectCheckPoint][0];
			player.y = checkPoints[currectCheckPoint][1];
		}
		
		private function PopBoxCollisionCallback(Tile:FlxTile, Object:FlxObject):void {
			var box = new PopUpBox(this, Tile.x, Tile.y);
			this.add(box.spikes);
			box.Activate();
		}
		
		override protected function respawnPlayer():void
		{
			player.x = checkPoints[currectCheckPoint][0];
			player.y = checkPoints[currectCheckPoint][1];
			bringToLife(200, 3344);
		}
	}

}