package States 
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Story_Intro extends IAG_State 
	{
		public function Story_Intro() 
		{
			super();	
		}
		override public function create():void {	
			var introImage:FlxSprite = new FlxSprite(0, 0, Resources.GFX_THE_START);
			add(introImage);
			
			var textbox:FlxText = new FlxText( 100, 340, 400, "Your game character is too ugly. We need one with chiseled pecs and tight buns.");
			textbox.setFormat(null, 8, 0x00FF00, "center");
			add(textbox);
		}
		override public function update():void
		{
			var mainstate:FlxState = new Tutorial();
			if (FlxG.keys.any()){
				FlxG.switchState(mainstate);
			}
			super.update();
		}
	}

}
