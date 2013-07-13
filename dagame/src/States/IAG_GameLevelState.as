package States 
{
	import Objects.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class IAG_GameLevelState extends IAG_State 
	{
		protected var player:Player = new Player();
		protected var tmap:FlxTilemap;
		protected var camera:CustCamera;
		protected var life_display:FlxText;
		protected var timer:FlxTimer;
		protected var time_remaining:int;

		public function IAG_GameLevelState()
		{
	
		}

		override public function create():void
		{
			super.create();
			this.add(tmap); 
			this.add(player); 
			
			FlxG.worldBounds = new FlxRect( 0, 0, 10000, 10000);
			camera = new CustCamera(0, 0, FlxG.width * 2, FlxG.height * 2, 1);
			camera.setBounds( -20, -20, 1384, 744);
			FlxG.resetCameras(camera);
			
			camera.follow(player, FlxCamera.STYLE_PLATFORMER);

			life_display = new FlxText(0, 0, 100, "Lives: " + player.numberOfLives);
			life_display.scrollFactor = new FlxPoint();
			this.add(life_display);

			time_remaining = 180;
			//timer.start(1, time_remaining /* callback function to "kill" the player */);
	
			camera.follow(player, FlxCamera.STYLE_LOCKON);
			camera.zoom = 2;
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(tmap, player, PlayerTouchDown);
			camera.alignCamera();
		}
		
		public function PlayerTouchDown(tmap:FlxTilemap, player:Player):void {
			player.TouchDownCallback(tmap);
		}
	}
}
