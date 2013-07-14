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
		public function Story_End() 
		{
			
		}
		override public function create():void {	
			var introImage:FlxSprite = new FlxSprite(0, 0, Resources.GFX_THE_END);
			add(introImage);
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new MainMenu());
			}
		}
		
	}

}