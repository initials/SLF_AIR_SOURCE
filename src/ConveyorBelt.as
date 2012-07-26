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
	import flash.geom.Rectangle;
	import org.flixel.plugin.photonstorm.*;
	

	public class ConveyorBelt extends FlxSprite
	{
		
		[Embed(source="../data/conveyorBeltBlockWithEnds.png")] private var ImgConveyorBelt:Class;
		
		/**
		* The speed at which the conveyor belt travels.
		*/
		public var _speed:Number;
		
		public function ConveyorBelt(X:int,Y:int, Speed:Number)
		{
			
			loadGraphic(ImgConveyorBelt, false, false,50,20);
			
			this.x = X;
			this.y = Y;
			_speed = Speed;
			immovable = true;
			
			FlxScrollZone.add(this, new Rectangle(5, 0, 40, 20), _speed, 0, true);	
			
		}
		
		override public function update():void
		{
			FlxScrollZone.updateX(this, _speed);
			
			super.update();
		}
		
		override public function destroy():void
		{
			
			//	Important! Clear out the scrolling image from the plugin, otherwise resources will get messed right up after a while
			//  FlxScrollZone.clear();
			
			super.destroy();
		}
		
		public function setSpeed(Speed:Number):void {
			
		}
		
		
	}
}