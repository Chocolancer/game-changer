package Objects 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher & The collision master
	 */
	public class FlyingPig extends IAG_Sprite
	{
		private var flyingLeft:Boolean = true;
		private const FLY_TIME:Number = 3;
		private var flyingTimer:Number = FLY_TIME;
		
		
		public function FlyingPig(x:int, y:int) //enemy example
		{
			//this.loadGraphic(GFX_Player, true, true, 92, 92);
			this.x = x;
			this.y = y;
			//this.addAnimation("fly", [0]);
			this.play("fly");
			this.maxVelocity.x = 450;
			
			this.loadGraphic(Resources.GFX_FlyingPig, true, true);
			this.addAnimation("idle", [0, 1, 2, 3, 4, 5], 8);
			this.play("idle");
		}
		
		override public function update():void 
		{
			flyingTimer -= FlxG.elapsed;
			
			if (flyingTimer <= 0 )
			{
				flyingTimer = FLY_TIME;
				flyingLeft = !flyingLeft;
			}
			
			if (flyingLeft)
			{
				this.velocity.x = -20;
			}
			else
			{
				this.velocity.x = 20;
			}
		}
		
	}

}