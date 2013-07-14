package Objects 
{
	import org.flixel.*;

	public class TrailingCameraFollow extends IAG_Sprite
	{
		
		public function TrailingCameraFollow(map:FlxTilemap) 
		{
			var mapRect: FlxRect = map.getBounds();
			 this.x = 50
			 this.y = mapRect.bottom - 100;
			 this.visible = true;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.elapsed % 5 == 0) {
				this.velocity.y -= 500;
			}
		}
	}

}