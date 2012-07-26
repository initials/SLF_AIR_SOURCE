package org.flixel.system.input
{
	//import flash.events.KeyboardEvent;
	import extension.JoyQuery.Joystick;
	import Math;

	/**
	 * A Flixel Wrapper for joyquery
	 * 
	 * @author Initials
	 */
	public class FlxJoystick
	{
		private var joystick:Joystick = new Joystick();	
		
		/*
		 * value to get past before stick turns into a DIRECTION.Pressed
		 */
		public var deadZone:Number = 0.6;
		
		private var j1Button0Pressed:Boolean;
		private var j1Button1Pressed:Boolean;
		private var j1Button2Pressed:Boolean;
		private var j1Button3Pressed:Boolean;
		private var j1Button4Pressed:Boolean;		
		private var j1Button5Pressed:Boolean;
		private var j1Button6Pressed:Boolean;
		private var j1Button7Pressed:Boolean;
		private var j1Button8Pressed:Boolean;
		private var j1Button9Pressed:Boolean;
		
		private var j1Button0JustPressed:Boolean;
		private var j1Button1JustPressed:Boolean;
		private var j1Button2JustPressed:Boolean;
		private var j1Button3JustPressed:Boolean;
		private var j1Button4JustPressed:Boolean;		
		private var j1Button5JustPressed:Boolean;
		private var j1Button6JustPressed:Boolean;
		private var j1Button7JustPressed:Boolean;
		private var j1Button8JustPressed:Boolean;
		private var j1Button9JustPressed:Boolean;
		
		public var j1ButtonAPressed:Boolean;
		public var j1ButtonBPressed:Boolean;
		public var j1ButtonXPressed:Boolean;
		public var j1ButtonYPressed:Boolean;
		public var j1ButtonLBPressed:Boolean;		
		public var j1ButtonRBPressed:Boolean;
		public var j1ButtonBackPressed:Boolean;
		public var j1ButtonStartPressed:Boolean;
		public var j1ButtonLeftStickClickPressed:Boolean;
		public var j1ButtonRightStickClickPressed:Boolean;
		
		public var j1ButtonAJustPressed:Boolean;
		public var j1ButtonBJustPressed:Boolean;
		public var j1ButtonXJustPressed:Boolean;
		public var j1ButtonYJustPressed:Boolean;
		public var j1ButtonLBJustPressed:Boolean;		
		public var j1ButtonRBJustPressed:Boolean;
		public var j1ButtonBackJustPressed:Boolean;
		public var j1ButtonStartJustPressed:Boolean;
		public var j1ButtonLeftStickClickJustPressed:Boolean;
		public var j1ButtonRightStickClickJustPressed:Boolean;		
		
		public var j1Stick1X:Number;
		public var j1Stick1Y:Number;	
		/*
		 * The angle of the stick 1
		 */
		public var j1Stick1Angle:Number;
		
		public var j1Stick2X:Number;
		public var j1Stick2Y:Number;
		/*
		 * The angle of the stick 2
		 */
		public var j1Stick2Angle:Number;		
		public var j1Trigger:Number;
		
		public var j1Stick1DownPressed:Boolean;
		public var j1Stick1UpPressed:Boolean;
		public var j1Stick1LeftPressed:Boolean;
		public var j1Stick1RightPressed:Boolean;
		
		public var j1Stick1DownJustPressed:Boolean;
		public var j1Stick1UpJustPressed:Boolean;
		public var j1Stick1LeftJustPressed:Boolean;
		public var j1Stick1RightJustPressed:Boolean;	
		
		public var j1Stick2DownPressed:Boolean;
		public var j1Stick2UpPressed:Boolean;
		public var j1Stick2LeftPressed:Boolean;
		public var j1Stick2RightPressed:Boolean;
		
		public var j1Stick2DownJustPressed:Boolean;
		public var j1Stick2UpJustPressed:Boolean;
		public var j1Stick2LeftJustPressed:Boolean;
		public var j1Stick2RightJustPressed:Boolean;
		
		// JOYSTICK 2
		
		private var j2Button0Pressed:Boolean;
		private var j2Button1Pressed:Boolean;
		private var j2Button2Pressed:Boolean;
		private var j2Button3Pressed:Boolean;
		private var j2Button4Pressed:Boolean;		
		private var j2Button5Pressed:Boolean;
		private var j2Button6Pressed:Boolean;
		private var j2Button7Pressed:Boolean;
		private var j2Button8Pressed:Boolean;
		private var j2Button9Pressed:Boolean;
		
		private var j2Button0JustPressed:Boolean;
		private var j2Button1JustPressed:Boolean;
		private var j2Button2JustPressed:Boolean;
		private var j2Button3JustPressed:Boolean;
		private var j2Button4JustPressed:Boolean;		
		private var j2Button5JustPressed:Boolean;
		private var j2Button6JustPressed:Boolean;
		private var j2Button7JustPressed:Boolean;
		private var j2Button8JustPressed:Boolean;
		private var j2Button9JustPressed:Boolean;
		
		public var j2ButtonAPressed:Boolean;
		public var j2ButtonBPressed:Boolean;
		public var j2ButtonXPressed:Boolean;
		public var j2ButtonYPressed:Boolean;
		public var j2ButtonLBPressed:Boolean;		
		public var j2ButtonRBPressed:Boolean;
		public var j2ButtonBackPressed:Boolean;
		public var j2ButtonStartPressed:Boolean;
		public var j2ButtonLeftStickClickPressed:Boolean;
		public var j2ButtonRightStickClickPressed:Boolean;
		
		public var j2ButtonAJustPressed:Boolean;
		public var j2ButtonBJustPressed:Boolean;
		public var j2ButtonXJustPressed:Boolean;
		public var j2ButtonYJustPressed:Boolean;
		public var j2ButtonLBJustPressed:Boolean;		
		public var j2ButtonRBJustPressed:Boolean;
		public var j2ButtonBackJustPressed:Boolean;
		public var j2ButtonStartJustPressed:Boolean;
		public var j2ButtonLeftStickClickJustPressed:Boolean;
		public var j2ButtonRightStickClickJustPressed:Boolean;	
		
		public var j2Stick1X:Number;
		public var j2Stick1Y:Number;		
		public var j2Stick2X:Number;
		public var j2Stick2Y:Number;
		public var j2Trigger:Number;
		
		/*
		 * The angle of the stick 1
		 */
		public var j2Stick1Angle:Number;
		/*
		 * The angle of the stick 2
		 */
		public var j2Stick2Angle:Number;		
		
		public var j2Stick1DownPressed:Boolean;
		public var j2Stick1UpPressed:Boolean;
		public var j2Stick1LeftPressed:Boolean;
		public var j2Stick1RightPressed:Boolean;
		
		public var j2Stick1DownJustPressed:Boolean;
		public var j2Stick1UpJustPressed:Boolean;
		public var j2Stick1LeftJustPressed:Boolean;
		public var j2Stick1RightJustPressed:Boolean;	
		
		public var j2Stick2DownPressed:Boolean;
		public var j2Stick2UpPressed:Boolean;
		public var j2Stick2LeftPressed:Boolean;
		public var j2Stick2RightPressed:Boolean;
		
		public var j2Stick2DownJustPressed:Boolean;
		public var j2Stick2UpJustPressed:Boolean;
		public var j2Stick2LeftJustPressed:Boolean;
		public var j2Stick2RightJustPressed:Boolean;			
	
		public function FlxJoystick()
		{
			super();
		}
		
		/*
		 * Calculates a values for degrees from a radian
		 */
		public function toDegrees(Radians:Number):Number {
			return Radians * 180 / Math.PI;
		}

		public function update():void
		{
			joystick.JoyQuery();
			
			//return if no joysticks.
			
			if (joystick.getTotal() == 0) return;
			
			// look through each connected joystick
			
			for(var i:int = 0; i < joystick.getTotal(); i++)
			{
				// i  = joystick number starting at 0
				// i2 = joystick[i] axis
				
				// add 1 to the controller number because player 1 is controller 1.
				var controllerNumber:int = i + 1;
				
				var i2:int;
				
				for(i2 = 0; i2 < joystick.getTotalAxes(i); i2++)
				{
					//text += "Axes" + i2 + ": " + joystick.getAxis(i, i2) + "\n\t";
					
					if (i2 == 0) {
						
						this["j" + controllerNumber.toString() + "Stick1X"] = joystick.getAxis(i, i2);
						
						/* now compute the virtual d-pad. aka stick just pressed. */
						
						if (this["j" + controllerNumber.toString() + "Stick1X"] < deadZone*-1) {
								
							//determine if the last update the button was off. if so, it has just been pressed.
							
							if (this["j" + controllerNumber.toString() + "Stick1LeftPressed"] == false) {
								this["j" + controllerNumber.toString() + "Stick1LeftJustPressed"] = true;
							}
							else {
								this["j" + controllerNumber.toString() + "Stick1LeftJustPressed"] = false;
							}	
							
							//finally button is down, so set regular pressed to true.
							
							this["j" + controllerNumber.toString() + "Stick1LeftPressed"] = true;
						}
						
						// button is not active. set to false.
						
						else {
							this["j" + controllerNumber.toString() + "Stick1LeftPressed"] = false;
						}
						
						if (this["j" + controllerNumber.toString() + "Stick1X"] > deadZone) {
								
							//determine if the last update the button was off. if so, it has just been pressed.
							
							if (this["j" + controllerNumber.toString() + "Stick1RightPressed"] == false) {
								this["j" + controllerNumber.toString() + "Stick1RightJustPressed"] = true;
							}
							else {
								this["j" + controllerNumber.toString() + "Stick1RightJustPressed"] = false;
							}	
							
							//finally button is down, so set regular pressed to true.
							
							this["j" + controllerNumber.toString() + "Stick1RightPressed"] = true;
						}		
						
						// button is not active. set to false.
						
						else {
							this["j" + controllerNumber.toString() + "Stick1RightPressed"] = false;
						}
						
					}
					
					
					
					if(i2==1) {
						this["j" + controllerNumber.toString() + "Stick1Y"] = joystick.getAxis(i, i2);
						
						/* now compute the virtual d-pad. aka stick just pressed. */
						
						if (this["j" + controllerNumber.toString() + "Stick1Y"] < deadZone*-1) {
								
							//determine if the last update the button was off. if so, it has just been pressed.
							
							if (this["j" + controllerNumber.toString() + "Stick1DownPressed"] == false) {
								this["j" + controllerNumber.toString() + "Stick1DownJustPressed"] = true;
							}
							else {
								this["j" + controllerNumber.toString() + "Stick1DownJustPressed"] = false;
							}	
							
							//finally button is down, so set regular pressed to true.
							
							this["j" + controllerNumber.toString() + "Stick1DownPressed"] = true;
						}
						
						// button is not active. set to false.
						
						else {
							this["j" + controllerNumber.toString() + "Stick1DownPressed"] = false;
						}
						
						if (this["j" + controllerNumber.toString() + "Stick1Y"] > deadZone) {
								
							//determine if the last update the button was off. if so, it has just been pressed.
							
							if (this["j" + controllerNumber.toString() + "Stick1UpPressed"] == false) {
								this["j" + controllerNumber.toString() + "Stick1UpJustPressed"] = true;
							}
							else {
								this["j" + controllerNumber.toString() + "Stick1UpJustPressed"] = false;
							}	
							
							//finally button is down, so set regular pressed to true.
							
							this["j" + controllerNumber.toString() + "Stick1UpPressed"] = true;
						}		
						
						// button is not active. set to false.
						
						else {
							this["j" + controllerNumber.toString() + "Stick1UpPressed"] = false;
						}
						
					}
					
					if(i2==4) {
						this["j" + controllerNumber.toString() + "Stick2X"] = joystick.getAxis(i, i2);
						
						/* now compute the virtual d-pad. aka stick just pressed. */
						
						if (this["j" + controllerNumber.toString() + "Stick2X"] < deadZone*-1) {
								
							//determine if the last update the button was off. if so, it has just been pressed.
							
							if (this["j" + controllerNumber.toString() + "Stick2LeftPressed"] == false) {
								this["j" + controllerNumber.toString() + "Stick2LeftJustPressed"] = true;
							}
							else {
								this["j" + controllerNumber.toString() + "Stick2LeftJustPressed"] = false;
							}	
							
							//finally button is down, so set regular pressed to true.
							
							this["j" + controllerNumber.toString() + "Stick2LeftPressed"] = true;
						}
						
						// button is not active. set to false.
						
						else {
							this["j" + controllerNumber.toString() + "Stick2LeftPressed"] = false;
						}
						
						if (this["j" + controllerNumber.toString() + "Stick2X"] > deadZone) {
								
							//determine if the last update the button was off. if so, it has just been pressed.
							
							if (this["j" + controllerNumber.toString() + "Stick2RightPressed"] == false) {
								this["j" + controllerNumber.toString() + "Stick2RightJustPressed"] = true;
							}
							else {
								this["j" + controllerNumber.toString() + "Stick2RightJustPressed"] = false;
							}	
							
							//finally button is down, so set regular pressed to true.
							
							this["j" + controllerNumber.toString() + "Stick2RightPressed"] = true;
						}		
						
						// button is not active. set to false.
						
						else {
							this["j" + controllerNumber.toString() + "Stick2RightPressed"] = false;
						}
						
					}
					if (i2 == 3) {
						
						// this one appears to be inverted so mult by -1;
						
						this["j" + controllerNumber.toString() + "Stick2Y"] = joystick.getAxis(i, i2) * -1;
						
						/* now compute the virtual d-pad. aka stick just pressed. */
						
						if (this["j" + controllerNumber.toString() + "Stick2Y"] < deadZone*-1) {
								
							//determine if the last update the button was off. if so, it has just been pressed.
							
							if (this["j" + controllerNumber.toString() + "Stick2DownPressed"] == false) {
								this["j" + controllerNumber.toString() + "Stick2DownJustPressed"] = true;
							}
							else {
								this["j" + controllerNumber.toString() + "Stick2DownJustPressed"] = false;
							}	
							
							//finally button is down, so set regular pressed to true.
							
							this["j" + controllerNumber.toString() + "Stick2DownPressed"] = true;
						}
						
						// button is not active. set to false.
						
						else {
							this["j" + controllerNumber.toString() + "Stick2DownPressed"] = false;
						}
						
						if (this["j" + controllerNumber.toString() + "Stick2Y"] > deadZone) {
								
							//determine if the last update the button was off. if so, it has just been pressed.
							
							if (this["j" + controllerNumber.toString() + "Stick2UpPressed"] == false) {
								this["j" + controllerNumber.toString() + "Stick2UpJustPressed"] = true;
							}
							else {
								this["j" + controllerNumber.toString() + "Stick2UpJustPressed"] = false;
							}	
							
							//finally button is down, so set regular pressed to true.
							
							this["j" + controllerNumber.toString() + "Stick2UpPressed"] = true;
						}		
						
						// button is not active. set to false.
						
						else {
							this["j" + controllerNumber.toString() + "Stick2UpPressed"] = false;
						}
						
					}
					if (i2 == 2)
						this["j" + controllerNumber.toString() + "Trigger"] = joystick.getAxis(i, i2);
				}
				
				/* Now compute the angle for each stick. */
				
				// stick 1
				var rotation:Number = Math.atan2(this["j" + controllerNumber.toString() + "Stick1X"], this["j" + controllerNumber.toString() + "Stick1Y"]);
				rotation = (rotation < 0) ? this.toDegrees(rotation + Math.PI*2) : this.toDegrees(rotation);
				this["j" + controllerNumber.toString() + "Stick1Angle"] = rotation;
				
				// stick 2
				rotation = Math.atan2(this["j" + controllerNumber.toString() + "Stick2X"], this["j" + controllerNumber.toString() + "Stick2Y"]);
				rotation = (rotation < 0) ? this.toDegrees(rotation + Math.PI*2) : this.toDegrees(rotation);
				this["j" + controllerNumber.toString() + "Stick2Angle"] = rotation;		
				
				// look through this joysticks buttons
				
				for(i2 = 0; i2 < joystick.getTotalButtons(i); i2++)
				{
					//set just pressed to false, 
					this["j" + controllerNumber.toString() + "Button" + i2.toString() + "JustPressed"] = false;
					
					//apply actions if button is down.
					
					if (joystick.buttonIsDown(i, i2)) {
						
						//determine if the last update the button was off. if so, it has just been pressed.
						
						if (this["j" + controllerNumber.toString() + "Button" + i2.toString() + "Pressed"] == false) {
							this["j" + controllerNumber.toString() + "Button" + i2.toString() + "JustPressed"] = true;
						}
						else {
							this["j" + controllerNumber.toString() + "Button" + i2.toString() + "JustPressed"] = false;
						}	
						
						//finally button is down, so set regular pressed to true.
						
						this["j" + controllerNumber.toString() + "Button" + i2.toString() + "Pressed"] = true;
					}
					
					// button is not active. set to false.
					
					else {
						this["j" + controllerNumber.toString() + "Button" + i2.toString() + "Pressed"] = false;
					}
					
					// Set the public vars so that you get real button names.
					
					// - XBOX Button A //
					
					this["j" + controllerNumber.toString() + "ButtonAPressed"] = this["j" + controllerNumber.toString() + "Button0Pressed"];
					this["j" + controllerNumber.toString() + "ButtonAJustPressed"]  = this["j" + controllerNumber.toString() + "Button0JustPressed"];
					
					// - XBOX Button B //

					this["j" + controllerNumber.toString() + "ButtonBPressed"] = this["j" + controllerNumber.toString() + "Button1Pressed"];
					this["j" + controllerNumber.toString() + "ButtonBJustPressed"] = this["j" + controllerNumber.toString() + "Button1JustPressed"];		

					// - XBOX Button X //
					
					this["j" + controllerNumber.toString() + "ButtonXPressed"] = this["j" + controllerNumber.toString() + "Button2Pressed"];
					this["j" + controllerNumber.toString() + "ButtonXJustPressed"] = this["j" + controllerNumber.toString() + "Button2JustPressed"];
					
					// - XBOX Button Y //					
					
					this["j" + controllerNumber.toString() + "ButtonYPressed"] = this["j" + controllerNumber.toString() + "Button3Pressed"];
					this["j" + controllerNumber.toString() + "ButtonYJustPressed"] = this["j" + controllerNumber.toString() + "Button3JustPressed"];	
					
					// - XBOX Button LB  //
					
					this["j" + controllerNumber.toString() + "ButtonLBPressed"] = this["j" + controllerNumber.toString() + "Button4Pressed"];
					this["j" + controllerNumber.toString() + "ButtonLBJustPressed"] = this["j" + controllerNumber.toString() + "Button4JustPressed"];
					
					// - XBOX Button RB //

					this["j" + controllerNumber.toString() + "ButtonRBPressed"] = this["j" + controllerNumber.toString() + "Button5Pressed"];
					this["j" + controllerNumber.toString() + "ButtonRBJustPressed"] = this["j" + controllerNumber.toString() + "Button5JustPressed"];		

					// - XBOX Button Back //
					
					this["j" + controllerNumber.toString() + "ButtonBackPressed"] = this["j" + controllerNumber.toString() + "Button6Pressed"];
					this["j" + controllerNumber.toString() + "ButtonBackJustPressed"] = this["j" + controllerNumber.toString() + "Button6JustPressed"];
					
					// - XBOX Button Start //					
					
					this["j" + controllerNumber.toString() + "ButtonStartPressed"] = this["j" + controllerNumber.toString() + "Button7Pressed"];
					this["j" + controllerNumber.toString() + "ButtonStartJustPressed"] = this["j" + controllerNumber.toString() + "Button7JustPressed"]					
					
					// - XBOX Button LeftStickClickJustPressed //
					
					this["j" + controllerNumber.toString() + "ButtonLeftStickClickPressed"] = this["j" + controllerNumber.toString() + "Button8Pressed"];
					this["j" + controllerNumber.toString() + "ButtonLeftStickClickJustPressed"] = this["j" + controllerNumber.toString() + "Button8JustPressed"];
					
					// - XBOX Button RightStickClickJustPressed //					
					
					this["j" + controllerNumber.toString() + "ButtonRightStickClickPressed"] = this["j" + controllerNumber.toString() + "Button9Pressed"];
					this["j" + controllerNumber.toString() + "ButtonRightStickClickJustPressed"] = this["j" + controllerNumber.toString() + "Button9JustPressed"]
					
					
				}
				
			}
		}
	}
}