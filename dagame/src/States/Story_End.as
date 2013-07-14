package States 
{
	import adobe.utils.CustomActions;
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Story_End extends IAG_State 
	{
		private var text:FlxText = new FlxText(100, 100, 400, "Athena traveled the dangerous digital landscapes to conquor all this levels and replace herself as the main proaganist. The game was shipped with the female protaganist without knowledge of the upper management. To the managements suprise the sales numbers were far higher than their sales estimates. It was assumed the designer put the character back into the game without knowlege of her superiors. After much infighting the designer was promoted to a lead designer position.");
		private var text2:FlxText = new FlxText( 100, 340, 400, "Your game is over, but sales are just beginning!");
		private var text3:FlxText = new FlxText(100, 300, 400,"Press SPACE to return to the main menu");
		public function EndGame() 
		{
			
		}
		
		override public function create():void 
		{
			super.create();
			this.add(text);
			this.add(text2);
			this.add(text3);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new MainMenu());
			}
		}
		
	}

}