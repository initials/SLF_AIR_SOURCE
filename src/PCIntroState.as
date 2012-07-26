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
 * PCIntroState.as
 * Created On: 7/05/2012 8:27 PM
 */
 
package 
{
	import org.flixel.*;


	public class PCIntroState extends FlxState
	{
		
		private var logo:FlxSprite;
		private var worker:FlxSprite;
		private var army:FlxSprite;
		private var andre:FlxSprite;
		private var liselot:FlxSprite;
		private var pressStart:FlxText;
		
		private var clicks:int;
		
		override public function create():void
		{
			
			clicks = 0;
			FlxG.mouse.hide();
			
			FlxG.camera.zoom = 1;
				
			FlxG.bgColor = 0xffd3bdb2;
			
			logo = new FlxSprite(0, 0, Registry.ImgLogo);
			add(logo);
			logo.x = FlxG.width / 2 - logo.width / 2;
			logo.y = FlxG.height / 2 - logo.height / 2;
			
			andre = new FlxSprite(FlxG.width+200, 0, Registry.ImgAndre);
			add(andre);
			andre.y = FlxG.height - andre.height;
			andre.drag.x = 2000;
			andre.velocity.x = -1630;
			
			liselot = new FlxSprite(FlxG.width-20-239-640, 0, Registry.ImgLiselot);
			add(liselot);
			liselot.y = FlxG.height - liselot.height;		
			liselot.drag.x = 2000;	
			liselot.velocity.x = 1630;
				
			worker = new FlxSprite(FlxG.width+200, 0, Registry.ImgWorker);
			add(worker);
			worker.y = FlxG.height - worker.height;
			worker.drag.x = 2000;
			//worker.velocity.x = -1630;
			
			army = new FlxSprite(FlxG.width-20-239-640, 0, Registry.ImgArmy);
			add(army);
			army.y = FlxG.height - army.height;
			army.drag.x = 2000;
			//army.velocity.x = 1630;
			
			pressStart = new FlxText(0, FlxG.height - 40, FlxG.width, "", true);
			pressStart.size = 16;
			pressStart.shadow = 0xff000000;
			add(pressStart);
			
			pressStart.text = "Press " + Registry.p1Action + ", " + Registry.p1Jump + ", " + Registry.p1Switch + " to start.";
			
			if (FlxG.usingJoystick) {
				pressStart.text = pressStart.text + "\nOr Press A or B on your control pad.";
			}
		
			FlxG.play(Registry.SndOnShoulders,0.9);
		
		}
		
		public function endFade():void {
			FlxG.switchState(new PCMenuState());
		}

		override public function update():void
		{
			
			
			if (FlxG.mouse.justPressed() || FlxG.keys.justPressed(Registry.p1Action) || FlxG.keys.justPressed(Registry.p1Switch) || FlxG.keys.justPressed(Registry.p1Jump) || FlxG.joystick.j1ButtonAJustPressed || FlxG.joystick.j1ButtonBJustPressed  ) {
				clicks++;
				if (clicks == 1) {
					worker.velocity.x = -1630;
					army.velocity.x = 1630;
					liselot.velocity.x = -1630;
					andre.velocity.x = 1630;
					FlxG.play(Registry.SndJump, 0.9);
				
				}
				if (clicks == 2) {
					worker.velocity.x = -1630;
					army.velocity.x = 1630;		
					FlxG.play(Registry.SndJump, 0.9);
					FlxG.fade(0xffd3bdb2, 1, endFade);
					
				}				
				
				
					
			}
			
			super.update();
			
			if (worker.x < -225 || clicks>5) {

				
				FlxG.switchState(new PCMenuState());
			}
		}
	}
}