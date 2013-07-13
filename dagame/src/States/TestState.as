package States 
{
	import Objects.*;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class TestState extends FlxState 
	{
		 
		
		private var testText:FlxText = new FlxText(50, 50, 200, "Alex cant code collisions"); 
		private var testText2:FlxText = new FlxText(550, 250, 200, "SNAP"); 
		
		private var player:Player = new Player();
		
		public function TestState() 
		{
			this.add(testText);
			this.add(testText2);
			 
		 
			this.add(player);
		}  
		
		override public function update():void 
		{
			super.update();
			
		 
		}
		
	}

}