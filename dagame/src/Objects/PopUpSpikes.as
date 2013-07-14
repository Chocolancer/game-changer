package Objects 
{
	/**
	 * ...
	 * @author ...
	 */
	public class PopUpSpikes extends IAG_Sprite
	{
		private var movingup:Boolean = true;
		private var currentStep:uint = 0;
		private var box:PopUpBox;
	
		public function PopUpSpikes(X:Number, Y:Number, popbox:PopUpBox):void
		{
			this.x = X;
			this.y = Y;
			this.loadGraphic(Resources.GFX_Movingspikes);
			this.box = popbox;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (movingup)
			{
				if (this.currentStep == 32)
				{
					this.movingup = false;
				}
				else
				{
					currentStep++;
					this.y--;
				}
			}
			else if (currentStep == 0)
			{
				this.alive = false;
				box.destroy();
				this.kill();
			}
			else
			{
				currentStep--;
				this.y++;
			}
		}
	}

}