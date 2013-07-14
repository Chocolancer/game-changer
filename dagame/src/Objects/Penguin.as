package Objects 
{
	import org.flixel.*;
	import States.IAG_GameLevelState;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Penguin extends IAG_Sprite 
	{
		private var frozen:Boolean = true;
		private var justUnfrozen:Boolean = false; 
		private var playerRef:Player;
		private var tmap:FlxTilemap;
		
		private var movingLeft:Boolean = false;
		
		public function Penguin(x:int, y:int,player:Player) //enemy example
		{
			//this.loadGraphic(GFX_Player, true, true, 92, 92);
			this.x = x;
			this.y = y;
			this.playerRef = player;
			this.tmap = tmap;
			//this.addAnimation("fly", [0]); 
			this.maxVelocity.x = 450;
			
			this.loadGraphic(Resources.GFX_Penguin, true, true,71,80);
			this.addAnimation("idle", [ 5], 8);
			this.addAnimation("rollin", [0, 1, 2, 3, 4], 16);
			this.play("idle");
			
			width = 60;
			height = 70;
			this.offset.x = 5;
			this.offset.y = 5;
			
		}
		
		override public function update():void 
		{
			super.update();
			
			
			
			
			var playerDist:Number = Math.abs( this.x - playerRef.x);
			if ((frozen)&&(playerDist < 150))
			{
				this.frozen = false;
				this.justUnfrozen = true;
				play("rollin");
			}
			
			if ((!this.frozen)&&(justUnfrozen))
			{
				if (playerRef.x > this.x)
				{
					movingLeft = false;
				}
				else
				{
					movingLeft = true;
				}
				justUnfrozen = false;
			}
			
			if (!frozen)
			{
				if (movingLeft)
				{
					this.velocity.x = -90;
					this.facing = RIGHT ;
				}
				else
				{
					this.velocity.x = 90;
					this.facing = LEFT;
				}
				
				this.acceleration.y = 600;
			}
			if (this.justTouched(LEFT))
			{
				movingLeft = false;
			}
			if (this.justTouched(RIGHT))
			{
				movingLeft = true;
			}
		}
		
		 
		
	}

}