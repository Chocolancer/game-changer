package Objects 
{
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Axe extends IAG_Sprite 
	{	
		private var moveLeft:Boolean;
		public function Axe(x:Number,y:Number,moveLeft:Boolean) 
		{
			this.makeGraphic(32, 32, 0xffff0000);
			this.x = x ;
			this.y = y;
			this.moveLeft = moveLeft;
		}
		
		override public function update():void 
		{
			super.update();
			if (moveLeft)
			{
				this.velocity.x = -100;
			}
			else
			{
				this.velocity.x = 100;
			}
		}
		 
		
		
	}

}