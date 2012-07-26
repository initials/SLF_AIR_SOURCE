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
 * CheckPoint.as
 * Created On: 1/05/2012 10:42 PM
 */
 
package 
{
	import org.flixel.*;

	public class CheckPoint extends FlxSprite
	{
		[Embed(source = "../data/pickups/andreCheckPoint.png")] private var ImgAndreCheckPoint:Class;
		[Embed(source = "../data/pickups/liselotCheckPoint.png")] private var ImgLiselotCheckPoint:Class;
		public var type:int;
		public var checked:Boolean;
		
		public function CheckPoint(X:int,Y:int, Type:int)
		{
			type = Type;
			
			super(X, Y);
			
			if (type==0)
				loadGraphic(ImgAndreCheckPoint, true, false, 28, 60);			
			else
				loadGraphic(ImgLiselotCheckPoint, true, false, 28, 60);	
				
				
			scrollFactor.x = 1;
			scrollFactor.y = 1;
				
			addAnimation("flicker", [0,0,1,1,0,0,1,1,0,1], 12 , true);
			addAnimation("checked", [2], 0 , true);
			
			play("flicker");
			
			checked = false;
			
		}

		override public function update():void
		{
			if (!checked) {
				this.play("flicker");
			}
			else {
				this.play("checked");
				
			}
			super.update();

		}
	}
}