package States 
{
	import Objects.*;
	import org.flixel.*;
	import org.flixel.system.FlxTile;
	
	public class DiscoLevel extends IAG_GameLevelState 
	{
		
		private var exitDoor:FlxSprite = new FlxSprite();
		private var stopShake: Boolean = false;
		
		public function DiscoLevel() 
		{
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_DiscoMap, Resources.GFX_DiscoTileSet, 32, 32);
			tmap.setTileProperties(6, FlxObject.NONE);
			tmap.setTileProperties(7, FlxObject.NONE, this.handleFall);
		}
		
		override public function create():void 
		{
			super.create();
			
			player.x = 80;
			player.y = 40;
			
			exitDoor.loadGraphic(Resources.GFX_Door, false, false);
			exitDoor.x = 3156;
			exitDoor.y = 176;
			this.add(exitDoor);
			
			FlxG.playMusic(Resources.SND_Partyrock);
		}
		
		override public function update():void 
		{
			var num: int = FlxG.random() * 100;
			
			super.update();
			
			if (num == 50) {
				FlxG.flash(0xffffffff, 0.5);
			}
			
			FlxG.shake();
			
			FlxG.overlap(player, exitDoor, exitDoorCallback);
		}
		
		private function exitDoorCallback(nothing:FlxObject,nothing2:FlxObject):void
		{
			sound.loadEmbedded(Resources.SND_Nextlevel);
			sound.play(true);
			FlxG.flash(0xffffffff, 1, nextLevel);
		}
		
		private function nextLevel():void
		{
			FlxG.switchState(new EndGame());
		}
		
		private function handleFall(tile: FlxTile = null, target: Object = null): void {
			if (target is Player)
			{
				onDeath();
			}
		}
	}

}