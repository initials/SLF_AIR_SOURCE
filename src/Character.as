/*
 * Copyright (c) 2011-2012 Initials Video Games
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */ 

 
package
{
	import org.flixel.*;
	import Math;
	

	public class Character extends FlxSprite
	{
		
		[Embed(source = "../data/chars_50x50.png")] private var ImgPlayer:Class;
		
		[Embed(source = "../data/sfx_128/jump.mp3")] protected var SndJump:Class;		

		
		public var _playerNumber:int;
		public var _jumpKey:String;
		public var _actionKey:String;
		public var _talk:Boolean;
		
		public var _jumpJoy:String;
		public var _jumpJoyJust:String;
		
		public var _leftKey:String;
		public var _rightKey:String;
		public var _onConveyor:Boolean;
		public var _jump:Number;
		public var _jumpPower:Number;
		public var coinVel:Number;
		public var trick:String = "";
		public var _powerUpTimer:Number = 6;
		public var _wallJump:Number;
		public var _onWall:Boolean;
		public var _doubleJump:Boolean = false;
		public var _numberOfJumps:int = 0;
		public var _onLadder:Boolean = false;
		public var _usingLadder:Boolean = false;
		public var _runSpeed:uint = 80;
		
		public var startsFirst:int = 1;
		
		public var _isPiggyBacking:Boolean;
		
		public var canDoubleJump:Boolean;
		public var hasDoubleJumped:Boolean;
		public var jumpCounter:int=0;
		public var _talkString:String;
		
		public var _currentlyControlled:Boolean;
		
		public var _startingPosition:FlxPoint;
		
		public var dead:Boolean;
		
		public var levelOver:Boolean;
		
		public var checkPointValue:FlxPoint;

		
		
		public function Character(X:int,Y:int,playerNumber:int, talkString:String)
		{
			_currentlyControlled = true;
			levelOver = false;
			
			
			dead = false;
			
/*			_startingPosition.x = X;
			_startingPosition.y = Y;*/
			
			super(X, Y);
			
			_startingPosition = new FlxPoint(X, Y);
			
			checkPointValue = _startingPosition;
			
			
			_talkString = talkString;
			
			
			
			//basic player physics
			drag.x = _runSpeed*8;
			acceleration.y = 880;
			maxVelocity.x = _runSpeed+80;
			maxVelocity.y = 1200;
			
			_playerNumber = playerNumber;
			_onWall = false;
			_jumpPower = -240;
			
			
			

			this.width = 6;
			centerOffsets();
			this.height = 15;
			this.offset.y = 10;
			
			if (_playerNumber == 1) {
				_jumpKey = Registry.p1Jump;
				_rightKey = Registry.p1Right;
				_leftKey = Registry.p1Left;
				_actionKey = Registry.p1Action;
				
				_jumpJoy = "j1ButtonAPressed";
				_jumpJoyJust = "j1ButtonAJustPressed";
			}
			else if (_playerNumber == 2) {
				if (Registry.playersNo==2) {
					_jumpKey = Registry.p2Jump;
					_rightKey = Registry.p2Right;
					_leftKey = Registry.p2Left;
					_actionKey = Registry.p2Action;
					_jumpJoy = "j2ButtonAPressed";
					_jumpJoyJust = "j2ButtonAJustPressed";					
				}
				if (Registry.playersNo==1) {
					_jumpKey = Registry.p1Jump;
					_rightKey = Registry.p1Right;
					_leftKey = Registry.p1Left;
					_actionKey = Registry.p1Action;
					_jumpJoy = "j1ButtonAPressed";
					_jumpJoyJust = "j1ButtonAJustPressed";					
				}
			}
			
					
			
			
			
			
			
		}
		
		public function turnOnDoubleJump():void {
			_doubleJump = true;
			_powerUpTimer = 0;
			
		}
		
		//** Handles all jumping for characters 
		
		public function jump():void {
				
			if (FlxG.keys.justPressed(_jumpKey) || FlxG.joystick[_jumpJoyJust]  ) {
				if (this.isTouching(FlxObject.FLOOR)) {
					FlxG.play(SndJump,0.5);
				}
				//velocity.x = -velocity.x;
				//_jump = 0;
				jumpCounter++;
				
			}
			
			if( ((_jump >= 0)  ) && (FlxG.keys.pressed(_jumpKey) || (FlxG.joystick[_jumpJoy]) ) && Registry.canJump ) 
			{	
				
				
				_jump += FlxG.elapsed;
				if (_jump > 0.35) {
					_jump = -1;
				}
			}
			else {
					_jump = -1;
				
			}
				
			if(_jump > 0)
			{
				if(_jump < 0.1) {
					velocity.y = _jumpPower*1.2;
				}
				else {
					velocity.y = _jumpPower;
				}
			}
			else if (!this.isTouching(FlxObject.FLOOR)) {
				velocity.y += 5;
			}
			
			if (this.isTouching(FLOOR)) {
				canDoubleJump = true;
				jumpCounter = 0;
			}
			
			if ( (FlxG.keys.justPressed(_jumpKey) || FlxG.joystick[_jumpJoyJust] )  && jumpCounter == 1  && _playerNumber == 2) {
                this.velocity.y = -410;
                jumpCounter++;
                canDoubleJump=false;
                hasDoubleJumped = true;
				FlxG.play(SndJump, 0.5);
				
			}
			
			//trace(jumpCounter);
				
			
		}
		
		public function move():void {
						
			acceleration.x = 0;
			
			if( FlxG.keys.pressed(_leftKey)  )
			{
				this._talk = false;
				facing = LEFT;
				acceleration.x -= drag.x ;
				//acceleration.x -= 10000;
			}
			else if(FlxG.keys.pressed(_rightKey)  )
			{
				this._talk = false;
				facing = RIGHT;
				acceleration.x += drag.x ;				
				//acceleration.x += 10000;				
			} 
			
			if (_playerNumber == 1) {			
				if( FlxG.joystick.j1Stick1LeftPressed  )
				{
					this._talk = false;
					facing = LEFT;
					acceleration.x -= (drag.x * (FlxG.joystick.j1Stick1X*-1 )) ;
					//acceleration.x -= 10000;
				}
				else if( FlxG.joystick.j1Stick1RightPressed )
				{
					this._talk = false;
					facing = RIGHT;
					acceleration.x += (drag.x * FlxG.joystick.j1Stick1X) ;				
					//acceleration.x += 10000;				
				}
			}
			if (_playerNumber == 2) {	
				if (Registry.playersNo==1) {
					if( FlxG.joystick.j1Stick1LeftPressed  ) 
					{
						this._talk = false;
						facing = LEFT;
						acceleration.x -= (drag.x * (FlxG.joystick.j1Stick1X*-1 )) ;
						//acceleration.x -= 10000;
					}
					else if( FlxG.joystick.j1Stick1RightPressed )
					{
						this._talk = false;
						facing = RIGHT;
						acceleration.x += (drag.x * FlxG.joystick.j1Stick1X) ;				
						//acceleration.x += 10000;				
					}
				}
				else if (Registry.playersNo==2) {
					if( FlxG.joystick.j2Stick1LeftPressed  ) 
					{
						this._talk = false;
						facing = LEFT;
						acceleration.x -= (drag.x * (FlxG.joystick.j2Stick1X*-1 )) ;
						//acceleration.x -= 10000;
					}
					else if( FlxG.joystick.j2Stick1RightPressed )
					{
						this._talk = false;
						facing = RIGHT;
						acceleration.x += (drag.x * FlxG.joystick.j2Stick1X) ;				
						//acceleration.x += 10000;				
					}
					
				}
			}
		}
		
		
		override public function update():void
		{
			
/*			if (FlxG.keys.justPressed("SEVEN") ){
				this.x = _startingPosition.x;
				this.y = _startingPosition.y;
			}*/
			//trace(_currentlyControlled);
			
			acceleration.x = 0;
			//if (velocity.x == 0) play("idle");
			//else play("run");
			
			if ((Registry.playersNo==1) && (_currentlyControlled==true) && (!dead) && (levelOver==false) ) {
				jump();
				move();	
			}
			else if ((Registry.playersNo == 2) && (!dead)  && (levelOver==false) ) {
				jump();
				move();					
			}
			
/*			if (_onConveyor==true) {
				play("onConveyor");
			}*/
			if (dead) {
				play("death", false);
				if ((_curFrame == 7 ) && (this.isTouching(FlxObject.FLOOR)) ) {
					
					//FlxG.timeScale = 0.1;
/*					this.x = _startingPosition.x;
					this.y = _startingPosition.y;
					
					dead = false;
					
					trace(_startingPosition.x, _startingPosition.y, this.x, this.y);
					
					this.velocity.x = 0;
					this.velocity.y = 0;

					return;*/
					
				}
			}
			else if (!(this.isTouching(FlxObject.FLOOR) ) ) {
				if (_isPiggyBacking) {
					play("piggyback_jump");
				}
				else {
					play("jump");
					
				}
			}
			else if (velocity.x == 0) {
				if (_isPiggyBacking) {
					play("piggyback_idle");
				}
				else {
					if (_talk)
						play("talk");
					else {
						if(_currentlyControlled || Registry.playersNo==2)
							play("idle");
						else 
							play("not_controlled");
					}
				}
			}
			else 
			{	
				if (_isPiggyBacking) {
					play("piggyback");
				}
				else {
					play("run");

				}
			}
			
/*			if (FlxG.keys.V) {
				play("onConveyor", false);				
			}
			if (FlxG.keys.B) {
				play("onConveyor", true);				
			}	*/
			
			//animation
			
			super.update();
			
			if (this.isTouching(FlxObject.FLOOR) && (!FlxG.keys.pressed(_jumpKey) ) && !FlxG.joystick.j1ButtonAPressed ) {
				_jump = 0;
			}
			
			//reset Character back to start point
		
			if (this.dead && (_curFrame == 7 ) && (this.isTouching(FlxObject.FLOOR)) ) {
				
				dead = false;
				
				this.velocity.x = 0;
				this.velocity.y = 0;
				
				// set back to start
				
				//this.reset(_startingPosition.x, _startingPosition.y);
				
				//set back to last check Point
				
				this.reset(checkPointValue.x, checkPointValue.y);
				
				Registry.timeLeft -= 10;
				
				return;
				
			}
			
/*			if (FlxG.keys.justPressed("EIGHT")) {
				this.x = _startingPosition.x;
				this.y = _startingPosition.y-10;
			}*/
				
				
			
			
			_onConveyor = false;
			
		}
		
		
		
	}
}