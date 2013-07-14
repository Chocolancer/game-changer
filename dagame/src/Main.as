package 
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	
	import States.*;
	
	[SWF(width = "1280", height = "720", backgroundColor = "#000000")] //Set the size and color of the Flash file
	//[Frame(factoryClass="PreLoader")]

	public dynamic class Main extends FlxGame
	{ 
		public function Main()
		{  
			//super(640, 360, Tutorial, 2); //Create a new FlxGame object and load "PlayState" 
			//super(320, 240, Intro, 2); //Create a new FlxGame object and load "PlayState" 
			super(640, 480, Story_Intro, 2);
		}
	}
	
}