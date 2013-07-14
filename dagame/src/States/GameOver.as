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
		private var text2:FlxText = new FlxText(100, 200, 600, "Press Space To Continue");
		
		public function GameOver() 
		{
			
		}
		
		override public function create():void 
		{
			super.create();
			this.add(text);
			this.add(text2);
		}
		
		override public function update():void 
		{
			super.update();
			 
			if (FlxG.keys.SPACE)
			{
				FlxG.switchState(new MainMenu());
			}
		}
	}

}