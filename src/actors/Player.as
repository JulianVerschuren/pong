package actors 
{
	import utils.Controller;	
	import flash.events.Event;
	/**
	 * ...
	 * @author erwin henraat
	 * Voeg zelf een getter en setter voor de variabele maxSpeed toe aan de Player class. 
	 * Roep deze aan vanuit de GameScreen class en pas zo de waarde aan. De setter moet een if statement hebben die de max speed beperkt tot 30. 
	 * Als de max speed hoger is moet er een trace worden weergegeven "maxspeed cannot be more than 30! "

	Bij de beoordeling van het Pong project telt deze opdracht mee. 
	 */
	public class Player extends Paddle 
	{
		private var controller:Controller;
		private var speed:Number = 0;
		private var _maxSpeed:Number = 20;
		
		public function set maxSpeed(o:Number):void
		{
			_maxSpeed = o;
			if (_maxSpeed > 30)
			{
				_maxSpeed = 30;
				trace("max speed cannot be more than 20!")
			}
		}
		
		public function get maxSpeed():Number
		{
			return _maxSpeed;
		}
		
		
		
		
		
		public function Player() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);		
		}		
		private function init(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			controller = new Controller(stage);
			this.addEventListener(Event.ENTER_FRAME, loop);			
		}
		private function loop(e:Event):void 
		{
			if (controller.up)
			{
				speed = -maxSpeed;
			}
			else if(controller.down)
			{
				speed = maxSpeed;
			}else
			{
				if (speed > 0) speed--;
				if (speed < 0) speed++;
				
			}
			if (controller.fire)
			{
				
				
			}
			this.y += speed;
		}
		
	}

}
