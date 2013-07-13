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
		protected var camera:FlxCamera;
		protected var life_display:FlxText;
		protected var time_display:FlxText;
		protected var timer:FlxTimer;
		public static var TIME_TO_COMPLETE_LEVEL_SECONDS:int = 180;

		public function IAG_GameLevelState()
		{
	
		}

		override public function create():void
		{
			super.create();
			this.add(tmap); 
			this.add(player); 
			
			FlxG.worldBounds = new FlxRect( -500, -500, 10000, 10000);
			camera = new FlxCamera(0, 0, FlxG.width, FlxG.height, 2);
			camera.setBounds( -500, -500, 10000, 10000);
			FlxG.resetCameras(camera);
			
			camera.follow(player, FlxCamera.STYLE_PLATFORMER);

			life_display = new FlxText(0, 0, 100, "Lives: " + player.numberOfLives);
			life_display.scrollFactor = new FlxPoint();
			this.add(life_display);

			timer = new FlxTimer();
			timer.start(1, TIME_TO_COMPLETE_LEVEL_SECONDS, onTimer);
			
			time_display = new FlxText(0, 10, 100, "Time: " + TIME_TO_COMPLETE_LEVEL_SECONDS);
			time_display.scrollFactor = new FlxPoint();
			this.add(time_display);
			
			camera.follow(player, FlxCamera.STYLE_LOCKON);
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(tmap, player, PlayerTouchDown);
		}
		
		public function PlayerTouchDown(tmap:FlxTilemap, player:Player):void
		{
			player.TouchDownCallback(tmap);
		}
		
		private function onTimer(timer:FlxTimer):void
		{
			if (timer.loopsLeft == 0)
			{
				// kill off the player
			}
			else
			{
				this.remove(time_display);
				time_display = new FlxText(0, 10, 100, "Time: " + timer.loopsLeft);
				time_display.scrollFactor = new FlxPoint();
				this.add(time_display);
			}
		}
	}
}
