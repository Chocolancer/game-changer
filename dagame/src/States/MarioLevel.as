package States 
{
	import Objects.*;
	import org.flixel.*;
	import org.flixel.system.FlxTile;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class MarioLevel extends IAG_GameLevelState 
	{
		private var exitDoor:FlxSprite = new FlxSprite();
		
		public function MarioLevel() 
		{
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_MalioMap, Resources.GFX_MalioTileSet, 32, 32);
			tmap.setTileProperties(1, FlxObject.NONE);
			tmap.setTileProperties(6, FlxObject.NONE);
			tmap.setTileProperties(11, FlxObject.NONE, this.handleFall);
		
		}
		override public function create():void 
		{
			super.create();		
			
			var pig1:FlyingPig = new FlyingPig(982, 1000); 
			enemyGroup.add(pig1);
			
			var pig2:FlyingPig = new FlyingPig(1800, 900); 
			enemyGroup.add(pig2);
			
			var pig3:FlyingPig = new FlyingPig(2694, 720); 
			enemyGroup.add(pig3);
			
			var pig4:FlyingPig = new FlyingPig(3750, 900); 
			enemyGroup.add(pig4);
			
			var pig5:FlyingPig = new FlyingPig(4510, 700); 
			enemyGroup.add(pig5);
			
			var pig6:FlyingPig = new FlyingPig(4880, 620); 
			enemyGroup.add(pig6);
			
			
			var pen1:Penguin = new Penguin(1047, 1040, player);
			enemyGroup.add(pen1); 
			enemyCollideGroup.add(pen1);
			
			var pen2:Penguin = new Penguin(2047, 720, player);
			enemyGroup.add(pen2);
			enemyCollideGroup.add(pen2);
			
			var pen3:Penguin = new Penguin(4279, 870, player);
			enemyGroup.add(pen3);
			enemyCollideGroup.add(pen3);
			
			var pen4:Penguin = new Penguin(4782, 660, player);
			enemyGroup.add(pen4); 
			enemyCollideGroup.add(pen4);
			
			exitDoor.loadGraphic(Resources.GFX_Door, false, false);
			exitDoor.x = 5400;
			exitDoor.y = 550;
			this.add(exitDoor);
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.overlap(player, exitDoor, exitDoorCallback);
		}
		
		private function exitDoorCallback(nothing:FlxObject,nothing2:FlxObject):void
		{
			FlxG.flash(0xffffffff, 1, nextLevel);
		}
		
		private function nextLevel():void
		{
			FlxG.switchState(new TowerLevel());
		}
		
		private function handleFall(tile: FlxTile= null, target: Object = null): void {
			if (target is Player) {
				onDeath();
			}
		}
	}

}