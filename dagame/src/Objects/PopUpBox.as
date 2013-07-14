package Objects 
{
	import org.flixel.FlxObject;
	import org.flixel.FlxTimer;
	import States.DungeonLevel
	/**
	 * ...
	 * @author ...
	 */
	public class PopUpBox extends FlxObject
	{
		private var timer:FlxTimer;
		private var level:DungeonLevel;
		public var spikes:PopUpSpikes;
		
		public function PopUpBox(Level:DungeonLevel, X:Number, Y:Number) :void
		{
			x = X;
			y = Y;
			timer = new FlxTimer();
			level = Level;
		}
		
		public function Activate():void {
			timer.start(0.5, 1, TimerCallback);
		}
		
		private function TimerCallback(Timer:FlxTimer)
		{
			spikes = new PopUpSpikes(this.x, this.y, this);
			level.enemyGroup.add(spikes);
		}
	}

}