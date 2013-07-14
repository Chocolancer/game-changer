package States 
{
	import Objects.*;
	import org.flixel.*;
	
	public class DiscoLevel extends IAG_GameLevelState 
	{
		
		private var door:FlxSprite;
		private var doorHitbox:FlxSprite;
		
		public function DiscoLevel() 
		{
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_DiscoMap, Resources.GFX_DiscoTileSet, 32, 32);
			tmap.setTileProperties(6, FlxObject.NONE);
		}
		
		override public function create():void 
		{
			super.create();
			
			door = new FlxSprite(3156, 176);
			door.loadGraphic(Resources.GFX_Door);
			door.addAnimation("idle", [0]);
			door.play("idle");
			this.add(door);
			
			doorHitbox = new FlxSprite(0, 3500);
			doorHitbox.makeGraphic(1, 1, 0x00dd0000);
			this.add(doorHitbox);
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.overlap(this.player, this.doorHitbox, handleDoor);
		}
		
		private function handleDoor(playerObj:FlxObject, door:FlxObject):void
		{
			// FlxG.switchState(new BossState());
		}
	}

}