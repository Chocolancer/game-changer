package States 
{
	import Objects.IAG_Sprite;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class TestState extends FlxState 
	{
		
		[Embed(source="/../art/test_player.png")] public static var Player:Class;
		
		private var testText:FlxText = new FlxText(50, 50, 200, "Alex cant code collisions"); 
		private var testText2:FlxText = new FlxText(550, 250, 200, "SNAP"); 
		
		private var testSprite:IAG_Sprite = new IAG_Sprite();
		
		public function TestState() 
		{
			this.add(testText);
			this.add(testText2);
			 
			testSprite.loadGraphic(Player, true, false, 92, 92);
			testSprite.addAnimation("idle", [0, 1, 2, 3, 4, 5, 6], 16);
			testSprite.play("idle");
			testSprite.x = 100;
			testSprite.y = 100;
			this.add(testSprite);
		}  
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.keys.A)
			{
				testSprite.velocity.x = -30;
			}
			if (FlxG.keys.D)
			{
				testSprite.velocity.x = 30;
			}
			if (FlxG.keys.W)
			{
				testSprite.velocity.y = -30;
			}
			if (FlxG.keys.S)
			{
				testSprite.velocity.y = 30;
			}
		}
		
	}

}