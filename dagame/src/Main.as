package 
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	
	import States.*;
	
	[SWF(width = "1280", height = "720", backgroundColor = "#000000")] //Set the size and color of the Flash file

	public dynamic class Main extends FlxGame
	{ 
		public function Main()
		{
			super(640, 480, MainMenu, 2);
		}
	}
	
}