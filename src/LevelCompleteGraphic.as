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
 * LevelCompleteGraphic.as
 * Created On: 22/04/2012 10:20 PM
 */
 
package 
{
	import org.flixel.*;

	public class LevelCompleteGraphic extends FlxSprite
	{
		[Embed(source = "../data/buttons/levelCompleteGraphic.png")] private var ImgLevelCompleteGraphic:Class;
	
		public function LevelCompleteGraphic(X:int,Y:int)
		{
			super(X, Y);
						
			loadGraphic(ImgLevelCompleteGraphic, false, false, 248, 181);
			
			angularVelocity = 2000;
			angularDrag = 2500;
			angle = -800;
			scrollFactor.x = 0;
			scrollFactor.y = 0;
			scale.x = 0;
			scale.y = 0;
			
		}

		override public function update():void
		{
			if (scale.x < 1) {
				scale.y = scale.x += 0.02;
			}
			else {
				scale.x = scale.y = 1;
			}
			
			
			if (angle < 1 && angle > -1) {
				angle=0;
			}
	
			super.update();

		}
	}
}