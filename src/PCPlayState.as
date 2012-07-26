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
 * PCPlayState.as
 * Created On: 14/04/2012 11:17 AM
 */
 
package 
{
	import org.flixel.*;
	import flash.filesystem.*;  
    import flash.events.Event; 
	
	public class PCPlayState extends PlayState
	{		
		
		public var __levelOver:Boolean = false;
		
		override public function create():void
		{
			super.create();
			

			
			
			//FlxG.log("Players: " + Registry.playersNo);
			
			if (Registry.restartMusic == true) {
			
				//FlxG.log("playing music");
				
				
				if (Registry.levelType == 1) {
					//FlxG.playMusic(Registry.SndMega, 1.0);
				}
				else if (Registry.levelType == 2) {
					//FlxG.playMusic(Registry.SndIce, 1.0);
				}
				else if (Registry.levelType == 3) {
					//FlxG.playMusic(Registry.SndPirate, 1.0);
				}
			
			}
			
			else {
				
				
				
				FlxG.music.play(false);
			}
			
		}

		override public function update():void
		{
			super.update();
			
			if (FlxG.paused) {
				deathSound.active = false;
			}
			

			
			if (levelFinished) {
				levelOverCount += FlxG.elapsed;
			}
			
			if (__levelOver) {
				if (FlxG.keys.justPressed(Registry.p1Left) || FlxG.keys.justPressed(Registry.p1Right) || FlxG.joystick.j1Stick1LeftJustPressed  || FlxG.joystick.j1Stick1RightJustPressed) {
					
					FlxG.play(Registry.SndBlip, 0.6);
					
					if (restartBtn.status == FlxButton.HIGHLIGHT) {
						menuBtn.status = FlxButton.HIGHLIGHT;
						restartBtn.status = FlxButton.NORMAL;
					}
					else {
						restartBtn.status = FlxButton.HIGHLIGHT;
						menuBtn.status = FlxButton.NORMAL;
					}
					
					menuBtn.draw();
					restartBtn.draw();					
					
					menuBtn.update();
					restartBtn.update();
				}
				if (FlxG.keys.justPressed(Registry.p1Action) ||  FlxG.keys.justPressed(Registry.p1Switch) || FlxG.keys.justPressed(Registry.p1Jump) || FlxG.joystick.j1ButtonAJustPressed ) {
					if (restartBtn.status == FlxButton.HIGHLIGHT) {
						FlxG.play(Registry.SndPing, Registry.pingVolume);
						
						FlxG.paused = false;
						
						menuBtn.visible = false;
						restartBtn.visible = false;
						pauseInstructions.visible = false;
						Registry.canJump = false;
						
						Registry.levelNumber++;
						
						this.loadLevel();
						
						Registry.restartMusic = false;
						if (Registry.DEMO && Registry.levelNumber>=Registry.DEMO_numberOfLevelsInDemo) {
							FlxG.switchState(new PCLevelSelectState);
						}
						else {
							FlxG.switchState(new PCPlayState);
						}
					}
					else {
						FlxG.play(Registry.SndPing, Registry.pingVolume);
						
						super.goToMenu(true);
					}
				}
			}
		}
		
		override public function levelOver():void
		{
			//FlxG.log("You are a winner");
			
			if (levelFinished == false) {
				
				if (Registry.levelNumber!=12 && !Registry.oldSchoolMode) {
					restartBtn.label.text = "Next Level";
					restartBtn.highlightedText = "Next Level";
					restartBtn.regularText = "Next Level";
					
					restartBtn.visible = true;
					menuBtn.visible = true;		
					__levelOver = true;
				}
				
				player1.levelOver = true;
				player2.levelOver = true;
				
				var over:LevelCompleteGraphic = new LevelCompleteGraphic(0,0)
				add(over);
				over.x = FlxG.width / 2 - over.width / 2;
				over.y = FlxG.height / 2 - over.width / 2;
				
				if (!Registry.oldSchoolMode) {
					var save:FlxSave = new FlxSave();
					if(save.bind("SLF"))
					{
						var c:Array = new Array;
						var c1:Array = new Array;
						var c2:Array = new Array;
						var c3:Array = new Array;
						
						
						if (Registry.levelType == 1 && !Registry.hardCore) {
							
							c = save.data.warehouseLevelsComplete;
							c[Registry.levelNumber+1] = "1";
							save.data.warehouseLevelsComplete = c;
							
							if (hasCollectedCap) {
								c1 = save.data.warehouseCap;
								c1[Registry.levelNumber] = "1";
								save.data.warehouseCap = c1;
							}
							if (hasTalkedToEnemy) {
								c2 = save.data.warehouseLevelsTalk;
								c2[Registry.levelNumber] = "1";
								save.data.warehouseLevelsTalk = c2;
							}
							if (hasTalkedToAndre) {
								c3 = save.data.warehouseLevelsTalkAndre;
								c3[Registry.levelNumber] = "1";
								save.data.warehouseLevelsTalkAndre = c3;
								
							}
							
							
						}
						else if (Registry.levelType==1 && Registry.hardCore) {
							c = save.data.hcwarehouseLevelsComplete;
							c[Registry.levelNumber+1] = "1";
							save.data.hcwarehouseLevelsComplete = c;		
							
							if (hasCollectedCap) {
								c1 = save.data.hcwarehouseCap;
								c1[Registry.levelNumber] = "1";
								save.data.hcwarehouseCap = c1;
							}
							if (hasTalkedToEnemy) {
								c2 = save.data.hcwarehouseLevelsTalk;
								c2[Registry.levelNumber] = "1";
								save.data.hcwarehouseLevelsTalk = c2;
							}
							if (hasTalkedToAndre) {
								c3 = save.data.hcwarehouseLevelsTalkAndre;
								c3[Registry.levelNumber] = "1";
								save.data.hcwarehouseLevelsTalkAndre = c3;
								
							}
							
							
						}
						
						else if (Registry.levelType==2 && !Registry.hardCore){
							c = save.data.factoryLevelsComplete;
							c[Registry.levelNumber+1] = "1";
							save.data.factoryLevelsComplete = c;
							
							if (hasCollectedCap) {
								c1 = save.data.factoryCap;
								c1[Registry.levelNumber] = "1";
								save.data.factoryCap = c1;
							}
							if (hasTalkedToEnemy) {
								c2 = save.data.factoryLevelsTalk;
								c2[Registry.levelNumber] = "1";
								save.data.factoryLevelsTalk = c2;
							}
							if (hasTalkedToAndre) {
								c3 = save.data.factoryLevelsTalkAndre;
								c3[Registry.levelNumber] = "1";
								save.data.factoryLevelsTalkAndre = c3;
								
							}						
							
						}
						
						else if (Registry.levelType == 2 && Registry.hardCore){
							c = save.data.hcfactoryLevelsComplete;	
							c[Registry.levelNumber+1] = "1";
							save.data.hcfactoryLevelsComplete = c;		
							
							
							if (hasCollectedCap) {
								c1 = save.data.hcfactoryCap;
								c1[Registry.levelNumber] = "1";
								save.data.hcfactoryCap = c1;
							}
							if (hasTalkedToEnemy) {
								c2 = save.data.hcfactoryLevelsTalk;
								c2[Registry.levelNumber] = "1";
								save.data.hcfactoryLevelsTalk = c2;
							}
							if (hasTalkedToAndre) {
								c3 = save.data.hcfactoryLevelsTalkAndre;
								c3[Registry.levelNumber] = "1";
								save.data.hcfactoryLevelsTalkAndre = c3;
								
							}	
							
							
						}
							
						else if (Registry.levelType==3 && !Registry.hardCore){
							c = save.data.mgmtLevelsComplete;
							c[Registry.levelNumber+1] = "1";
							save.data.mgmtLevelsComplete = c;		
							
							
							if (hasCollectedCap) {
								c1 = save.data.mgmtCap;
								c1[Registry.levelNumber] = "1";
								save.data.mgmtCap = c1;
							}
							if (hasTalkedToEnemy) {
								c2 = save.data.mgmtLevelsTalk;
								c2[Registry.levelNumber] = "1";
								save.data.mgmtLevelsTalk = c2;
							}
							if (hasTalkedToAndre) {
								c3 = save.data.mgmtLevelsTalkAndre;
								c3[Registry.levelNumber] = "1";
								save.data.mgmtLevelsTalkAndre = c3;
								
							}							
							
							
						}
						else if (Registry.levelType==3 && Registry.hardCore){
							c = save.data.hcmgmtLevelsComplete;	
							c[Registry.levelNumber+1] = "1";
							save.data.hcmgmtLevelsComplete = c;	
							
							if (hasCollectedCap) {
								c1 = save.data.hcmgmtCap;
								c1[Registry.levelNumber] = "1";
								save.data.hcmgmtCap = c1;
							}
							if (hasTalkedToEnemy) {
								c2 = save.data.hcmgmtLevelsTalk;
								c2[Registry.levelNumber] = "1";
								save.data.hcmgmtLevelsTalk = c2;
							}
							if (hasTalkedToAndre) {
								c3 = save.data.hcmgmtLevelsTalkAndre;
								c3[Registry.levelNumber] = "1";
								save.data.hcmgmtLevelsTalkAndre = c3;
								
							}	
							
						}
						save.close();
					}
				}
			
				FlxG.music.pause();
				deathSound = FlxG.play(SndTagTone4, 1.0, false, true);
				levelFinished = true;
				
				player1._currentlyControlled = false;
				player2._currentlyControlled = false;
				
				this.saveFile();
				
			}
			//if (!deathSound.active ) {
			if (levelOverCount > 5.0 || !deathSound.active ) { //1.2 is good
				
				if (Registry.oldSchoolMode) {
					
					Registry.oldSchoolLivesM = _hud.mLives;
					Registry.oldSchoolLivesF = _hud.fLives;
					
					if (Registry.levelNumber <= 11)
						Registry.levelNumber++;
					else if (Registry.levelType == 3 && Registry.hardCore) {
						FlxG.switchState(new PCCinematicState);	
						
						return;							
					}	
					// increment level
					else {
						if (Registry.levelType == 1) Registry.levelType = 2;
						else if (Registry.levelType == 2) Registry.levelType = 3;
						else if (Registry.levelType == 3) {
							Registry.levelType = 1;
							Registry.hardCore = true;
						}

						
						
						Registry.levelNumber = 1;
					}
						
						
						
					this.loadLevel_oldSchoolMode();
					
					if (Registry.DEMO && Registry.levelNumber>=Registry.DEMO_numberOfLevelsInDemo + 1) {
						FlxG.switchState(new PCMenuState);
					}
					else {
						FlxG.switchState(new PCPlayState);	
					}
					
					return;
					
				}
				if (Registry.isPlayingCustomLevel == true) {
					FlxG.switchState(new PCCustomLevelState);
					return;
				}
				else if (Registry.isPlayingCustomLevel == false) {
					if (Registry.levelNumber!=12) {
						//Registry.levelNumber++;
						
						//FlxG.switchState(new PCLevelSelectState);
						
						return;
					}
					else if (Registry.levelNumber == 12) {
						if (Registry.levelType==1)
							Registry.level = XML(new Registry.LevelEndScene1);
						else if (Registry.levelType==2)
							Registry.level = XML(new Registry.LevelEndScene2);
						else if (Registry.levelType==3)
							Registry.level = XML(new Registry.LevelEndScene3);	
							
						FlxG.switchState(new PCCinematicState);
						return;
					}
				}

				
			}
		}
		
		public function replaceAt(s1:String, s2:String, ind:int):String {
			FlxG.log(s1);
			var arr:Array = s1.split("");
			FlxG.log(arr);
			arr.splice(ind, 1, s2);
			FlxG.log(arr);
			FlxG.log(arr.join(""));
			return arr.join("");
		}
		/*
		 * Saves the progress file without asking the location. 
		 */ 
		public function saveFile():void {  
			
/*			var f:PCOptionsState = new PCOptionsState();
			f.saveFile();*/
					
			var _wh:Array;
			var _ftry:Array;
			var _mgmt:Array;
			var _hcwh:Array;
			var _hcftry:Array;
			var _hcmgmt:Array;	
			
			var _whtalk:Array;
			var _ftrytalk:Array;
			var _mgmttalk:Array;
			var _hcwhtalk:Array;
			var _hcftrytalk:Array;
			var _hcmgmttalk:Array;
			
			var _whtalkandre:Array;
			var _ftrytalkandre:Array;
			var _mgmttalkandre:Array;
			var _hcwhtalkandre:Array;
			var _hcftrytalkandre:Array;
			var _hcmgmttalkandre:Array;	
			
			var _whcap:Array;
			var _ftrycap:Array;
			var _mgmtcap:Array;
			var _hcwhcap:Array;
			var _hcftrycap:Array;
			var _hcmgmtcap:Array;	
			
			var _plays:int;
		
			var save:FlxSave = new FlxSave();
			if(save.bind("SLF"))
			{
				_wh = save.data.warehouseLevelsComplete ;
				_ftry = save.data.factoryLevelsComplete ;
				_mgmt = save.data.mgmtLevelsComplete ;
				_hcwh = save.data.hcwarehouseLevelsComplete ;
				_hcftry = save.data.hcfactoryLevelsComplete ;
				_hcmgmt = save.data.hcmgmtLevelsComplete ;
				
				_whtalk = save.data.warehouseLevelsTalk ;
				_ftrytalk = save.data.factoryLevelsTalk ;
				_mgmttalk = save.data.mgmtLevelsTalk ;
				_hcwhtalk = save.data.hcwarehouseLevelsTalk ;
				_hcftrytalk = save.data.hcfactoryLevelsTalk ;
				_hcmgmttalk = save.data.hcmgmtLevelsTalk ;
				
				_whtalkandre = save.data.warehouseLevelsTalkAndre ;
				_ftrytalkandre = save.data.factoryLevelsTalkAndre ;
				_mgmttalkandre = save.data.mgmtLevelsTalkAndre ;
				_hcwhtalkandre = save.data.hcwarehouseLevelsTalkAndre ;
				_hcftrytalkandre = save.data.hcfactoryLevelsTalkAndre ;
				_hcmgmttalkandre = save.data.hcmgmtLevelsTalkAndre ;
				
				_whcap = save.data.warehouseCap ;
				_ftrycap = save.data.factoryCap ;
				_mgmtcap = save.data.mgmtCap ;
				_hcwhcap = save.data.hcwarehouseCap ;
				_hcftrycap = save.data.hcfactoryCap ;
				_hcmgmtcap = save.data.hcmgmtCap ;
				
				_plays = save.data.plays;
				
				save.close();
			}
			
			var export:String = (_wh + ".\n" + _ftry + ".\n" + _mgmt + ".\n" + _hcwh + ".\n" + _hcftry + ".\n" + _hcmgmt + ".\n" + _whtalk + ".\n" + _ftrytalk + ".\n" + _mgmttalk + ".\n" + _hcwhtalk + ".\n" + _hcftrytalk + ".\n" + _hcmgmttalk + ".\n" + _whtalkandre + ".\n" + _ftrytalkandre + ".\n" + _mgmttalkandre + ".\n" + _hcwhtalkandre + ".\n" + _hcftrytalkandre + ".\n" + _hcmgmttalkandre + ".\n" + _whcap + ".\n" + _ftrycap + ".\n" + _mgmtcap + ".\n" + _hcwhcap + ".\n" + _hcftrycap + ".\n" + _hcmgmtcap + ".\n" + "number of plays: " + _plays + ".\n  This file was going to be encoded with a hash and salted.\n    It wasn't. ");
			
			var file:File = File.userDirectory; 
			file=file.resolvePath("SUPERLEMONADEFACTORY/progress_backup.slf");  
			var fileStream:FileStream = new FileStream();  
			fileStream.open(file, FileMode.WRITE);  
			
			fileStream.writeUTFBytes(export);  
			
			fileStream.addEventListener(Event.CLOSE, fileClosed);  
			fileStream.close();
			
		}
		
		public function fileClosed(event:Event):void {  
			trace("closed event fired");  
		}
		
		protected function loadLevel():void
		{
			var l:int = Registry.levelNumber;
			if (Registry.levelType == 2) {
				l += 12;
			}
			else if (Registry.levelType == 3) {
				l += 24;
			}
			
			switch(l) {
				case 1:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.LevelCutscene1)):(Registry.level = XML(new Registry.HCLevel1)));
					break;
				case 2:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level2)):(Registry.level = XML(new Registry.HCLevel2)));
					break;				
				case 3:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level3)):(Registry.level = XML(new Registry.HCLevel3)));
					break;
				case 4:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level4)):(Registry.level = XML(new Registry.HCLevel4)));
					break;					
				case 5:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level5)):(Registry.level = XML(new Registry.HCLevel5)));
					break;
				case 6:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level6)):(Registry.level = XML(new Registry.HCLevel6)));
					break;				
				case 7:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level7)):(Registry.level = XML(new Registry.HCLevel7)));
					break;
				case 8:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level8)):(Registry.level = XML(new Registry.HCLevel8)));
					break;	
				case 9:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level9)):(Registry.level = XML(new Registry.HCLevel9)));
					break;
				case 10:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level10)):(Registry.level = XML(new Registry.HCLevel10)));
					break;
				case 11:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level11)):(Registry.level = XML(new Registry.HCLevel11)));
					break;
				case 12:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level12)):(Registry.level = XML(new Registry.HCLevel12)));
					break;				
				case 13:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.LevelCutscene2)):(Registry.level = XML(new Registry.HCLevel13)));
					break;
				case 14:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level14)):(Registry.level = XML(new Registry.HCLevel14)));
					break;					
				case 15:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level15)):(Registry.level = XML(new Registry.HCLevel15)));
					break;
				case 16:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level16)):(Registry.level = XML(new Registry.HCLevel16)));
					break;				
				case 17:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level17)):(Registry.level = XML(new Registry.HCLevel17)));
					break;
				case 18:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level18)):(Registry.level = XML(new Registry.HCLevel18)));
					break;	
				case 19:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level19)):(Registry.level = XML(new Registry.HCLevel19)));
					break;
				case 20:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level20)):(Registry.level = XML(new Registry.HCLevel20)));
					break;
				case 21:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level21)):(Registry.level = XML(new Registry.HCLevel21)));
					break;
				case 22:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level22)):(Registry.level = XML(new Registry.HCLevel22)));
					break;				
				case 23:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level23)):(Registry.level = XML(new Registry.HCLevel23)));
					break;
				case 24:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level24)):(Registry.level = XML(new Registry.HCLevel24)));
					break;					
				case 25:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.LevelCutscene3)):(Registry.level = XML(new Registry.HCLevel25)));
					break;
				case 26:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level26)):(Registry.level = XML(new Registry.HCLevel26)));
					break;				
				case 27:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level27)):(Registry.level = XML(new Registry.HCLevel27)));
					break;
				case 28:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level28)):(Registry.level = XML(new Registry.HCLevel28)));
					break;	
				case 29:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level29)):(Registry.level = XML(new Registry.HCLevel29)));
					break;
				case 30:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level30)):(Registry.level = XML(new Registry.HCLevel30)));
					break;
				case 31:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level31)):(Registry.level = XML(new Registry.HCLevel31)));
					break;
				case 32:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level32)):(Registry.level = XML(new Registry.HCLevel32)));
					break;				
				case 33:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level33)):(Registry.level = XML(new Registry.HCLevel33)));
					break;
				case 34:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level34)):(Registry.level = XML(new Registry.HCLevel34)));
					break;					
				case 35:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level35)):(Registry.level = XML(new Registry.HCLevel35)));
					break;
				case 36:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level36)):(Registry.level = XML(new Registry.HCLevel36)));
					break;					
			}
		}
		
		protected function loadLevel_oldSchoolMode():void
		{
			var l:int = Registry.levelNumber;
			if (Registry.levelType == 2) {
				l += 12;
			}
			else if (Registry.levelType == 3) {
				l += 24;
			}
			
			switch(l) {
				case 1:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level1)):(Registry.level = XML(new Registry.HCLevel1)));
					break;
				case 2:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level2)):(Registry.level = XML(new Registry.HCLevel2)));
					break;				
				case 3:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level3)):(Registry.level = XML(new Registry.HCLevel3)));
					break;
				case 4:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level4)):(Registry.level = XML(new Registry.HCLevel4)));
					break;					
				case 5:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level5)):(Registry.level = XML(new Registry.HCLevel5)));
					break;
				case 6:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level6)):(Registry.level = XML(new Registry.HCLevel6)));
					break;				
				case 7:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level7)):(Registry.level = XML(new Registry.HCLevel7)));
					break;
				case 8:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level8)):(Registry.level = XML(new Registry.HCLevel8)));
					break;	
				case 9:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level9)):(Registry.level = XML(new Registry.HCLevel9)));
					break;
				case 10:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level10)):(Registry.level = XML(new Registry.HCLevel10)));
					break;
				case 11:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level11)):(Registry.level = XML(new Registry.HCLevel11)));
					break;
				case 12:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level12)):(Registry.level = XML(new Registry.HCLevel12)));
					break;				
				case 13:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level13)):(Registry.level = XML(new Registry.HCLevel13)));
					break;
				case 14:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level14)):(Registry.level = XML(new Registry.HCLevel14)));
					break;					
				case 15:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level15)):(Registry.level = XML(new Registry.HCLevel15)));
					break;
				case 16:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level16)):(Registry.level = XML(new Registry.HCLevel16)));
					break;				
				case 17:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level17)):(Registry.level = XML(new Registry.HCLevel17)));
					break;
				case 18:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level18)):(Registry.level = XML(new Registry.HCLevel18)));
					break;	
				case 19:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level19)):(Registry.level = XML(new Registry.HCLevel19)));
					break;
				case 20:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level20)):(Registry.level = XML(new Registry.HCLevel20)));
					break;
				case 21:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level21)):(Registry.level = XML(new Registry.HCLevel21)));
					break;
				case 22:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level22)):(Registry.level = XML(new Registry.HCLevel22)));
					break;				
				case 23:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level23)):(Registry.level = XML(new Registry.HCLevel23)));
					break;
				case 24:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level24)):(Registry.level = XML(new Registry.HCLevel24)));
					break;					
				case 25:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level25)):(Registry.level = XML(new Registry.HCLevel25)));
					break;
				case 26:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level26)):(Registry.level = XML(new Registry.HCLevel26)));
					break;				
				case 27:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level27)):(Registry.level = XML(new Registry.HCLevel27)));
					break;
				case 28:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level28)):(Registry.level = XML(new Registry.HCLevel28)));
					break;	
				case 29:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level29)):(Registry.level = XML(new Registry.HCLevel29)));
					break;
				case 30:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level30)):(Registry.level = XML(new Registry.HCLevel30)));
					break;
				case 31:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level31)):(Registry.level = XML(new Registry.HCLevel31)));
					break;
				case 32:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level32)):(Registry.level = XML(new Registry.HCLevel32)));
					break;				
				case 33:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level33)):(Registry.level = XML(new Registry.HCLevel33)));
					break;
				case 34:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level34)):(Registry.level = XML(new Registry.HCLevel34)));
					break;					
				case 35:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level35)):(Registry.level = XML(new Registry.HCLevel35)));
					break;
				case 36:
					((Registry.hardCore == 0)?(Registry.level = XML(new Registry.Level36)):(Registry.level = XML(new Registry.HCLevel36)));
					break;					
			}
		}		
		
	}
}