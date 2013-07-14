package States
{
	import Objects.*;
	import org.flixel.*;
	import org.flixel.system.FlxTile;
	import Objects.WhiteKnight;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class DungeonLevel extends IAG_GameLevelState 
	{		
		private var checkpoint1:FlxSprite;
		private var checkpoint2:FlxSprite;
		private var checkpoint3:FlxSprite;
		private var checkpoint4:FlxSprite;
		private var checkpoint5:FlxSprite;
		private var cps:FlxGroup = new FlxGroup();
		private var boss:WhiteKnight;
		
		public function DungeonLevel() 
		{ 
			super();
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_Dungeon, Resources.GFX_TestTileSet, 32, 32);
			tmap.setTileProperties(3, 0x1111, FloorSpikeCollisionCallback);
			tmap.setTileProperties(4, 0x1111, CeilingSpikeCollisionCallback);
			tmap.setTileProperties(5, 0x1111, PopBoxCollisionCallback);
			this.checkPoints[0] = [ 312, 80];
			this.checkPoints[1] = [ 1950, 1310];
			this.checkPoints[2] = [ 936, 336];
			this.checkPoints[3] = [ 2650, 1328];
			this.checkPoints[4] = [ 4960, 336];
			this.checkPoints[5] = [ 7105, 1230];
			checkpoint1 = new FlxSprite(1950, 1310);
			checkpoint2 = new FlxSprite(936, 336);
			checkpoint3 = new FlxSprite(2650, 1328);
			checkpoint4 = new FlxSprite(4960, 336);
			checkpoint5 = new FlxSprite(7105, 1230);
			cps.add(checkpoint1);
			cps.add(checkpoint2);
			cps.add(checkpoint3);
			cps.add(checkpoint4);
			cps.add(checkpoint5);
			add(cps);
			
			boss = new WhiteKnight(this);
		}
		
		override public function create():void 
		{
			super.create();	
			player.x = checkPoints[currectCheckPoint][0];
			player.y = checkPoints[currectCheckPoint][1];
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.overlap(this.player, this.cps, checkPointCallback);
			FlxG.overlap(this.player, this.boss, playerEnemyCallback);
		}
		
		private function checkPointCallback(nothing:FlxObject, nothing2:FlxObject):void
		{
			if (nothing2.alive)
			{
				nothing2.alive = false;
				currectCheckPoint++;
			}
		}
		
		private function PopBoxCollisionCallback(Tile:FlxTile, Object:FlxObject):void {
			
			if (player.isTouching(0x1000))
			{
				var box = new PopUpBox(this, Tile.x, Tile.y);
				this.add(box.spikes);
				box.Activate();
			}
		}
		
		private function FloorSpikeCollisionCallback(Tile:FlxTile, Object:FlxObject):void 
		{
			if (player.justTouched(0x1000))
			{
				player.kill();
				if (player.hasLives())
				{
					camera.shake(0.05, 0.5, afterDeathShake);
				}
			}
		}
		private function CeilingSpikeCollisionCallback(Tile:FlxTile, Object:FlxObject):void 
		{
			if (player.justTouched(0x0100))
			{
				player.kill();
				if (player.hasLives())
				{
					camera.shake(0.05, 0.5, afterDeathShake);
				}
			}
		}
		
		private function afterDeathShake():void
		{
			camera.flash();
			bringToLife(200, 3344);
		}
	}
}
