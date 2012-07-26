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

	public class Exit extends FlxSprite
	{
		[Embed(source = "../data/exit.png")] private var ImgExit:Class;
		public var _nextLevel:int;
		
		
		public function Exit(X:int,Y:int, nextLevel:int)
		{
			super(X, Y);
			_nextLevel = nextLevel;
			
		
			loadGraphic(ImgExit, true, false, 66, 110);			
			
			if (Registry.levelType == 1) {
				addAnimation("open", [0,0,0,1,0,0,1,0,1,0], 12 , true);
				addAnimation("closed", [2,2,2,3,2,2,3,2,3,2], 12 , true);
			}
			else if (Registry.levelType == 2) {
				addAnimation("open", [4,4,4,5,4,4,5,4,5,4], 12 , true);
				addAnimation("closed", [6,6,6,7,6,6,7,6,7,6], 12 , true);	
			}
			else if (Registry.levelType == 3) {
				addAnimation("open", [8,8,8,9,8,8,9,8,9,8], 12 , true);
				addAnimation("closed", [10,10,10,11,10,10,11,10,11,10], 12 , true);	
			}			
			
			
			
			play("closed");
			
			

		}

		override public function update():void
		{
			super.update();

		}
	}
}