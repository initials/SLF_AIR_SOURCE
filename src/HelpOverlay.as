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

	public class HelpOverlay extends FlxSprite
	{
		[Embed(source="../data/tutorial/helpButtonW.png")] private var ImgW:Class;
		[Embed(source="../data/tutorial/helpButtonF.png")] private var ImgF:Class;
		[Embed(source = "../data/tutorial/helpButtonM.png")] private var ImgM:Class;
				
		
		public function HelpOverlay(X:int,Y:int)
		{
			super(X, Y);
			
			if (Registry.levelType==1)
				loadGraphic(ImgW, true, false, 390, 50);
			else if (Registry.levelType==2)
				loadGraphic(ImgF, true, false, 390, 50);
			else if (Registry.levelType==3)
				loadGraphic(ImgM, true, false, 390, 50);
			else
				loadGraphic(ImgW, true, false, 390, 50);
				
			
			
			addAnimation("Idle", [0,1,2], 4 , false);
			
			play("Idle");
			
			
			
		}

		override public function update():void
		{
			super.update();

		}
	}
}