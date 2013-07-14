package States 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class GameOver extends IAG_State 
	{
		
		
		private var text:FlxText = new FlxText(100, 100, 600, "GAME OVER");
		
		public function GameOver() 
		{
			
		}
		
		override public function create():void 
		{
			super.create();
			this.add(text);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.keys.any)
			{
				FlxG.switchState(new Story_Intro());
			}
		}
	}

}