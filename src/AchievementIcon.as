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
 * AchievementIcon.as
 * Created On: 19/04/2012 9:10 PM
 */
 
package 
{
	import org.flixel.*;

	public class AchievementIcon extends FlxSprite
	{
		[Embed(source = "../data/HUD/icons.png")] private var ImgAchievementIcon:Class;
	
		public function AchievementIcon(X:int,Y:int)
		{
			super(X, Y);
						
			loadGraphic(ImgAchievementIcon, true, false, 34, 34);			
			
			addAnimation("wh", [0], 0 , true);
			addAnimation("fa", [1], 0 , true);
			addAnimation("mg", [2], 0 , true);
			addAnimation("xwh", [3], 0 , true);
			addAnimation("xfa", [4], 0 , true);
			addAnimation("xmg", [5], 0 , true);
			addAnimation("ta", [6], 0 , true);
			addAnimation("te", [7], 0 , true);
			
			play("wh");
		}

		override public function update():void
		{
			super.update();

		}
	}
}