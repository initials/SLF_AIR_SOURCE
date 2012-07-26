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
 * EnemyGeneric.as
 * Created On: 15/05/2012 10:27 PM
 */
 
package 
{
	import org.flixel.*;

	public class EnemyGeneric extends FlxSprite
	{
		[Embed(source="../data/chars_50x50.png")] private var ImgChars:Class;
	
		public function EnemyGeneric(X:int,Y:int)
		{
			super(X, Y);
				
			loadGraphic(ImgChars, true, true, 50,80);
						
			//animations
			
			addAnimation("armyidle", [4], 1, true);
			addAnimation("armywalk", [36,37,38,39,40,41], 10, true);
			addAnimation("armytalk", [4, 57], 6, true);
			
			addAnimation("chefidle", [5], 1, true);
			addAnimation("chefwalk", [30,31,32,33,34,35], 10, true);
			addAnimation("cheftalk", [5,58], 6, true);
			
			addAnimation("inspectoridle", [3], 1, true);
			addAnimation("inspectorwalk", [24, 25, 26, 27, 28, 29], 10, true);
			addAnimation("inspectortalk", [3, 56], 8, true);
			
			addAnimation("workeridle", [0], 1, true);
			addAnimation("workerwalk", [18,19,20,21,22,23], 10, true);
			addAnimation("workertalk", [0, 53, 52, 54], 6, true);			
			
			addAnimation("andreidle", [48], 0, true);
			addAnimation("andrewalk", [6, 7, 8, 9, 10, 11 ], 18, true);
			addAnimation("andretalk", [51, 48, 51, 49, 51, 50], 6, true);
			
			addAnimation("liselotidle", [2], 0, true);
			addAnimation("liselotwalk", [12, 13, 14, 15, 16, 17 ], 18, true);	
			
			this.width = 10;
			this.height = 41;        
			this.offset.x = 20;
			this.offset.y = 39;
			
		}

		override public function update():void
		{
			super.update();

		}
	}
}