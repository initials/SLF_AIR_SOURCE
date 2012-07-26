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
	
	public class Enemy extends FlxSprite
	{
		
		public var limitX:int;
		public var limitY:int;
		public var _talkString:String;
		public var _startingPosition:FlxPoint;
		public var _limitPosition:FlxPoint;
		public var _originalVelocityX:Number;
		public var _talk:Boolean;
		private var _talkCounter:Number;

		
		public function Enemy(X:int, Y:int, talkString:String)
		{
			_startingPosition = new FlxPoint(X, Y);
			
			super(X, Y);
			acceleration.y = 880;
			_talkString = talkString;
			_talkCounter = 0;
			

		}
	
		override public function update():void
		{
			//trace(limitX + " " + limitY + " " + _talkString);
			
			//trace(this.isTouching(FlxObject.LEFT) + "    " + this.isTouching(FlxObject.RIGHT));
			
			if (this._facing == RIGHT  ) {
				if (this.x > limitX ) {
					this.x = limitX;
					this.velocity.x = _originalVelocityX * -1;
					facing = LEFT;
					
				}
				if (this.isTouching(FlxObject.RIGHT)) {
					this.velocity.x = _originalVelocityX * -1;
					facing = LEFT;					
				}
			}
			if (this._facing == LEFT) {
				if (this.x < _startingPosition.x  ) {
					this.x = _startingPosition.x;
					this.velocity.x = _originalVelocityX;
					facing = RIGHT;
					
				}
				if (this.isTouching(FlxObject.LEFT)) {
					//this.velocity.x = _originalVelocityX * -1;
					
					this.velocity.x = _originalVelocityX ;
					facing = RIGHT;					
				}				
			}
			
			if ((this.velocity.x > 1) || (this.velocity.x < -1) ) {
				this.play("walk");
			}
			
			if (_talk) {
				this.velocity.x = 0;
				_talkCounter += FlxG.elapsed;
				this.play("talk");
			}
			
			if (_talkCounter > 2) {
				if (this._facing == LEFT)
					this.velocity.x = this._originalVelocityX*-1;
				if (this._facing == RIGHT)
					this.velocity.x = this._originalVelocityX;
										
					
				_talkCounter = 0;
				_talk = false;
			}
			
			super.update();
			
		}
			
	}
}