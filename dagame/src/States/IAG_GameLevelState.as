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
		protected var life_display:FlxText;

		public function IAG_GameLevelState()
		{
	
		}

		override public function create():void
		{
			super.create();
			this.add(tmap); 
			this.add(player); 
			
			FlxG.worldBounds = new FlxRect( -500, -500, 10000, 10000);
			camera = new FlxCamera(0, 0, FlxG.width, FlxG.height, 2);
			camera.setBounds( -500, -500, 10000, 10000);
			FlxG.resetCameras(camera);
			
			camera.follow(player, FlxCamera.STYLE_PLATFORMER);

			life_display = new FlxText(0, 0, 100, "Lives: " + player.numberOfLives);
			life_display.scrollFactor = new FlxPoint();
			this.add(life_display);
		}
		
		override public function update():void 
		{
			super.update();
			
			FlxG.collide(tmap, player, PlayerTouchDown);
		}
		
		public function PlayerTouchDown(tmap:FlxTilemap, player:Player):void {
			player.TouchDownCallback(tmap);
		}
	}
}