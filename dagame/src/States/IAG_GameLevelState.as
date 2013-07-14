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
		protected var timer:FlxTimer;
		protected var deathTimer:FlxTimer;
		protected var handlingDeath:Boolean = false;
		public static var TIME_TO_COMPLETE_LEVEL_SECONDS:int = 180;
		
		protected var enemyGroup:FlxGroup = new FlxGroup();
		protected var enemyCollideGroup:FlxGroup = new FlxGroup();
		
		public function IAG_GameLevelState()
		{
		
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
			timer = new FlxTimer();
			deathTimer = new FlxTimer();
			timer.start(1, TIME_TO_COMPLETE_LEVEL_SECONDS, onTimer);
			
			time_display = new FlxText(0, 40, 100, "Time: " + TIME_TO_COMPLETE_LEVEL_SECONDS);
			time_display.origin = new FlxPoint(0, 0);
			time_display.scale = new FlxPoint(4, 4);
			time_display.scrollFactor = new FlxPoint();
			this.add(time_display);
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
			else if (!handlingDeath)
			{
				deathTimer.start(4, 1, DeathReset)
				handlingDeath = true;
			}
			life_display.text = "Lives: " + player.numberOfLives;
			//FlxG.collide(tmap, player, PlayerTouchDown);
			camera.alignCamera();
			
			FlxG.overlap(player, enemyGroup, playerEnemyCallback);
			FlxG.collide(enemyCollideGroup, tmap);
		
		}
		
		protected function playerEnemyCallback(player:FlxObject, enemy:FlxObject)
		{
			player.kill();
		}
		
		public function PlayerTouchDown(tmap:FlxTilemap, player:Player):void
		{
			player.TouchDownCallback(tmap);
		}
		
		private function onTimer(timer:FlxTimer):void
		{
			if (timer.loopsLeft == 0)
			{
				player.Kill();
				
				player.alive = false;
			}
			else
			{
				this.remove(time_display);
				time_display = new FlxText(0, 40, 100, "Time: " + timer.loopsLeft);
				time_display.origin = new FlxPoint(0, 0);
				time_display.scale = new FlxPoint(4, 4);
				time_display.scrollFactor = new FlxPoint();
				this.add(time_display);
			}
		}
		
		private function DeathReset(timer:FlxTimer):void
		{
			camera.fade(0xff000000, 1, bringToLife);
		}
		
		private function bringToLife():void
		{
			camera.stopFX();
			if (player.numberOfLives > 0)
			{
				player.reset(100, 100);
				handlingDeath = false;
			}
			else
			{
				FlxG.switchState(new HUB());
			}
		}
	}
}
