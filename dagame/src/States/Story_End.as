package States 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Story_End extends IAG_State 
	{
		public function Story_End() 
		{
			super();	
		}
		override public function create():void {	
			var introImage:FlxSprite = new FlxSprite(0, 0, Resources.GFX_THE_END);
			add(introImage);
			
			var textbox:FlxText = new FlxText( 100, 340, 400, "Your game is over, but sales are just beginning!");
			textbox.setFormat(null, 8, 0x00FF00, "center");
			add(textbox);
		}
	}

}
