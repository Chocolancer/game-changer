package States 
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.system.FlxAnim;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Story_Intro extends IAG_State 
	{
		var introanim:FlxAnim;
		public function Story_Intro() 
		{
			super();	
		}
		override public function create():void {	
			var introImage:FlxSprite = new FlxSprite(0, 0, Resources.GFX_THE_START)
			introImage.loadGraphic(Resources.GFX_THE_START, true, false, 640, 310, false);
			
			add(introImage);
			
			var frames:Array = new Array(3);
			introanim = new FlxAnim("intro anim", frames, 1, false);
			
			introImage.play("intro anim");
			
			var textbox:FlxText = new FlxText( 100, 340, 400, "Your game character is too ugly. We need one with chiseled pecs and tight buns.");
			textbox.setFormat(null, 8, 0x00FF00, "center");
			add(textbox);
		}
		override public function update():void
		{
			var mainstate:FlxState = new Tutorial();
			if (FlxG.keys.any())
				introanim.delay = 1;
				FlxG.switchState(mainstate);
			}
			super.update();
		}
	}

}
