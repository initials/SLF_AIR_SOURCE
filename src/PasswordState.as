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
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.CenterSlideFX
	
	import flash.net.FileReference;
	import flash.net.FileFilter;
	import flash.events.IOErrorEvent;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	
	
	public class PasswordState extends FlxState
	{
		
		public var p1:Boolean;
		public var p2:Boolean;
		public var p3:Boolean;
		public var p4:Boolean;
		public var p5:Boolean;
		public var count:int;
		public var txtLevel:FlxText ;
		

		override public function create():void
		{
			
			
			
			FlxG.bgColor = 0xffF8CB8F;
			p1 = false;
			p2 = false;
			p3 = false;
			p4 = false;
			p5 = false;
			count = 0;
						
			
			txtLevel= new FlxText(0, 14, FlxG.width, "Click to start");
			txtLevel.size = 24;
			txtLevel.alignment = "left";
			add(txtLevel);
			
			FlxG.mouse.show();
			
			
		}

		override public function update():void
		{
			
			
			if (FlxG.mouse.justPressed() ) {
				txtLevel.text = "Enter password";
			}
			
			super.update();
			
			if (FlxG.keys.justPressed("K") && count==0 ){
				p1 = true;
				count++;
			}
			if (FlxG.keys.justPressed("A") && count==1) {
				p2 = true;
				count++;

			}
			if (FlxG.keys.justPressed("P") && count==2) {
				p3 = true			
				count++;

				
			}
			if (FlxG.keys.justPressed("U")  && count==3){
				p4 = true;
				count++;

			}
			if (FlxG.keys.justPressed("T")  && count==4){
				p5 = true;
				count++;

			}	
			
			
			
			if (p1==true && p2== true && p3==true && p4==true && p5==true) {
				FlxG.switchState(new MenuState());
			}
						

								
		}


		
	}
}
