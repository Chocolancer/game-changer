package States 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Credits extends IAG_State 
	{
		private var text_01:FlxText = new FlxText(200, 30, 800, "Team");
		private var text_02:FlxText = new FlxText(200, 80, 800, "Abdon Cox");
		private var text_03:FlxText = new FlxText(200, 100, 800, "Akari Nakashige");
		private var text_04:FlxText = new FlxText(200, 120, 800, "Alex McGilvray");
		private var text_05:FlxText = new FlxText(200, 140, 800, "Jason Bolanos");
		private var text_06:FlxText = new FlxText(200, 160, 800, "Marysia McGilvray");
		private var text_07:FlxText = new FlxText(200, 180, 800, "Matt Fisher");
		private var text_08:FlxText = new FlxText(200, 200, 800, "Ray Young"); 
		private var text_09:FlxText = new FlxText(200, 250, 800, "Thank you IAmAGamer for hosting this event!");
		private var text_10:FlxText = new FlxText(200, 310, 800, "Press Spacebar to return to main menu");
		
		public function Credits() 
		{
			
		}
		
		override public function create():void 
		{
			super.create();
			this.add(text_01);
			this.add(text_02);
			this.add(text_03);
			this.add(text_04);
			this.add(text_05);
			this.add(text_06);
			this.add(text_07);
			this.add(text_08);
			this.add(text_09); 
			this.add(text_10); 
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