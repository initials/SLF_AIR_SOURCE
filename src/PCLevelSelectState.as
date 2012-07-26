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
 * PCLevelSelectState.as
 * Created On: 14/04/2012 11:26 AM
 */
 
package 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class PCLevelSelectState extends FlxState
	{
		
		public var buttonsGroup:FlxGroup;
		
		public var warehouseBtn:FlxButton;
		public var factoryBtn:FlxButton;
		public var mgmtBtn:FlxButton;
		
		public var level1Btn:FlxButton;
		public var level2Btn:FlxButton;
		public var level3Btn:FlxButton;
		public var level4Btn:FlxButton;
		public var level5Btn:FlxButton;
		public var level6Btn:FlxButton;
		public var level7Btn:FlxButton;
		public var level8Btn:FlxButton;
		public var level9Btn:FlxButton;
		public var level10Btn:FlxButton;
		public var level11Btn:FlxButton;
		public var level12Btn:FlxButton;
		
		public var backBtn:FlxButton;
		public var hardCoreBtn:FlxButton;
		
		public var ping:FlxSound;
		
		public var _wh:Array;
		public var _ftry:Array;
		public var _mgmt:Array;
		public var _hcwh:Array;
		public var _hcftry:Array;
		public var _hcmgmt:Array;		
		
		public var _whtalk:Array;
		public var _ftrytalk:Array;
		public var _mgmttalk:Array;
		public var _hcwhtalk:Array;
		public var _hcftrytalk:Array;
		public var _hcmgmttalk:Array;
		
		public var _whtalkandre:Array;
		public var _ftrytalkandre:Array;
		public var _mgmttalkandre:Array;
		public var _hcwhtalkandre:Array;
		public var _hcftrytalkandre:Array;
		public var _hcmgmttalkandre:Array;	
		
		public var _whcap:Array;
		public var _ftrycap:Array;
		public var _mgmtcap:Array;
		public var _hcwhcap:Array;
		public var _hcftrycap:Array;
		public var _hcmgmtcap:Array;	
		
		public var whIconsGrp:FlxGroup;
		public var faIconsGrp:FlxGroup;
		public var mgIconsGrp:FlxGroup;
		public var xwhIconsGrp:FlxGroup;
		public var xfaIconsGrp:FlxGroup;
		public var xmgIconsGrp:FlxGroup;
		
		public var bgBags:FlxSprite;
		public var bgShelf:FlxSprite;
		public var headingTxt:FlxText;
		
		[Embed(source = "../data/level1/sugarBagsAndCrates.png")] private var ImgSugarBagsAndCrate:Class;
		[Embed(source = "../data/level1/L1_Shelf.png")] private var ImgShelf:Class;
		
		override public function create():void
		{
			
			Registry.restartMusic = true;
			
			Registry.oldSchoolMode = false;
			fading = false;
			FlxG.paused = false;
			
			FlxG.bgColor = 0xffF8CB8F;
			
			//	Make the gradient retro looking and "chunky" with the chucnkSize parameter (here set to 4)
			var gradient2:FlxSprite = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [0xffcac5ac, 0xffdedbc3 , 0xffdfdcc4], 10 ); //0xffd6d3ba
			gradient2.x = 0;
			gradient2.y = 0;
			add(gradient2);
			
			bgBags = new FlxSprite(FlxG.width * 1.5, 0, ImgSugarBagsAndCrate);
			bgBags.y = FlxG.height - bgBags.height;
			add(bgBags);
			bgBags.drag.x = 300;
			bgBags.velocity.x = -500;
			
			bgShelf = new FlxSprite(110, 110, ImgShelf);
			bgShelf.x = FlxG.width - bgShelf.width;			
			bgShelf.y = FlxG.height - bgShelf.height;
			add(bgShelf);
			bgShelf.drag.x = 300;
			bgShelf.velocity.x = -400;
			
			headingTxt = new FlxText(0, 8, FlxG.width, "Level Select", true);
			headingTxt.color = 0xff8000FF;
			headingTxt.size = 8;
			headingTxt.alignment = "center";
			add(headingTxt);
			
			if (Registry.mouseEnabled) {
				FlxG.mouse.show();
			}
			else if (!Registry.mouseEnabled) {
				FlxG.mouse.hide();
			}
			
			
			
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
				
				if (Registry.DEMO) {
					//close off levels 3-12
					for (var i2:int = 3; i2 < 13; i2++) {
						_wh[i2] = 0;
						_ftry[i2] = 0;
						_mgmt[i2] = 0;
						
					}
					//close off all hardcore levels
					for (i2 = 1; i2 < 13; i2++) {
						_hcwh[i2] = 0;
						_hcftry[i2] = 0;
						_hcmgmt[i2] = 0;	
						
					}
					
				}
				
				
				
				save.close();
			}
			
			
			
			//FlxG.log("PROGRESS: " + _wh + ".\n" + _ftry + ".\n" + _mgmt + ".\n" + _hcwh + ".\n" + _hcftry + ".\n" + _hcmgmt + ".\n" + _whtalk + ".\n" + _ftrytalk + ".\n" + _mgmttalk + ".\n" + _hcwhtalk + ".\n" + _hcftrytalk + ".\n" + _hcmgmttalk + ".\n" + _whtalkandre + ".\n" + _ftrytalkandre + ".\n" + _mgmttalkandre + ".\n" + _hcwhtalkandre + ".\n" + _hcftrytalkandre + ".\n" + _hcmgmttalkandre + ".\n" + _whcap + ".\n" + _ftrycap + ".\n" + _mgmtcap + ".\n" + _hcwhcap + ".\n" + _hcftrycap + ".\n" + _hcmgmtcap + ".\n" );
			
			
			
			
			ping = new FlxSound();
			ping.loadEmbedded(Registry.SndBlip);
			ping.volume = 0.5;
			
			
			buttonsGroup = new FlxGroup();
			
			warehouseBtn = new FlxButton(Registry.xPos1, Registry.yPos1 , "Warehouse", setLevelType1);
			warehouseBtn.soundOver = ping;
			warehouseBtn.color = Registry.WAREHOUSE_PURPLE;
			warehouseBtn.label.color = 0xffffff;
			buttonsGroup.add(warehouseBtn);
			
			warehouseBtn.status = FlxButton.HIGHLIGHT;
			
			factoryBtn = new FlxButton(Registry.xPos2,Registry.yPos1 , "Factory", this.setLevelType2);
			factoryBtn.soundOver = ping;
			factoryBtn.color = Registry.FACTORY_GREEN;
			factoryBtn.label.color = 0xffffff;
			buttonsGroup.add(factoryBtn);	
			
			mgmtBtn = new FlxButton(Registry.xPos3,  Registry.yPos1 , "Management", this.setLevelType3);
			mgmtBtn.soundOver = ping;
			mgmtBtn.color = Registry.MGMT_BROWN;
			mgmtBtn.label.color = 0xffffff;
			buttonsGroup.add(mgmtBtn);	
			
			
			level1Btn = new FlxButton(Registry.xPos1,  Registry.yPos2 , "Level 1", this.onBtnLevel1);
			level1Btn.soundOver = ping;
			level1Btn.color = Registry.WAREHOUSE_PURPLE;
			level1Btn.label.color = 0xffffff;
			buttonsGroup.add(level1Btn);			
			
			level2Btn = new FlxButton(Registry.xPos2,  Registry.yPos2 , "Level 2", this.onBtnLevel2);
			level2Btn.soundOver = ping;
			level2Btn.color = Registry.WAREHOUSE_PURPLE;
			level2Btn.label.color = 0xffffff;
			buttonsGroup.add(level2Btn);			
			
			level3Btn = new FlxButton(Registry.xPos3,  Registry.yPos2 , "Level 3", this.onBtnLevel3);
			level3Btn.soundOver = ping;
			level3Btn.color = Registry.WAREHOUSE_PURPLE;
			level3Btn.label.color = 0xffffff;
			buttonsGroup.add(level3Btn);

			level4Btn = new FlxButton(Registry.xPos1,  Registry.yPos3 , "Level 4", this.onBtnLevel4);
			level4Btn.soundOver = ping;
			level4Btn.color = Registry.WAREHOUSE_PURPLE;
			level4Btn.label.color = 0xffffff;
			buttonsGroup.add(level4Btn);			
			
			level5Btn = new FlxButton(Registry.xPos2,  Registry.yPos3 , "Level 5", this.onBtnLevel5);
			level5Btn.soundOver = ping;
			level5Btn.color = Registry.WAREHOUSE_PURPLE;
			level5Btn.label.color = 0xffffff;
			buttonsGroup.add(level5Btn);			
			
			level6Btn = new FlxButton(Registry.xPos3,  Registry.yPos3 , "Level 6", this.onBtnLevel6);
			level6Btn.soundOver = ping;
			level6Btn.color = Registry.WAREHOUSE_PURPLE;
			level6Btn.label.color = 0xffffff;
			buttonsGroup.add(level6Btn);
			
			level7Btn = new FlxButton(Registry.xPos1,  Registry.yPos4 , "Level 7", this.onBtnLevel7);
			level7Btn.soundOver = ping;
			level7Btn.color = Registry.WAREHOUSE_PURPLE;
			level7Btn.label.color = 0xffffff;
			buttonsGroup.add(level7Btn);			
			
			level8Btn = new FlxButton(Registry.xPos2,  Registry.yPos4 , "Level 8", this.onBtnLevel8);
			level8Btn.soundOver = ping;
			level8Btn.color = Registry.WAREHOUSE_PURPLE;
			level8Btn.label.color = 0xffffff;
			buttonsGroup.add(level8Btn);			
			
			level9Btn = new FlxButton(Registry.xPos3,  Registry.yPos4 , "Level 9", this.onBtnLevel9);
			level9Btn.soundOver = ping;
			level9Btn.color = Registry.WAREHOUSE_PURPLE;
			level9Btn.label.color = 0xffffff;
			buttonsGroup.add(level9Btn);

			level10Btn = new FlxButton(Registry.xPos1,  Registry.yPos5 , "Level 10", this.onBtnLevel10);
			level10Btn.soundOver = ping;
			level10Btn.color = Registry.WAREHOUSE_PURPLE;
			level10Btn.label.color = 0xffffff;
			buttonsGroup.add(level10Btn);			
			
			level11Btn = new FlxButton(Registry.xPos2,  Registry.yPos5 , "Level 11", this.onBtnLevel11);
			level11Btn.soundOver = ping;
			level11Btn.color = Registry.WAREHOUSE_PURPLE;
			level11Btn.label.color = 0xffffff;
			buttonsGroup.add(level11Btn);			
			
			level12Btn = new FlxButton(Registry.xPos3,  Registry.yPos5 , "Level 12", this.onBtnLevel12);
			level12Btn.soundOver = ping;
			level12Btn.color = Registry.WAREHOUSE_PURPLE;
			level12Btn.label.color = 0xffffff;
			buttonsGroup.add(level12Btn);			
			
			backBtn = new FlxButton(Registry.xPos1,  Registry.yPos6 , "back", this.onQuit);
			backBtn.soundOver = ping;
			backBtn.color = Registry.WAREHOUSE_PURPLE;
			backBtn.label.color = 0xffffff;
			buttonsGroup.add(backBtn);			
			
			hardCoreBtn = new FlxButton(Registry.xPos2,  Registry.yPos6 , "hardcore", this.hardCore);
			hardCoreBtn.soundOver = ping;
			hardCoreBtn.color = Registry.WAREHOUSE_PURPLE;
			hardCoreBtn.label.color = 0xffffff;
			buttonsGroup.add(hardCoreBtn);			
			
			
			add(buttonsGroup);
			
			whIconsGrp = new FlxGroup();
			faIconsGrp = new FlxGroup();
			mgIconsGrp = new FlxGroup();
			xwhIconsGrp = new FlxGroup();
			xfaIconsGrp = new FlxGroup();
			xmgIconsGrp = new FlxGroup();
		
			
			// add icons for caps, talked to, and talked to enemy
			
			var xoffset:int = 34;
			var yoffset:int = -20;
			
			var spr:AchievementIcon;
			for (var i:int = 1; i < 13; i++) { 
				
				if (_whcap[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x,this["level" + i.toString() + "Btn"].y+yoffset);
					whIconsGrp.add(spr);
				}
				
				if (_ftrycap[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("fa");
					faIconsGrp.add(spr);
				}				
				
				if (_mgmtcap[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("mg");
					mgIconsGrp.add(spr);
				}
				
				
				
				if (_whtalk[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("te");
					whIconsGrp.add(spr);
				}
				
				if (_ftrytalk[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("te");
					faIconsGrp.add(spr);
				}				
				
				if (_mgmttalk[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("te");
					mgIconsGrp.add(spr);
				}		
				
				
				
				
				if (_whtalkandre[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset*2,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("ta");
					whIconsGrp.add(spr);
				}
				
				if (_ftrytalkandre[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset*2,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("ta");
					faIconsGrp.add(spr);
				}				
				
				if (_mgmttalkandre[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset*2,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("ta");
					mgIconsGrp.add(spr);
				}
				
				
				
				
				
				//hard core 
				
				if (_hcwhcap[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("xwh");
					xwhIconsGrp.add(spr);
				}
				
				if (_hcftrycap[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("xfa");
					xfaIconsGrp.add(spr);
				}				
				
				if (_hcmgmtcap[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("xmg");
					xmgIconsGrp.add(spr);
				}
				
				
				
				if (_hcwhtalk[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("te");
					xwhIconsGrp.add(spr);
				}
				
				if (_hcftrytalk[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("te");
					xfaIconsGrp.add(spr);
				}				
				
				if (_hcmgmttalk[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("te");
					xmgIconsGrp.add(spr);
				}		
				
				
				
				
				if (_hcwhtalkandre[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset*2,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("ta");
					xwhIconsGrp.add(spr);
				}
				
				if (_hcftrytalkandre[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset*2,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("ta");
					xfaIconsGrp.add(spr);
				}				
				
				if (_hcmgmttalkandre[i] == 1) {
					spr = new AchievementIcon(this["level" + i.toString() + "Btn"].x+xoffset*2,this["level" + i.toString() + "Btn"].y+yoffset);
					spr.play("ta");
					xmgIconsGrp.add(spr);
				}
			}
				
			add(whIconsGrp);
			add(faIconsGrp);
			add(mgIconsGrp);
			add(xwhIconsGrp);
			add(xfaIconsGrp);
			add(xmgIconsGrp);
			
			faIconsGrp.visible=false;
			mgIconsGrp.visible=false;
			xwhIconsGrp.visible=false;
			xfaIconsGrp.visible=false;
			xmgIconsGrp.visible=false;			
			
			
			
			if (Registry.levelType == 1) {
				currentButton = 0;
			}
			else if (Registry.levelType == 2) {
				currentButton = 1;
			}
			else if (Registry.levelType == 3) {
				currentButton = 2;
			}	
			
			this.switchWorld();
			
			if (Registry.levelNumber == 1) {
				currentButton = 3;
			}
			else if (Registry.levelNumber == 2) {
				currentButton = 4;
			}
			else if (Registry.levelNumber == 3) {
				currentButton = 5;
			}			
			else if (Registry.levelNumber == 4) {
				currentButton = 6;
			}
			else if (Registry.levelNumber == 5) {
				currentButton = 7;
			}
			else if (Registry.levelNumber == 6) {
				currentButton = 8;
			}			
			else if (Registry.levelNumber == 7) {
				currentButton = 9;
			}
			else if (Registry.levelNumber == 8) {
				currentButton = 10;
			}			
			else if (Registry.levelNumber == 9) {
				currentButton = 11;
			}
			else if (Registry.levelNumber == 10) {
				currentButton = 12;
			}
			else if (Registry.levelNumber == 11) {
				currentButton = 13;
			}			
			else if (Registry.levelNumber == 12) {
				currentButton = 14;
			}			
			
			if (Registry.hardCore) this.hardCore(false,false);
			
			
			
			if (Registry.DEMO) {
				headingTxt.text = "--DEMO MODE--  -- Levels 3 to 12 Locked  -- " + headingTxt.text;
				
				
				
			}
			

				
				
		}

		override public function update():void
		{
			if (!fading && !FlxG.mouse.visible)
				this.handleButtons();
				
			if ( (FlxG.keys.justPressed(Registry.homeKey) || FlxG.joystick.j1ButtonBackJustPressed) && !fading) {
				onQuit();			
				
			}
			
				
			super.update();

		}
		
		public function handleButtons():void {

			if (FlxG.keys.justPressed(Registry.p1Down) || FlxG.joystick.j1Stick1DownJustPressed ) {
				currentButton+=3;
				FlxG.play(Registry.SndBlip, 0.3);
				
			}
			else if (FlxG.keys.justPressed(Registry.p1Up) || FlxG.joystick.j1Stick1UpJustPressed ) {
				currentButton-=3;
				FlxG.play(Registry.SndBlip, 0.3);
			}
			
			else if ( FlxG.keys.justPressed(Registry.p1Right) || FlxG.joystick.j1Stick1RightJustPressed) {
				currentButton++;
				FlxG.play(Registry.SndBlip, 0.3);
				
			}
			else if (FlxG.keys.justPressed(Registry.p1Left) || FlxG.joystick.j1Stick1LeftJustPressed ) {
				currentButton--;
				FlxG.play(Registry.SndBlip, 0.3);
			}
			
			
			if (FlxG.keys.justPressed(Registry.p1Action) ||  FlxG.keys.justPressed(Registry.p1Switch) || FlxG.keys.justPressed(Registry.p1Jump) || FlxG.joystick.j1ButtonAJustPressed ) {
				
				if (currentButton==0 )
					this.setLevelType1();
				else if (currentButton == 1)
					this.setLevelType2();
				else if (currentButton == 2)
					this.setLevelType3();
				else if (currentButton==16)
					this.hardCore();
					
				else
					this.beginFade();
			}
			
			if (currentButton < 0) {
				currentButton = buttonsGroup.length-1;
			}
			else if (currentButton > buttonsGroup.length-1) {
				currentButton = 0;
			}
			
			
			for (var i:int = 0; i < buttonsGroup.length; i++) { 
				if (i == currentButton) {
					(buttonsGroup.members[i] as FlxButton).status = FlxButton.HIGHLIGHT;
					
					
				}
				else {
					(buttonsGroup.members[i] as FlxButton).status = FlxButton.NORMAL;
				}
			}
			
			
		}
		
		protected function setLevelType1():void
		{
			FlxG.play(Registry.SndPing, 0.5);
			Registry.levelType = 1;
			this.switchWorld();
		}
		protected function setLevelType2():void
		{
			FlxG.play(Registry.SndPing, 0.5);			
			Registry.levelType = 2;
			this.switchWorld();
		}
		protected function setLevelType3():void
		{
			FlxG.play(Registry.SndPing, 0.5);			
			Registry.levelType = 3;
			this.switchWorld();
		}		
		
		
		
		protected function switchWorld():void
		{
			var progress:Array;
			
			switch(Registry.levelType) {
				case 1:
					//Registry.levelType = 1;
					backBtn.color = Registry.WAREHOUSE_PURPLE;
					hardCoreBtn.color = Registry.WAREHOUSE_PURPLE;
					
					if (!Registry.hardCore) {
						progress = _wh;
						
						whIconsGrp.visible = true;
						faIconsGrp.visible=false;
						mgIconsGrp.visible=false;
						xwhIconsGrp.visible=false;
						xfaIconsGrp.visible=false;
						xmgIconsGrp.visible=false;						
						
					}
					
					else {
						progress = _hcwh;
						
						whIconsGrp.visible = false;
						faIconsGrp.visible=false;
						mgIconsGrp.visible=false;
						xwhIconsGrp.visible=true;
						xfaIconsGrp.visible=false;
						xmgIconsGrp.visible=false;
					}
					
					((progress[1] == "1") ? (level1Btn.color = Registry.WAREHOUSE_PURPLE) : (level1Btn.color = Registry.GREY));
					((progress[2] == "1") ? (level2Btn.color = Registry.WAREHOUSE_PURPLE) : (level2Btn.color = Registry.GREY));
					((progress[3] == "1") ? (level3Btn.color = Registry.WAREHOUSE_PURPLE) : (level3Btn.color = Registry.GREY));
					((progress[4] == "1") ? (level4Btn.color = Registry.WAREHOUSE_PURPLE) : (level4Btn.color = Registry.GREY));
					((progress[5] == "1") ? (level5Btn.color = Registry.WAREHOUSE_PURPLE) : (level5Btn.color = Registry.GREY));
					((progress[6] == "1") ? (level6Btn.color = Registry.WAREHOUSE_PURPLE) : (level6Btn.color = Registry.GREY));
					((progress[7] == "1") ? (level7Btn.color = Registry.WAREHOUSE_PURPLE) : (level7Btn.color = Registry.GREY));
					((progress[8] == "1") ? (level8Btn.color = Registry.WAREHOUSE_PURPLE) : (level8Btn.color = Registry.GREY));
					((progress[9] == "1") ? (level9Btn.color = Registry.WAREHOUSE_PURPLE) : (level9Btn.color = Registry.GREY));
					((progress[10] == "1") ? (level10Btn.color = Registry.WAREHOUSE_PURPLE) : (level10Btn.color = Registry.GREY));
					((progress[11] == "1") ? (level11Btn.color = Registry.WAREHOUSE_PURPLE) : (level11Btn.color = Registry.GREY));
					((progress[12] == "1") ? (level12Btn.color = Registry.WAREHOUSE_PURPLE) : (level12Btn.color = Registry.GREY));
					
					break;
				case 2:
					//Registry.levelType = 2;
					
					if (!Registry.hardCore) {
						progress = _ftry;
						
						whIconsGrp.visible = false;
						faIconsGrp.visible=true;
						mgIconsGrp.visible=false;
						xwhIconsGrp.visible=false;
						xfaIconsGrp.visible=false;
						xmgIconsGrp.visible = false;
						
					}
					else {
						progress = _hcftry;
						
						whIconsGrp.visible = false;
						faIconsGrp.visible=false;
						mgIconsGrp.visible=false;
						xwhIconsGrp.visible=false;
						xfaIconsGrp.visible=true;
						xmgIconsGrp.visible = false;
						
					}
					
					((progress[1] == "1") ? (level1Btn.color = Registry.FACTORY_GREEN) : (level1Btn.color = Registry.GREY));
					((progress[2] == "1") ? (level2Btn.color = Registry.FACTORY_GREEN) : (level2Btn.color = Registry.GREY));
					((progress[3] == "1") ? (level3Btn.color = Registry.FACTORY_GREEN) : (level3Btn.color = Registry.GREY));
					((progress[4] == "1") ? (level4Btn.color = Registry.FACTORY_GREEN) : (level4Btn.color = Registry.GREY));
					((progress[5] == "1") ? (level5Btn.color = Registry.FACTORY_GREEN) : (level5Btn.color = Registry.GREY));
					((progress[6] == "1") ? (level6Btn.color = Registry.FACTORY_GREEN) : (level6Btn.color = Registry.GREY));
					((progress[7] == "1") ? (level7Btn.color = Registry.FACTORY_GREEN) : (level7Btn.color = Registry.GREY));
					((progress[8] == "1") ? (level8Btn.color = Registry.FACTORY_GREEN) : (level8Btn.color = Registry.GREY));
					((progress[9] == "1") ? (level9Btn.color = Registry.FACTORY_GREEN) : (level9Btn.color = Registry.GREY));
					((progress[10] == "1") ? (level10Btn.color = Registry.FACTORY_GREEN) : (level10Btn.color = Registry.GREY));
					((progress[11] == "1") ? (level11Btn.color = Registry.FACTORY_GREEN) : (level11Btn.color = Registry.GREY));
					((progress[12] == "1") ? (level12Btn.color = Registry.FACTORY_GREEN) : (level12Btn.color = Registry.GREY));
					
					backBtn.color = Registry.FACTORY_GREEN;
					hardCoreBtn.color = Registry.FACTORY_GREEN;
					break;		
				case 3:
					//Registry.levelType = 3;
					
					if (!Registry.hardCore) {
						progress = _mgmt;
						
						whIconsGrp.visible = false;
						faIconsGrp.visible=false;
						mgIconsGrp.visible=true;
						xwhIconsGrp.visible=false;
						xfaIconsGrp.visible=false;
						xmgIconsGrp.visible = false;						
					}
					else {
						progress = _hcmgmt;
						
						whIconsGrp.visible = false;
						faIconsGrp.visible=false;
						mgIconsGrp.visible=false;
						xwhIconsGrp.visible=false;
						xfaIconsGrp.visible=false;
						xmgIconsGrp.visible = true;						
					}
					
					((progress[1] == "1") ? (level1Btn.color = Registry.MGMT_BROWN) : (level1Btn.color = Registry.GREY));
					((progress[2] == "1") ? (level2Btn.color = Registry.MGMT_BROWN) : (level2Btn.color = Registry.GREY));
					((progress[3] == "1") ? (level3Btn.color = Registry.MGMT_BROWN) : (level3Btn.color = Registry.GREY));
					((progress[4] == "1") ? (level4Btn.color = Registry.MGMT_BROWN) : (level4Btn.color = Registry.GREY));
					((progress[5] == "1") ? (level5Btn.color = Registry.MGMT_BROWN) : (level5Btn.color = Registry.GREY));
					((progress[6] == "1") ? (level6Btn.color = Registry.MGMT_BROWN) : (level6Btn.color = Registry.GREY));
					((progress[7] == "1") ? (level7Btn.color = Registry.MGMT_BROWN) : (level7Btn.color = Registry.GREY));
					((progress[8] == "1") ? (level8Btn.color = Registry.MGMT_BROWN) : (level8Btn.color = Registry.GREY));
					((progress[9] == "1") ? (level9Btn.color = Registry.MGMT_BROWN) : (level9Btn.color = Registry.GREY));
					((progress[10] == "1") ? (level10Btn.color = Registry.MGMT_BROWN) : (level10Btn.color = Registry.GREY));
					((progress[11] == "1") ? (level11Btn.color = Registry.MGMT_BROWN) : (level11Btn.color = Registry.GREY));
					((progress[12] == "1") ? (level12Btn.color = Registry.MGMT_BROWN) : (level12Btn.color = Registry.GREY));
					
					backBtn.color = Registry.MGMT_BROWN;
					hardCoreBtn.color = Registry.MGMT_BROWN;					
					break;
			}
					
		}
		
		protected function beginFade():void
		{
			//not playing a custom level, so when ESCAPE go to this menu. 
			Registry.isPlayingCustomLevel = false;
			
			var l:int = currentButton - 2;	
			var shakeAmt:Number = 0.01;
			
			if (Registry.levelType == 1 && !Registry.hardCore && currentButton < 15) {
				if (_wh[l] == "1") {
					fading = true;
					FlxG.fade(0xff000000, 0.4, completeFade);
					FlxG.play(Registry.SndPing,Registry.pingVolume);
				}
				else {
					FlxG.log("Level " + l + " is not available");
					FlxG.shake(shakeAmt, 0.1);
				}
			}
			else if (Registry.levelType == 1 && Registry.hardCore && currentButton < 15) {
				if (_hcwh[l] == "1") {
					fading = true;
					FlxG.fade(0xff000000, 0.4, completeFade);
					FlxG.play(Registry.SndPing,Registry.pingVolume);
				}
				else {
					FlxG.log("Level " + l + " is not available");
					FlxG.shake(shakeAmt, 0.1);
				}
			}			
			
			
			
			
			if (Registry.levelType == 2 && !Registry.hardCore && currentButton < 15) {
							
				if (_ftry[l] == "1") {
					fading = true;
					FlxG.fade(0xff000000, 0.4, completeFade);
					FlxG.play(Registry.SndPing,Registry.pingVolume);
				}
				else {
					FlxG.log("Level " + l + " is not available");
					FlxG.shake(shakeAmt, 0.1);
				}
			}
			else if (Registry.levelType == 2 && Registry.hardCore && currentButton < 15) {
				if (_hcftry[l] == "1") {
					fading = true;
					FlxG.fade(0xff000000, 0.4, completeFade);
					FlxG.play(Registry.SndPing,Registry.pingVolume);
				}
				else {
					FlxG.log("Level " + l + " is not available");
					FlxG.shake(shakeAmt, 0.1);
				}
			}
			
			if (Registry.levelType == 3 && !Registry.hardCore && currentButton < 15) {
							
				if (_mgmt[l] == "1") {
					fading = true;
					FlxG.fade(0xff000000, 0.4, completeFade);
					FlxG.play(Registry.SndPing,Registry.pingVolume);
				}
				else {
					FlxG.log("Level " + l + " is not available");
					FlxG.shake(shakeAmt, 0.1);
				}
			}
			else if (Registry.levelType == 3 && Registry.hardCore && currentButton < 15) {
				if (_hcmgmt[l] == "1") {
					fading = true;
					FlxG.fade(0xff000000, 0.4, completeFade);
					FlxG.play(Registry.SndPing,Registry.pingVolume);
				}
				else {
					FlxG.log("Level " + l + " is not available");
					FlxG.shake(shakeAmt, 0.1);
				}
			}			
			
			
			
			if (currentButton == 15) {
				fading = true;
				FlxG.fade(0xff000000, 0.4, onQuit);
			}

			
		}
		
		protected function hardCore(changeModes:Boolean=true, playSound:Boolean=true):void
		{
			
			if (playSound) 
				FlxG.play(Registry.SndPing, Registry.pingVolume);
			
			if (changeModes) {
				if (!Registry.DEMO) {
					Registry.hardCore = !Registry.hardCore;
					
				}
				else {
					FlxG.shake(0.01, 0.1);
					headingTxt.text = "Hardcore Mode not available in demo";
					return;
				}
			}
			
			this.switchWorld();
			
			
			if (Registry.hardCore) {
				headingTxt.text = "Level Select - Hardcore Mode";
				
				hardCoreBtn.highlightedText = "Normal mode";
				hardCoreBtn.regularText = "Normal mode";
				
				//level1Btn.regularText = "Level 1x";
				level1Btn.highlightedText = "Level 1x";
				level1Btn.regularText = "Level 1x";
				
				level2Btn.highlightedText = "Level 2x";
				level2Btn.regularText = "Level 2x";
				level3Btn.highlightedText = "Level 3x";
				level3Btn.regularText = "Level 3x";
				level4Btn.highlightedText = "Level 4x";
				level4Btn.regularText = "Level 4x";
				level5Btn.highlightedText = "Level 5x";
				level5Btn.regularText = "Level 5x";
				level6Btn.highlightedText = "Level 6x";
				level6Btn.regularText = "Level 6x";
				level7Btn.highlightedText = "Level 7x";
				level7Btn.regularText = "Level 7x";
				level8Btn.highlightedText = "Level 8x";
				level8Btn.regularText = "Level 8x";
				level9Btn.highlightedText = "Level 9x";
				level9Btn.regularText = "Level 9x";
				level10Btn.highlightedText = "Level 10x";
				level10Btn.regularText = "Level 10x";
				level11Btn.highlightedText = "Level 11x";
				level11Btn.regularText = "Level 11x";
				level12Btn.highlightedText = "Level 12x";
				level12Btn.regularText = "Level 12x";
					
			}
			else if (!Registry.hardCore) {
				headingTxt.text = "Level Select - Normal Mode";				
				hardCoreBtn.highlightedText = "Hardcore";
				hardCoreBtn.regularText = "Hardcore";
/*				level1Btn.regularText = "Level 1"; */				
				level1Btn.highlightedText = "Level 1x";
				level1Btn.regularText = "Level 1x";
				
				level2Btn.highlightedText = "Level 2";
				level2Btn.regularText = "Level 2";
				level3Btn.highlightedText = "Level 3";
				level3Btn.regularText = "Level 3";
				level4Btn.highlightedText = "Level 4";
				level4Btn.regularText = "Level 4";
				level5Btn.highlightedText = "Level 5";
				level5Btn.regularText = "Level 5";
				level6Btn.highlightedText = "Level 6";
				level6Btn.regularText = "Level 6";
				level7Btn.highlightedText = "Level 7";
				level7Btn.regularText = "Level 7";
				level8Btn.highlightedText = "Level 8";
				level8Btn.regularText = "Level 8";
				level9Btn.highlightedText = "Level 9";
				level9Btn.regularText = "Level 9";
				level10Btn.highlightedText = "Level 10";
				level10Btn.regularText = "Level 10";
				level11Btn.highlightedText = "Level 11";
				level11Btn.regularText = "Level 11";
				level12Btn.highlightedText = "Level 12";
				level12Btn.regularText = "Level 12";
					
			}			
		}	
		
		public function loadLevel():void
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
			if ((Registry.levelNumber == 1 || Registry.levelNumber == 13 || Registry.levelNumber == 25) && (!Registry.hardCore) ) {
				FlxG.switchState(new PCCinematicState());
			}
			else {
				FlxG.switchState(new PCPlayState());
			}
			
			
		}
		
		protected function onQuit():void
		{
			FlxG.switchState(new PCMenuState());
		}
		
		protected function onBtnLevel1():void 
		{
			currentButton = 3;
			this.beginFade();
			
		}
		
		protected function onBtnLevel2():void 
		{
			currentButton = 4;
			this.beginFade();
			
		}
		
		protected function onBtnLevel3():void 
		{
			currentButton = 5;
			this.beginFade();
		}
		
		protected function onBtnLevel4():void 
		{
			currentButton = 6;
			this.beginFade();
			
		}
		protected function onBtnLevel5():void 
		{
			currentButton = 7;
			this.beginFade();
		}
		
		protected function onBtnLevel6():void 
		{
			currentButton = 8;
			this.beginFade();
			
		}
		
		protected function onBtnLevel7():void 
		{
			currentButton = 9;
			this.beginFade();
		}
		
		protected function onBtnLevel8():void 
		{
			currentButton = 10;
			this.beginFade();
			
		}		
		protected function onBtnLevel9():void 
		{
			currentButton = 11;
			this.beginFade();
		}
		
		protected function onBtnLevel10():void 
		{
			currentButton = 12;
			this.beginFade();
			
		}
		
		protected function onBtnLevel11():void 
		{
			currentButton = 13;
			FlxG.fade(0xff000000, 0.4, completeFade);
		}
		
		protected function onBtnLevel12():void 
		{
			currentButton = 14;
			FlxG.fade(0xff000000, 0.4, completeFade);
			
		}		
		
		protected function completeFade():void
		{
			switch(currentButton) {
				case 0:
					this.setLevelType1();
					break;
				case 1:
					this.setLevelType2();
					break;		
				case 2:
					this.setLevelType3();
					break;
				case 3:
					Registry.levelNumber = 1;
					this.loadLevel();
					break;	
				case 4:
					Registry.levelNumber = 2;
					this.loadLevel();
					break;
				case 5:
					Registry.levelNumber = 3;
					this.loadLevel();
					break;	
				case 6:
					Registry.levelNumber = 4;
					this.loadLevel();
					break;
				case 7:
					Registry.levelNumber = 5;
					this.loadLevel();
					break;	
				case 8:
					Registry.levelNumber = 6;
					this.loadLevel();
					break;
				case 9:
					Registry.levelNumber = 7;
					this.loadLevel();
					break;	
				case 10:
					Registry.levelNumber = 8;
					this.loadLevel();
					break;					
				case 11:
					Registry.levelNumber = 9;
					this.loadLevel();
					break;	
				case 12:
					Registry.levelNumber = 10;
					this.loadLevel();
					break;
				case 13:
					Registry.levelNumber = 11;
					this.loadLevel();
					break;	
				case 14:
					Registry.levelNumber = 12;
					this.loadLevel();
					break;					
				case 15:
					FlxG.switchState(new PCMenuState());
					break;	
				case 16:
					this.hardCore();
					break;					
					
			}
				
			
		}		
		
		
	}
}