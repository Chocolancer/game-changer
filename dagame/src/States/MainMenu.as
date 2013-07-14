package States 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class MainMenu extends IAG_State 
	{
		private var text_start:FlxText = new FlxText(200, 300, 800, "Press Space to start the game");
		private var text_credits:FlxText = new FlxText(200, 330, 800, "Press C to see the team credits");
		
		public function MainMenu() 
		{
			
		}
		
		override public function create():void 
		{
			super.create();
			
			this.add(text_start);
			this.add(text_credits);
		}
		
		override public function update():void 
		{
			super.update();
			if (FlxG.keys.SPACE)
			{
				FlxG.switchState(new Story_Intro());
			}
			if (FlxG.keys.C)
			{
				FlxG.switchState(new Credits());
			}
		}
		
	}

}