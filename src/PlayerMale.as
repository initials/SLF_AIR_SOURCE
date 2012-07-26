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
	
	public class PlayerMale extends Character
	{
		
		[Embed(source = "../data/chars_50x50.png")] private var ImgPlayer:Class;
		
		[Embed(source = "../data/sfx_128/whoosh.mp3")] protected var SndWhoosh:Class;
		
		public var airDash:Number;
		
		public function PlayerMale(X:int,Y:int,playerNumber:int, talkString:String)
		{
			super(X, Y, playerNumber, talkString);
			
			_playerNumber = playerNumber;			
			
			loadGraphic(ImgPlayer, true, true, 50,80);
						
			//animations
			
			addAnimation("run", [6, 7, 8, 9, 10, 11 ], 18, true);
			//addAnimation("idle", [48, 49, 50, 51], 6, true);
			addAnimation("idle", [51], 0, true);
			addAnimation("not_controlled", [1], 0, true);
			
			addAnimation("onConveyor", [10, 11], 24, true);
			addAnimation("jump", [10, 11], 2, true);
			addAnimation("death", [60, 60, 61, 61, 62, 62, 63, 63], 12, false);
			
			addAnimation("piggyback", [72, 73,74,75,76,77], 12, true);
			addAnimation("piggyback_idle", [78], 0, false);
			addAnimation("piggyback_jump", [76,77,76], 4, true);
			addAnimation("piggyback_dash", [80], 0, false);
			addAnimation("talk", [51,48,51,49,51,50], 6, true);

			
			play("idle", true);
			
			
			
			//this.height = 15;
			//this.offset.y = 10;
			//this.width = 6;

			
			this.width = 10;
			this.height = 41;        
			this.offset.x = 20;
			this.offset.y = 39;
					
			
			//centerOffsets();
					
		}
		
		

		

		
		override public function update():void
		{			
			//trace(this.x, this.y);
			
			if ( (FlxG.keys.pressed(Registry.p1Action)|| FlxG.joystick.j1ButtonXPressed) && this._curAnim.name!="death" && this._currentlyControlled && !FlxG.keys.pressed(Registry.p1Down) && (levelOver==false) ) { // && ! this._curAnim.name=="death"
				this._talk = false;
				airDash += FlxG.elapsed;
				if (FlxG.keys.justPressed(Registry.p1Action) || FlxG.joystick.j1ButtonXJustPressed) {
					FlxG.play(SndWhoosh, 0.1, false, true);
					
				}
				if (airDash<=0.5) {
					if (this._facing==RIGHT)
						this.velocity.x = 500;
					else if (this._facing == LEFT)
						this.velocity.x = -500;
				}
			}
			else {
				airDash = 0;
			}
			
			if (this.dead) {
				airDash = 0;
			}
			
			super.update();
		}
	
	}
}