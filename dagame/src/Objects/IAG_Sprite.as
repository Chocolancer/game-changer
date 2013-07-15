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
		public var isDead:Boolean = false;
		
		public function IAG_Sprite() 
		{
			
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!this.alive && !this.isDead) {
				this.allowCollisions = FlxObject.NONE;
				this.velocity.x = 0;
				this.velocity.y = -500;
				this.isDead = true;
			}
			
			if (this.isDead) {
				this.velocity.y += 5;
				if (this.velocity.y >= 700) {
					this.kill();
					this.isDead = false;
					this.allowCollisions = FlxObject.ANY;
				}
			}
		}
	}

}