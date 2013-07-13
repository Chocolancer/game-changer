package Objects 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Player extends IAG_Sprite
	{
		[Embed(source = "/../assets/gameart/test_player.png")] public static var GFX_Player:Class;
		
		public var isInAir:Boolean = true;
		public var wasWDown:Boolean = false;
		public var isFacingForward:Boolean = false;
		public var numberOfLives:int = 3;

		public function Player() 
		{
			 this.loadGraphic(GFX_Player, true, true, 92, 92);
			 
			 this.addAnimation("idle", [0]);
			 this.addAnimation("running", [0,1,2,3,4,5,6],10);
			 this.play("idle");
			 this.maxVelocity.x = 400;
			 this.maxVelocity.y = 1000;
		}
		
		
		override public function update():void 
		{
			super.update();
			acceleration.y = 600;
			
			if (FlxG.keys.A)
			{
				if (!this.isInAir)
				{
					this.velocity.x -= 20;
				}
				else
				{
					this.velocity.x -= 5;
				}
				isFacingForward = false;
				if (!this.isInAir)
				{
					this.play("running");
				}
				else
				{
					this.play("idle");
				}
			}
			else if (FlxG.keys.D)
			{
				if (!this.isInAir)
				{
					this.velocity.x += 20;
				}
				else
				{
					this.velocity.x += 5;
				}
				isFacingForward = true;
				if (!this.isInAir)
				{
					this.play("running");
				}
				else
				{
					this.play("idle");
				}
			}
			else
			{ 
				if (this.velocity.x > 0)
				{
					this.velocity.x -= 20;
					if (this.velocity.x < 0)
					{
						this.velocity.x = 0;
					}
					this.play("running");
				}
				else if (this.velocity.x < 0)
				{
					this.velocity.x += 20;
					if (this.velocity.x > 0)
					{
						this.velocity.x = 0;
					}
					this.play("running");
				}
				else
				{
					this.play("idle");
				}
			}
			
			
			if (FlxG.keys.W)
			{
				if (!this.isInAir && !wasWDown)
				{
					this.velocity.y = -400;
					this.play("idle");
					this.isInAir = true;
				}
				wasWDown = true;
			}
			else
			{
				wasWDown = false;
			}
			
			if (isFacingForward)
			{
				this.facing = FlxObject.LEFT;
			}
			else
			{
				this.facing = FlxObject.RIGHT;
			}
		}
		
		public function TouchDownCallback(tmap:FlxTilemap):void {
			if (this.justTouched(FLOOR))
			{
				this.isInAir = false;
			}
		}
	}

}