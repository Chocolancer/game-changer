package Objects 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class IAG_Sprite extends FlxSprite 
	{
		protected var isDying = false;
		
		public function IAG_Sprite() 
		{
			
		}
		
		override public function update():void 
		{
			if (!this.alive) {
				this.velocity.x = 0;
				this.velocity.y = -700;
				//change sprite
				this.isDying = true;
			}
			
			if (this.isDying) {
				velocity.y += 5;
				if (velocity.y == 0) {
					this.kill();
					this.isDying = false;
				}
			}
			
			super.update();
		}
	}

}