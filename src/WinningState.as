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
	import org.flixel.plugin.photonstorm.FX.CenterSlideFX;
	import org.flixel.plugin.photonstorm.FX.GlitchFX;
	
	
	
	public class WinningState extends PlayState
	{
		public var winningText:FlxText;
		[Embed(source = "../data/logo.png")] private var ImgLogo:Class;
		private var slide:CenterSlideFX;
		private var glitch:GlitchFX;
		public var counter:Number;
		
		
		override public function create():void
		{
			
			super.create();
			
			FlxG.playMusic(Registry.SndFarewell, 1.0);
			
			winningText = new FlxText(0,FlxG.height/4,FlxG.width,"You are a winner!\n");
			
			winningText.size = 16;
			winningText.alignment = "center";
			winningText.color = 0x8000FF;
			add(winningText);
			
			if (Registry.endingType == 0) {
				winningText.text = "You are a winner!\nTry to find the real ending.";
				
			}
			if (Registry.winniLevel == 1) {
				winningText.text = "You are a winner!\nThis is the real ending.";
			}
						
			counter = 0;
			
			
			
			var save:FlxSave = new FlxSave();
			if(save.bind("Mode"))
			{
				if(save.data.completions == null)
					save.data.completions = 0 as Number;
				else
					save.data.completions++;
				save.close();
			}
			
			
			
			
		}

		override public function update():void
		{
			counter += FlxG.elapsed;
			if (FlxG.keys.justPressed(Registry.homeKey)) {
				onQuit();			
				
			}
			
			if ((FlxG.keys.justPressed(Registry.p1Action) || FlxG.keys.justPressed(Registry.p2Action) || FlxG.keys.justPressed(Registry.p1Jump) || FlxG.keys.justPressed(Registry.p2Jump) ) && ( counter > 5)  ) 
			{
				onQuit();			
				
			}
			
			
			super.update();
			
		}
		
		
		private function onQuit():void
		{
			// Go back to the MenuState
			if (Registry.isWinnitron) {
				FlxG.switchState(new WinniMenuState);
			}
			else {
				FlxG.switchState(new MenuState);
			}
		}
		
		

		
		

		
	}
}
