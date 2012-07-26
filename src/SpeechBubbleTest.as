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
 * SpeechBubbleTest.as
 * Created On: 14/05/2012 8:39 PM
 */
 
package 
{
	import org.flixel.*;

	public class SpeechBubbleTest extends FlxState
	{
		[Embed(source = "../data/speechBubbleTiles.png")] private var ImgSpeechTiles:Class;
		public var speechBlock:FlxTileblock;
		public var speechText:FlxText;
		public var height:int;
				
		override public function create():void
		{
			
			FlxG.bgColor = 0xffF8CB8F;
			height = 70;
			
			speechBlock = new FlxTileblock( 20, 20, 180, 300);
			speechBlock.loadTiles(ImgSpeechTiles, 0, 0, 0, true);
			add(speechBlock);
			
			speechText = new FlxText(25, 25, 175, "am\nam\nam", true);
			speechText.alignment = "left";
			speechText.size = 8;
			speechText.color = 0xFF000000;
			add(speechText);
			
		}

		override public function update():void
		{
			
			if (FlxG.keys.justPressed("S") ) {
				
				speechText.text = speechText.text + "am\n";
				
				speechBlock.height = speechText.height+5;
				
				speechBlock.loadTiles(ImgSpeechTiles, 10, 10, 0, true);
				
				
			}
			if (FlxG.keys.justPressed("A") ) {

				
				speechText.text = "new ";
				speechBlock.height = speechText.height;
				speechBlock.loadTiles(ImgSpeechTiles, 10, 10, 0, true);
				
			}			
			
			
			super.update();

		}
	}
}