package Objects 
{
	import org.flixel.plugin.photonstorm.FlxMath;
	import States.IAG_GameLevelState;
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher & Cimreau
	 */
	public class WhiteKnight extends IAG_Sprite
	{
		
		private var axeTimer:FlxTimer;
		private var hitpoints:int;
		private var game:IAG_GameLevelState;
		private var sound:FlxSound = new FlxSound();
		
		public function WhiteKnight(gameRef:IAG_GameLevelState):void
		{
			this.x = 7765;
			this.y = 1220;
			axeTimer = new FlxTimer();
			loadGraphic(Resources.GFX_WhiteKnight, true, true, 92, 92);
			this.addAnimation("idle", [0]);
			this.play("idle");
			facing = LEFT;
			this.maxVelocity.x = 450;
			hitpoints = 20;
			game = gameRef;
		}
		
		override public function update():void 
		{
		}
		
		public function Kill():void
		{
			sound.loadEmbedded(Resources.SND_Playerdie);
			sound.play(true);
		}
		
		private function axeCallBack(Timer:FlxTimer):void {
			game.addAxe(new Axe(x, y, false));
		}
	}
}
