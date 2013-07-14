package States
{
	import flash.utils.Timer;
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
		protected var time_display:FlxText;
		public static var TIME_TO_COMPLETE_LEVEL_SECONDS:int = 180;
		protected var checkPoints:Array = new Array();
		protected var currectCheckPoint:uint = 0;
		protected var timer:FlxTimer;
		protected var playerIsDead:Boolean = false;
		
		public var enemyGroup:FlxGroup = new FlxGroup(); 
		protected var enemyCollideGroup:FlxGroup = new FlxGroup(); 
		
		public function IAG_GameLevelState()
		{
			checkPoints[0] = [ 100, 100 ];
		}
		
		override public function create():void
		{
			super.create();
			this.add(tmap);
			player = new Player();
			this.add(player);
			
			FlxG.worldBounds = new FlxRect(0, 0, 10000, 10000);
			camera = new CustCamera(0, 0, FlxG.width * 2, FlxG.height * 2, 1);
			camera.setBounds(-20, -20, 8040, 8040);
			FlxG.resetCameras(camera);
			
			camera.follow(player, FlxCamera.STYLE_PLATFORMER);
			
			life_display = new FlxText(0, 0, 100, "Lives: " + player.numberOfLives);
			life_display.origin = new FlxPoint(0, 0);
			life_display.scale = new FlxPoint(4, 4);
			life_display.scrollFactor = new FlxPoint();
			this.add(life_display);
			
			time_display = new FlxText(0, 40, 100, "Time: " + TIME_TO_COMPLETE_LEVEL_SECONDS);
			time_display.origin = new FlxPoint(0, 0);
			time_display.scale = new FlxPoint(4, 4);
			time_display.scrollFactor = new FlxPoint();
			this.add(time_display);
			
			timer = new FlxTimer();
			timer.start(1, TIME_TO_COMPLETE_LEVEL_SECONDS, onTimer);
			
			camera.zoom = 2;
			
			this.add(enemyGroup);
			camera.flash(0xff000000);
		}
		
		override public function update():void
		{
			super.update();
			if (!player.isDead)
			{
				FlxG.collide(tmap, player, PlayerTouchDown);
			}
			
			life_display.text = "Lives: " + player.numberOfLives;
			camera.alignCamera();
			
			FlxG.overlap(player, enemyGroup, playerEnemyCallback);
			FlxG.collide(enemyCollideGroup, tmap);
		
		}
		
		protected function playerEnemyCallback(player:FlxObject, enemy:FlxObject):void
		{
			onDeath();
		}
		
		public function PlayerTouchDown(tmap:FlxTilemap, player:Player):void
		{
			player.TouchDownCallback(tmap);
		}
		
		private function onTimer(timer:FlxTimer):void
		{
			if (timer.loopsLeft == 0)
			{
				// kill the player when time runs out
				onDeath();
			}
			else
			{
				// update the timer
				this.remove(time_display);
				time_display = new FlxText(0, 40, 100, "Time: " + timer.loopsLeft);
				time_display.origin = new FlxPoint(0, 0);
				time_display.scale = new FlxPoint(4, 4);
				time_display.scrollFactor = new FlxPoint();
				this.add(time_display);
			}
		}
		
		protected function onDeath():void
		{
			if (!player.isDead)
			{
				player.isDead = true;
				player.Kill();
				camera.shake(0.05, 0.5, respawnPlayer);
			}
		}
		
		protected function respawnPlayer():void
		{
			bringToLife(100, 100);
		}
		
		protected function bringToLife(x:int, y:int):void
		{
			camera.stopFX();
			camera.flash();
			if (player.numberOfLives > 0)
			{
				player.reset(checkPoints[currectCheckPoint][0], checkPoints[currectCheckPoint][1]);
				player.isDead = false;
				timer.destroy();
				timer = new FlxTimer();
				timer.start(1, TIME_TO_COMPLETE_LEVEL_SECONDS, onTimer);
			}
			else
			{
				FlxG.switchState(new HUB());
			}
		}
	}
}
