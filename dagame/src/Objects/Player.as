package Objects 
{
	import flash.display.GraphicsEndFill;
	import flash.events.DRMAuthenticationCompleteEvent;
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Player extends IAG_Sprite
	{
		private var playerinfo:FlxText;
		private var debugMode:Boolean = false;
		
		
		
		private const AIR_VELOCITY:Number = 10;
		
		public var isInAir:Boolean = true;
		public var isJumping:Boolean = false;
		public var wasWDown:Boolean = false;
		public var isFacingForward:Boolean = false;
		public var numberOfLives:int = 2;
		public var jumpTimer:FlxTimer;
		public var isDead:Boolean = false;
		
		public function hasLives():Boolean
		{
			if (numberOfLives > 0)
			{
				return true;
			}
			return false;
		}

		public function Player() 
		{
			this.loadGraphic(Resources.GFX_Player, true, true, 92, 89);
			this.width = 40;
			this.height = 80;
			this.offset.x = 26;
			this.offset.y = 0;
			this.x = 100;
			this.y = 200;
			this.addAnimation("idle", [20]);
			this.addAnimation("running", [0, 1, 2, 3, 4, 5, 6], 10);
			this.addAnimation("walking", [14, 15, 16, 17, 18, 19], 10);
			this.addAnimation("asc", [7, 8],1);
			this.addAnimation("desc", [9,10],16);
			this.play("idle");
			this.maxVelocity.x = 400;
			this.maxVelocity.y = 1000;
			jumpTimer = new FlxTimer();
			acceleration.y = 600;
			
			//TODO: This is where you enable player debugging
			
			debugMode = true;
			
			if (debugMode)
			{
				playerinfo = new FlxText(this.x - 20, this.y - 10, 150, "debug info");
				
			}
		}
		
		
		override public function update():void 
		{
			if (isDead)
			{
				alive = false;
				UpdateDead();
			}
			else
			{
				super.update();
				UpdateAlive();
			}
		}
		
		public function TouchDownCallback(tmap:FlxTilemap):void {
			if (this.justTouched(FLOOR))
			{
				this.isInAir = false;
			}
		}
		
		private function JumpCallback(Timer:FlxTimer):void {
			this.isJumping = false;
		}
		
		public function Kill():void {
			this.isDead = true;
			this.play("idle");
			this.numberOfLives--;
			this.velocity.y = -500;
		}
		
		private function UpdateAlive():void {
			
			super.update();
			acceleration.y = 3000;
			
			if (!this.alive && !this.exists) {
				this.numberOfLives--;
				this.reset(10, 10);
			}
			
			if (numberOfLives < 0) {
				FlxG.resetGame(); //temporary until possible to show game over
			}
			
			if (!this.isTouching(FLOOR))
			{
				this.isInAir = true;
			}
			
			if (FlxG.keys.A)
			{
				if (!this.isInAir)
				{
					this.velocity.x -= 20;
				}
				else
				{
					this.velocity.x -= AIR_VELOCITY;
				}
				isFacingForward = false; 
			}
			else if (FlxG.keys.D)
			{
				if (!this.isInAir)
				{
					this.velocity.x += 20;
				}
				else
				{
					this.velocity.x += AIR_VELOCITY;
				}
				isFacingForward = true; 
			}
			else
			{ 
				if (this.velocity.x > 0)
				{
					if (this.isInAir)
					{
						this.velocity.x -= 3;
					}
					else
					{
						this.velocity.x -= 20;
					}
					if (this.velocity.x < 0)
					{
						this.velocity.x = 0;
					} 
				}
				else if (this.velocity.x < 0)
				{
					if (this.isInAir)
					{
						this.velocity.x += 3;
					}
					else
					{
						this.velocity.x += 20;
					}
					if (this.velocity.x > 0)
					{
						this.velocity.x = 0;
					} 
				} 
			}
			
			
			if (FlxG.keys.W)
			{
				if (isJumping)
				{
					this.velocity.y = -400;
					if (this.isTouching(CEILING))
					{
						isJumping = false;
					} 
				}
				else if (!this.isInAir && !wasWDown)
				{
					this.velocity.y = 0; 
					this.isInAir = true;
					this.isJumping = true;
					this.jumpTimer.start(1.0, 1, JumpCallback);
				}
				this.wasWDown = true;
			}
			else
			{
				this.isJumping = false;
				this.wasWDown = false;
			}
			
			if (this.isFacingForward)
			{
				this.facing = FlxObject.LEFT;
			}
			else
			{
				this.facing = FlxObject.RIGHT;
			}
			
			if (FlxG.keys.K)
			{
				Kill();
			}
			
			
			if (isInAir)
			{
				if (velocity.y < 0)
				{
					play("asc");
				}
				if (velocity.y > 0)
				{
					play("desc");
				}
			}
			else
			{
				if ((velocity.x > 0.5)||(velocity.x < -0.5))
				{
					play("running");
				}
				else
				{
					play("idle");
				}
				
			} 
			if (debugMode)
			{
				playerinfo.text = "X : " + this.x + " Y : " + this.y;
				playerinfo.x = this.x - 20;
				playerinfo.y = this.y - 10;
				playerinfo.update();
			}
		}
		
		override public function draw():void 
		{
			super.draw();
			if (debugMode)
			{
				playerinfo.draw();
			}
		}
		
		private function UpdateDead():void {
			if (!isTouching(FLOOR))
			{
				//this doesnt work with sprites that are auto flipped - Alex
				//this.angle += 10;
			}
		}
		
		public override function reset(X:Number, Y:Number):void
		{
			super.reset(X, Y);
			this.isDead = false;
			this.alive = true;
			this.isJumping = false;
			this.isInAir = true;
			this.angle = 0;
			this.wasWDown = false;
			this.isFacingForward = false;
		}
	}

}