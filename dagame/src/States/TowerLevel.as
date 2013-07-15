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
		private var checkpoint:FlxSprite;
		private var spikesHitbox:FlxSprite;
		private var scissorGroup:FlxGroup = new FlxGroup();
		
		private var door:FlxSprite;
		private var doorHitbox:FlxSprite;
		
		 
		public function TowerLevel() 
		{
			this.checkPoints[0] = [200, 3344];
			this.checkPoints[1] = [575, 1840];
			
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_TowerMap, Resources.GFX_TowerTileSet, 32, 32);
			tmap.setTileProperties(1, FlxObject.NONE);
			tmap.setTileProperties(3, FlxObject.NONE);
			
			checkpoint = new FlxSprite(570, 1890);
			checkpoint.loadGraphic(Resources.GFX_Checkpoint, false, false, 32, 64);
			checkpoint.addAnimation("alive", [0], 0);
			checkpoint.play("alive");
			checkpoint.addAnimation("dead", [1], 0);
		}
		
		override public function create():void 
		{
			super.create();
			
			player.x = checkPoints[currentCheckPoint][0];
			player.y = checkPoints[currentCheckPoint][1];
			
			FlxG.worldBounds = new FlxRect( 64, 0, 1350, 3760);
			camera = new CustCamera(0, 0, FlxG.width * 2, FlxG.height * 2, 1); 
			camera.setBounds( 64, 0, 1350, 3760);
			camera.follow(player);
			FlxG.resetCameras(camera);
			
			FlxG.playMusic(Resources.SND_TowerLevel);
			
			spikesHitbox = new FlxSprite(0, 3590);
			spikesHitbox.makeGraphic(1400, 100, 0x00dd0000);
			this.add(spikesHitbox);
			this.add(checkpoint);
						
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
			
			door = new FlxSprite(620, 80);
			door.loadGraphic(Resources.GFX_Door);
			door.addAnimation("idle", [0]);
			door.play("idle");
			this.add(door);
			
			doorHitbox = new FlxSprite(620, 80);
			doorHitbox.makeGraphic(1, 1, 0x00dd0000);
			this.add(doorHitbox);			
		}
		
		override public function update():void 
		{
			super.update();			
			
			FlxG.overlap(this.player, this.doorHitbox, exitDoorCallback);
			FlxG.overlap(this.player, this.checkpoint, checkPointCallback);
			
			
			spikesHitbox.velocity.y = -45;
			
			FlxG.overlap(this.player, this.spikesHitbox, playerEnemyCallback);
			
			for (var i:Number = 0; i < scissorGroup.length; i++) 
			{
				scissorGroup.members[i].y = spikesHitbox.y + 20;
			}
		}
		
		private function checkPointCallback(player:FlxObject, checkPoint:FlxObject):void
		{
			if (checkPoint.alive)
			{
				checkPoint.alive = false;
				var temp:FlxSprite = checkPoint as FlxSprite;
				temp.play("dead");
				
				currentCheckPoint++;
			}
		}
		
		private function exitDoorCallback(nothing:FlxObject,nothing2:FlxObject):void
		{
			sound.loadEmbedded(Resources.SND_Nextlevel);
			sound.play(true);
			FlxG.flash(0xffffffff, 1, exitDoorCallback2);
		}
		
		private function exitDoorCallback2():void
		{
			FlxG.switchState(new DungeonLevel());
		}
		
		override protected function playerEnemyCallback(player:FlxObject, enemy:FlxObject):void
		{
			super.playerEnemyCallback(player, enemy);
			handlePlayerSpikes(player, enemy);
		}
		
		private function handlePlayerSpikes(playerObj:FlxObject, spikes:FlxObject):void
		{
			var player:Player = playerObj as Player;
			player.kill();
			if (player.hasLives())
			{
				camera.shake(0.05, 0.5, afterDeathShake);
			
			}
		}
		
		private function afterDeathShake():void
		{
			camera.flash();
			bringToLife();
			spikesHitbox.y = checkPoints[currentCheckPoint][1] + 200;
		}
	}
}