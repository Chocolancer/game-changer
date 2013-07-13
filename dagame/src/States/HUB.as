package States 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class HUB extends IAG_GameLevelState 
	{
		private var background:FlxSprite= new FlxSprite(0, 0, Resources.GFX_HUB_Background);
		
		
		public function HUB() 
		{
				tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_Map, Resources.GFX_Player, 32, 32); 
		}
		
		override public function create():void 
		{		
			this.add(background);
			background.scrollFactor.x = 0.5;
			background.scrollFactor.y = 0.5;
			background.scale.x = 2;
			background.scale.y = 2;
			background.x += 640;
			background.y += 480;
			super.create(); 
		}
		
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(tmap, player);
		}
		
	}

}