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
 * FilingCabinet.as
 * Created On: 14/04/2012 10:03 PM
 */
 
package 
{
	import org.flixel.*;

	public class FilingCabinet extends FlxSprite
	{
		[Embed(source = "../data/level3/FilingCab1.png")] private var ImgFilingCab1:Class;
		[Embed(source = "../data/level3/FilingCab2.png")] private var ImgFilingCab2:Class;
		public var canClose:Number;
	
		public function FilingCabinet(X:int,Y:int, type:int)
		{
			super(X, Y);
			if (type==1)
				loadGraphic(ImgFilingCab1, false, false, 34, 90);	
			else if (type == 2)
				loadGraphic(ImgFilingCab2, false, false, 34, 60);
				
			addAnimation("open", [0], 0, false);
			addAnimation("closed", [0,1,2,3,4,3,3,2,2,1,1,0], 12, false);
			play("open", true);
			
			canClose = 110;
		}

		override public function update():void
		{
			canClose += FlxG.elapsed;
			super.update();

		}
		
		public function closeDoors():void {
			if (canClose > 10){
				play("closed", true);
				
				canClose = 0;
				
			}
			
		}
		
		
	}
}