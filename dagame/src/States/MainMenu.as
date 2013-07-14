package States 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class MainMenu extends IAG_State 
	{
		private var text_start:FlxText = new FlxText(575, 310, 800, "Press Space to start the game");
		private var text_credits:FlxText = new FlxText(575, 330, 800, "Press C to see the team credits");
		
		private var background:FlxSprite = new FlxSprite(0, 0, Resources.GFX_TitleScreen);
		
		public function MainMenu() 
		{
			
		}
		
		override public function create():void 
		{
			super.create();
			this.add(background);
			text_credits.scale.x = 2;
			text_credits.scale.y = 2;
			text_start.scale.x = 2;
			text_start.scale.y = 2;
			this.add(text_start);
			this.add(text_credits);
			
			FlxG.playMusic(Resources.SND_Intro);
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