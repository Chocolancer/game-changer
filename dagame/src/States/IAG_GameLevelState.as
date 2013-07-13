package States 
{
		import Objects.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class IAG_GameLevelState extends IAG_State 
	{
		protected var player:Player = new Player();
		protected var tmap:FlxTilemap;
		protected var camera:FlxCamera;
		
		
		public function IAG_GameLevelState() 
		{
			
		}
		
		override public function create():void 
		{
			super.create();
			this.add(tmap); 
			this.add(player); 
			
			FlxG.worldBounds = new FlxRect( 0, 0, 5000, 5000);
			camera = new FlxCamera(0, 0, FlxG.width, FlxG.height, 2);
			camera.setBounds( 0, 0, 5000, 2700);
			FlxG.resetCameras(camera);
			
			camera.follow(player, FlxCamera.STYLE_LOCKON);
		}
		
	}

}