package States
{
	import adobe.utils.CustomActions;
	import org.flixel.*;
	/**
	* ...
	* @author Akari Nakashige
	*/
	public class EndGame extends IAG_State
	{
		private var text:FlxText = new FlxText(100, 100, 400, "Athena traveled through dangerous digital landscapes to dominate Goran's throne and replace herself as the main protagonist. The game was shipped with the female protagonist without knowledge of the upper management. To the their surprise, the sales numbers were far higher than what they estimated. It was assumed the designer put the character back into the game without knowlege of her superiors. After much infighting the designer was promoted to a lead designer position.");
		private var text2:FlxText = new FlxText(100, 300, 400,"Press SPACE");
		public function EndGame()
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
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new Story_End());
			}
		}
	}
	
}

