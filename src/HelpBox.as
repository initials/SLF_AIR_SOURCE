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
 * Crate.as
 * Created On: 27/08/2011 8:34 PM
 */
 
package 
{
	import org.flixel.*;

	public class HelpBox extends FlxSprite
	{
		[Embed(source="../data/tutorial/helpBox.png")] private var ImgHelp:Class;
		public var _helpString:String;
		
		
		private static const _actionString:String = "_Action";
		private static const _keyboardActionButton:String = Registry.p1Action;
		private static const _joystickActionButton:String = "X";
				
		private static const _jumpString:String = "_Jump";
		private static const _keyboardJumpButton:String = Registry.p1Jump;
		private static const _joystickJumpButton:String = "A";	
		
		private static const _switchString:String = "_Switch";
		private static const _keyboardSwitchButton:String = Registry.p1Switch;
		private static const _joystickSwitchButton:String = "B";
		
		private static const _piggyString:String = "_Piggy";
		private static const _keyboardPiggyButton:String = "Up or V";
		private static const _joystickPiggyButton:String = "Y";

		
		public function HelpBox(X:int,Y:int, HelpString:String)
		{
			super(X, Y);
			
			_helpString = HelpString;
			
			loadGraphic(ImgHelp, true, false, 120,60);			
			
			addAnimation("Idle", [0], 6 , true);
			
			play("Idle");
			
			this.immovable = true;
			
			this.localiseForInput();
			

		}
		
		private function localiseForInput():void
		{
			
			if (FlxG.usingJoystick) {
				_helpString = _helpString.replace(_actionString, _joystickActionButton);
				_helpString = _helpString.replace(_jumpString, _joystickJumpButton);
				_helpString = _helpString.replace(_switchString, _joystickSwitchButton);
				_helpString = _helpString.replace(_piggyString, _joystickPiggyButton);
			}
			else {
				_helpString = _helpString.replace(_actionString, _keyboardActionButton);
				_helpString = _helpString.replace(_jumpString, _keyboardJumpButton);
				_helpString = _helpString.replace(_switchString, _keyboardSwitchButton);
				_helpString = _helpString.replace(_piggyString, _keyboardPiggyButton);				
			}
		}

		override public function update():void
		{
			super.update();

		}
	}
}