package States 
{
	import Objects.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher & The guy who cant do collisions
	 */
	public class TowerLevel extends IAG_GameLevelState 
	{
		private var spikesHitbox:FlxSprite;
		
		
		private var playedDiedReset:Boolean = false;
		
		
		private var scissorGroup:FlxGroup = new FlxGroup();
		
		 
		
		
		
		public function TowerLevel() 
		{
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_TowerMap, Resources.GFX_TowerTileSet, 32, 32);
			//player.x = 50;
			//player.y = 10; temporary until set starting points are laid out for user.
			tmap.setTileProperties(1, FlxObject.NONE);
			tmap.setTileProperties(3, FlxObject.NONE);
			

			
		}
		
		override public function create():void 
		{
			super.create();
			player.x = 200;
			player.y = 3344;
			FlxG.worldBounds = new FlxRect( 64, 0, 1350, 3760);
			camera = new CustCamera(0, 0, FlxG.width * 2, FlxG.height * 2, 1); 
			camera.setBounds( 64, 0, 1350, 3760);
			camera.follow(player);
			FlxG.resetCameras(camera);
			
			
			spikesHitbox = new FlxSprite(0, 3590);
			spikesHitbox.makeGraphic(1400, 100, 0x00dd0000);
			this.add(spikesHitbox);
						
			for (var i:int = 0; i < 8; i++)
			{
				var scissor:FlxSprite = new FlxSprite(160 * (i + 1), 3414);
				 
				scissor.loadGraphic( Resources.GFX_Scissors, true, false, 75, 144);
			
				scissor.addAnimation("idle", [0, 1, 2], 8);
				scissor.play("idle");
				scissor.scale.x = 2;
				scissor.scale.y = 2;
				scissorGroup.add(scissor);
			}
			this.add(scissorGroup);
			
			var pig1:FlyingPig = new FlyingPig(721, 3000);
			
			enemyGroup.add(pig1);
			
		}
		
		
		override public function update():void 
		{
			super.update();
			spikesHitbox.velocity.y = -45;
			
			FlxG.overlap(this.player, this.spikesHitbox, handlePlayerSpikes);
			
			for (var i:Number = 0; i < scissorGroup.length; i++) 
			{
				scissorGroup.members[i].y = spikesHitbox.y + 20;
			}
		}
		override protected function playerEnemyCallback(player:FlxObject, enemy:FlxObject)
		{
			super.playerEnemyCallback(player, enemy);
					handlePlayerSpikes(player, enemy);
			return player;
		}
		
		
		private function handlePlayerSpikes(playerObj:FlxObject, spikes:FlxObject)
		{
			var player:Player = playerObj as Player;
			player.kill();
			if (player.hasLives())
			{
				playedDiedReset = true; 
				camera.shake(0.05, 0.5, afterDeathShake);
			
			}
		}
		
		private function afterDeathShake():void
		{
			camera.flash();
			player.reset(200, 3344);
			player.x = 200;
			player.y = 3344;
			player.alive = true;
			spikesHitbox.y = 3500;
		}
	}

}