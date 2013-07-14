package States 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Garbage extends IAG_State 
	{
		
		private var cabbage:FlxSprite = new FlxSprite(0, 0, Resources.GFX_Trashcan);
		
		public function Garbage() 
		{
			
		}
		
		override public function create():void 
		{
			super.create();
			FlxG.flash(0xffffffff, 1, step1);
			this.add(cabbage);
		}
		
		private function step1():void
		{
			FlxG.fade(0xff000000, 2, step2);
		}
		
		private function step2():void
		{
			FlxG.switchState(new HUB());
		
		}
		
	}

}