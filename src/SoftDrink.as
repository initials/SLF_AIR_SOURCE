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
 * SoftDrink.as
 * Created On: 25/08/2011 8:52 PM
 */
 
package 
{
	import org.flixel.*;

	public class SoftDrink extends PickUp
	{
		[Embed(source="../data/bottle.png")] private var ImgBottle:Class;
		
		public function SoftDrink(X:int,Y:int)
		{
			super(X, Y);
						
			loadGraphic(ImgBottle, true, false, 12, 26);			
			
			addAnimation("grape", [0,1], (2+FlxG.random()*2) , true);
			addAnimation("orange", [2, 3], (2+FlxG.random()*2), true);
			
			play("grape");
			

		}

		override public function update():void
		{
			super.update();

		}
	}
}