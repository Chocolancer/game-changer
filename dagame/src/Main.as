package 
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	
	import States.TestState;
	
	[SWF(width = "1280", height = "720", backgroundColor = "#000000")] //Set the size and color of the Flash file
	//[Frame(factoryClass="PreLoader")]

	public dynamic class Main extends FlxGame
	{
		var _mochiads_game_id:String = "7762c8eea8c23235";
		public function Main()
		{  
			 
			super(640, 360, TestState, 2); //Create a new FlxGame object and load "PlayState" 
			//super(320, 240, Intro, 2); //Create a new FlxGame object and load "PlayState" 
			 
		}
	}
	
}