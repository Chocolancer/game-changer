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
			
			var pig1:FlyingPig = new FlyingPig(932, 1000); 
			enemyGroup.add(pig1);
			
			var pig2:FlyingPig = new FlyingPig(1830, 900); 
			enemyGroup.add(pig2);
			
			var pig3:FlyingPig = new FlyingPig(2664, 720); 
			enemyGroup.add(pig3);
			
			var pig4:FlyingPig = new FlyingPig(3750, 900); 
			enemyGroup.add(pig4);
			
			var pig5:FlyingPig = new FlyingPig(4510, 700); 
			enemyGroup.add(pig5);
			
			var pig6:FlyingPig = new FlyingPig(4880, 620); 
			enemyGroup.add(pig6);
		}
		
		override protected function playerEnemyCallback(player:FlxObject, enemy:FlxObject)
		{
			super.playerEnemyCallback(player, enemy);
			handlePlayerDeath(player, enemy);
			return player;
		}
		
		private function handlePlayerDeath(playerObj:FlxObject, spikes:FlxObject)
		{
			var player:Player = playerObj as Player;
			player.kill();
			if (player.hasLives())
			{
				playedDiedReset = true; 
				camera.shake(0.05, 0.5, afterDeathShake);
			
			}
		}
	}

}