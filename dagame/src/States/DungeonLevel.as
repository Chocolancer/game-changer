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
			tmap.setTileProperties(3, 0x1111, SpikeCollisionCallback);
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
		
		private function SpikeCollisionCallback(Tile:FlxTile, Object:FlxObject):void 
		{
			player.kill();
			if (player.hasLives())
			{
				camera.shake(0.05, 0.5, afterDeathShake);
			}
		}
		
		private function afterDeathShake():void
		{
			camera.flash();
			player.reset(200, 3344);
			player.x = checkPoints[currectCheckPoint][0];
			player.y = checkPoints[currectCheckPoint][1];
			player.alive = true;
		}
	}

}