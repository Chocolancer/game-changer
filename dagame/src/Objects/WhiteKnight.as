package Objects 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher & Cimreau
	 */
	public class WhiteKnight extends IAG_Sprite
	{
		
		public function WhiteKnight(x:int, y:int):void //enemy example
		{
			//this.loadGraphic(GFX_Player, true, true, 92, 92);
			this.x = x;
			this.y = y;
			//this.addAnimation("fly", [0]);
			this.play("fly");
			this.maxVelocity.x = 450;
		}
		
		override public function update():void 
		{
			
		}
		
	}

}