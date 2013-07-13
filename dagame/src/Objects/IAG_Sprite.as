package Objects 
{
	import org.flixel.*;
	import org.flixel.system.FlxTile;
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
			super.update();
			
			if (!this.alive && !this.isDying) {
				this.velocity.x = 0;
				this.velocity.y = -500;
				//change sprite
				this.isDying = true;
			}
			
			if (this.isDying) {
				this.velocity.y += 5;
				if (this.velocity.y >= 700) {
					this.kill();
					this.isDying = false;
				}
			}
		}
		
		public function fall(tile: FlxTile = null, target: Object = null): void {
			this.alive = false;
		}
	}

}