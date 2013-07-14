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
		private var poubelle:FlxSprite = new FlxSprite(0, 0, Resources.GFX_Poubelle);
		private var poubelleLeftCol:FlxSprite = new FlxSprite();
		private var poubelleRightCol:FlxSprite = new FlxSprite();
		private var computer:FlxSprite = new FlxSprite();
		
		private var isWarping:Boolean = false;
		
		public function HUB() 
		{
			tmap = new FlxTilemap();
			tmap.loadMap(new Resources.TMAP_Map_HUB, Resources.GFX_TSET_HUBTiles, 32, 32); 
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
			FlxG.worldBounds = new FlxRect( 14, 0, 5000, 3760);
			camera = new CustCamera(0, 0, FlxG.width * 2, FlxG.height * 2, 1); 
			camera.setBounds( 14, 0, 5000, 2560);
			camera.follow(player);
			FlxG.resetCameras(camera);
			
			poubelle.x = 100;
			poubelle.y = 2110;
			this.add(poubelle);
			poubelleLeftCol.x = 110;
			poubelleLeftCol.y = 2210;
			poubelleLeftCol.makeGraphic(5, 100, 0xffff0000); 
			poubelleLeftCol.immovable = true;
			this.add(poubelleLeftCol);
			poubelleRightCol.x = 255;
			poubelleRightCol.y = 2210;
			poubelleRightCol.makeGraphic(5, 100, 0xffff0000); 
			poubelleRightCol.immovable = true;
			this.add(poubelleRightCol);
			
			player.x = 140;
			
			computer.loadGraphic(Resources.GFX_Computere, true, false, 351, 351);
			computer.addAnimation("idle", [0, 1], 16);
			computer.play("idle");
			computer.x  = 2337;
			computer.y = 1540;
			this.add(computer);
		}
		
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(tmap, player);
			FlxG.collide(poubelleLeftCol, player);
			FlxG.collide(poubelleRightCol, player);
			if (!isWarping)
			{
			FlxG.overlap(player, computer, computerOverlapCallback);
			}
		}
		
		private function computerOverlapCallback(playerObj:FlxObject, spikes:FlxObject):void
		{ 
			isWarping = true;
			camera.shake(0.05, 0.5, computerOverlapCallbackStep2); 
		}
		
		private function computerOverlapCallbackStep2():void
		{
			camera.flash(0xffffffff, 0.3, computerOverlapCallbackStep3);
		}
		
		private function computerOverlapCallbackStep3():void
		{ 
			camera.flash();
			FlxG.switchState(new MarioLevel());
		} 
	} 
}