package States 
{
	import Objects.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class TowerLevel extends IAG_GameLevelState 
	{
		private var spikesHitbox:FlxSprite;
		
		
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
			
			
			spikesHitbox = new FlxSprite(0, 3500);
			spikesHitbox.makeGraphic(1400, 100, 0x88dd0000);
			this.add(spikesHitbox);
			//var cameraFollow: TrailingCameraFollow = new TrailingCameraFollow(tmap);
			//camera.follow(cameraFollow, FlxCamera.STYLE_PLATFORMER);
		}
		
		
		override public function update():void 
		{
			super.update();
			spikesHitbox.velocity.y = -15;
			
			FlxG.overlap(this.player, this.spikesHitbox, handlePlayerSpikes);
		}
		
		private function handlePlayerSpikes(player:FlxObject, spikes:FlxObject)
		{
			player.kill();
		}
	}

}