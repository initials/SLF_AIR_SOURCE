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
 * HUD.as
 * Created On: 1/05/2012 10:36 PM
 */
 
package 
{
	import org.flixel.*;

	public class HUD extends FlxGroup
	{
		[Embed(source = "../data/HUD/currentChar.png")] private var ImgChars:Class;
		[Embed(source = "../data/HUD/heart.png")] private var ImgHeart:Class;
		
		private var mHeart:FlxSprite;
		private var fHeart:FlxSprite;	
		
		private var mHeart2:FlxSprite;
		private var fHeart2:FlxSprite;		
		private var mHeart3:FlxSprite;
		private var fHeart3:FlxSprite;
		private var currentChar:FlxSprite;
		
		public var mLives:int;
		public var fLives:int;
		public var currentCharacter:String;
		
	
		public function HUD()
		{
			super();
			
			fLives = 1;
			mLives = 1;
			

			
			currentCharacter = "m";
			
			currentChar = new FlxSprite(0, 0, ImgChars);
			currentChar.loadGraphic(ImgChars, true, false, 14, 28);					
			currentChar.addAnimation("m_selected", [0], 0 , false);
			currentChar.addAnimation("f_selected", [1], 0 , false);
			currentChar.addAnimation("both_selected", [0,1,2], 24 , true);
			currentChar.play("m_selected");
			currentChar.scrollFactor.x = currentChar.scrollFactor.y = 0;
			add(currentChar);
			
			
			
			mHeart = new FlxSprite(16, 2, ImgHeart);
			mHeart.scrollFactor.x = mHeart.scrollFactor.y = 0;
			add(mHeart);
			
			fHeart = new FlxSprite(16, 18, ImgHeart);
			fHeart.scrollFactor.x = fHeart.scrollFactor.y = 0;
			add(fHeart);
			
			if (Registry.oldSchoolMode) {
				fLives = Registry.oldSchoolLivesF;
				mLives = Registry.oldSchoolLivesM;
				
				mHeart2 = new FlxSprite(24, 2, ImgHeart);
				mHeart2.scrollFactor.x = mHeart2.scrollFactor.y = 0;
				add(mHeart2);
				
				fHeart2 = new FlxSprite(24, 18, ImgHeart);
				fHeart2.scrollFactor.x = fHeart2.scrollFactor.y = 0;
				add(fHeart2);
				
				mHeart3 = new FlxSprite(32, 2, ImgHeart);
				mHeart3.scrollFactor.x = mHeart3.scrollFactor.y = 0;
				add(mHeart3);
				
				fHeart3 = new FlxSprite(32, 18, ImgHeart);
				fHeart3.scrollFactor.x = fHeart3.scrollFactor.y = 0;
				add(fHeart3);
			
			
			}
			
			
			
			
		}

		override public function update():void
		{
			if (mLives >= 1) {
				mHeart.visible = true;
			}
			else {
				mHeart.visible = false;
			}
			if (fLives >= 1) {
				fHeart.visible = true;
			}
			else {
				fHeart.visible = false;
			}
			
			
			
			if (Registry.oldSchoolMode) {
				if (mLives >= 3) {
					mHeart.visible = true;
					mHeart2.visible = true;
					mHeart3.visible = true;
				}
				else if (mLives == 2) {
					mHeart.visible = true;
					mHeart2.visible = true;
					mHeart3.visible = false;					
				}
				else if (mLives == 1) {
					mHeart.visible = true;
					mHeart2.visible = false;
					mHeart3.visible = false;					
				}				
				else if (mLives == 0) {
					mHeart.visible = false;
					mHeart2.visible = false;
					mHeart3.visible = false;					
				}	
				
				if (fLives >= 3) {
					fHeart.visible = true;
					fHeart2.visible = true;
					fHeart3.visible = true;
				}
				else if (fLives == 2) {
					fHeart.visible = true;
					fHeart2.visible = true;
					fHeart3.visible = false;					
				}
				else if (fLives == 1) {
					fHeart.visible = true;
					fHeart2.visible = false;
					fHeart3.visible = false;					
				}				
				else if (fLives == 0) {
					fHeart.visible = false;
					fHeart2.visible = false;
					fHeart3.visible = false;					
				}
				
				
			}
			
			
			
			if (currentCharacter == "m") {
				currentChar.play("m_selected", true);
			}
			else if (currentCharacter == "f") {
				currentChar.play("f_selected", true);
			}
			
			
			super.update();

		}
		
		
		
	}
}