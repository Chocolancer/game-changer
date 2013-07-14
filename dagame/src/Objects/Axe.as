package Objects 
{
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Axe extends IAG_Sprite 
	{	
		private var moveLeft:Boolean;
		private var timeAlive: int = 120;
		
		public function Axe(x:Number,y:Number,moveLeft:Boolean) 
		{
			this.loadGraphic(Resources.GFX_Axe, true, true, 72, 65);
			this.addAnimation("idle", [0, 1, 2, 3, 4], 16);
			this.play("idle");
			this.x = x ;
			this.y = y;
			this.moveLeft = moveLeft;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (timeAlive == 0) {
				this.kill();
			}
		
			if (moveLeft)
			{
				this.facing = LEFT;
				this.velocity.x = -500;
			}
			else
			{
				this.facing = RIGHT;
				this.velocity.x = 500;
			}
			
			timeAlive--;
		}
		 
		
		
	}

}