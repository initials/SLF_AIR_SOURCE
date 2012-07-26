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
 
 /*
 * PlayerFemale.as
 * Created On: 25/08/2011 8:29 PM
 */
 
package 
{
	import org.flixel.*;

	public class PlayerFemale extends Character
	{
		[Embed(source = "../data/chars_50x50.png")] private var ImgPlayer:Class;
		
		//public var canDoubleJump:Boolean;
		
		public function PlayerFemale(X:int,Y:int,playerNumber:int, talkString:String)
		{
			super(X, Y, playerNumber, talkString);
			
			canDoubleJump = true;
			
			loadGraphic(ImgPlayer, true, true, 50,80);			
			
			addAnimation("run", [12, 13, 14, 15, 16, 17 ], 18, true);
			addAnimation("idle", [2], 0, true);
			addAnimation("not_controlled", [59], 0, true);
			
			addAnimation("onConveyor", [14, 12], 24, true);
			addAnimation("jump", [16, 17], 2, true);
			addAnimation("death", [64,64,65,65,66,66,67,67], 12, true);
			
			addAnimation("piggyback", [72, 73,74,75,76,77], 12, true);
			addAnimation("piggyback_idle", [78], 0, false);
			addAnimation("piggyback_jump", [76,77,76], 4, true);
			addAnimation("piggyback_dash", [80], 0, false);
			
			
			play("idle", true);
			
			_playerNumber = playerNumber;
			
			//this.width = 6;
			//centerOffsets();
			//this.height = 15;
			//this.offset.y = 10;
			
			this.width = 10;
			this.height = 41;        
			this.offset.x = 20;
			this.offset.y = 39;
			
			//character specific attributes
			this._runSpeed = 90;
			this._jumpPower = -230;
			

		}

		override public function update():void
		{
			if (_isPiggyBacking) {
				this.visible = false;
			}
			else {
				this.visible = true;
			}
			
/*			if (this.isTouching(FLOOR)) {
				canDoubleJump = true;
			}*/
			
			//if (FlxG.keys.justPressed("N") ){

            //if ( FlxG.touches.vcpButton2 && canDoubleJump && !hasDoubleJumped && jumpCounter==1  && !self.onFloor) {
                //NSLog(@"hit a double jump");
                //this.velocity.y = -410;
/*                jumpCounter++;
                canDoubleJump=NO;
                hasDoubleJumped=YES;
				*/
            //}
			super.update();

		}
		
		
		
	}
}