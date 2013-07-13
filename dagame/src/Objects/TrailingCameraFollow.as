package Objects 
{
	import org.flixel.*;

	public class TrailingCameraFollow extends IAG_Sprite
	{
		
		public function TrailingCameraFollow(map:FlxTilemap) 
		{
			 this.x = FlxG.width / 2;
			 this.y = map.getBounds().bottom;
			 this.visible = false;
			 this.maxVelocity.y = -30;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.elapsed % 5 == 0) {
				this.velocity.y -= 3;
			}
		}
	}

}