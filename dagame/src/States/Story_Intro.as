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
		internal var introImage:FlxSprite;
		internal var textbox:FlxText;
		internal var szDialogues:Array;
		
		public function Story_Intro() 
		{
			super();	
		}
		override public function create():void {	
			introImage = new FlxSprite(0, 0);
			introImage.loadGraphic(Resources.GFX_THE_START, false, false, 640, 310, false);
			
			add(introImage);
			
			var frames:Array = new Array(3);
			
			//introImage.play("intro anim");
			szDialogues = new Array(3);
			szDialogues[0] = "Raylene: \"My design for this game is for this tough and resourceful warrior to go on a quest through exotic lands, fighting terrifying beasts, recovering valuable treasure, and defending the weak against unjust and merciless brutes.\"";
			szDialogues[1] = "Tony: \"I think you're onto something with these beasts and brutes, I've got a family to feed and a mortgage to pay. I'm not going to gamble my livelihood on a female protagonist.\"";
			szDialogues[2] = "Tony: \"The hero this idea deserves is Goran, the wandering knight of few words. Our male player base will really identify with his quest for self actualization. It's a classic idea which might sound a little cliche to the kids nowadays, so we'll spice up this stereotype by giving him a chainsaw.\"";

			
			textbox = new FlxText(FlxG.width * 0.05, 320, 480, szDialogues[0]);
			textbox.setFormat(null, 8, 0x00FF00, "center");
			add(textbox);
		}
		override public function update():void
		{
			 
			if (FlxG.keys.any()) {
				if (introImage.frame == 2) FlxG.switchState(new Garbage());
				introImage.frame = ((introImage.frame+1) % 3);
					introImage.update();
					textbox.text = szDialogues[introImage.frame];
					FlxG.keys.reset();
			}
			super.update();
			
		}
	}
}


