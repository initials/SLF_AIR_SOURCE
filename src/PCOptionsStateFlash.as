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
 * PCOptionsState.as
 * Created On: 14/04/2012 11:18 AM
 */
 
package 
{
	import org.flixel.*;
    import flash.display.*;
	import flash.net.FileReference;
	import org.flixel.plugin.photonstorm.*;

	import flash.net.FileFilter;
	import flash.events.IOErrorEvent;
	import flash.events.Event;
	import flash.utils.ByteArray;

	public class PCOptionsStateFlash extends FlxState
	{
		
		
		public var playersBtn:FlxButton;
		public var joystickBtn:FlxButton;
		public var fullScreenBtn:FlxButton;
		public var alignBtn:FlxButton;
		public var scaleBtn:FlxButton;
		public var mouseBtn:FlxButton;
		public var eraseBtn:FlxButton;
		public var exportProgressBtn:FlxButton;
		public var importProgressBtn:FlxButton;
		
		public var playersText:FlxText;
		public var joystickText:FlxText;
		public var fullScreenText:FlxText;
		public var alignText:FlxText;
		public var scaleText:FlxText;
		public var mouseText:FlxText;
		public var eraseText:FlxText;		
		public var importText:FlxText;		
		public var exportText:FlxText;		
		
		
		public var backBtn:FlxButton;
		
		public var buttonsGroup:FlxGroup;
		
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
		
		public var _plays:int;
		
		public var saveData:ByteArray;
		
		public var joystickOnMsg:String = "Joystick On";
		public var joystickOffMsg:String = "Joystick Off";
		
		
		//FileReference Class well will use to load data
		private var fr:FileReference;

		//File types which we want the user to open
		private static const FILE_TYPES:Array = [new FileFilter("Super Lemonade Factory Save File", "*.slf")];
		
		
		override public function create():void
		{
			
			FlxG.bgColor = 0xffF8CB8F;
			
			//	Make the gradient retro looking and "chunky" with the chucnkSize parameter (here set to 4)
			var gradient2:FlxSprite = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [0xffcac5ac, 0xffdedbc3 , 0xffdfdcc4], 10 ); //0xffd6d3ba
			gradient2.x = 0;
			gradient2.y = 0;
			add(gradient2);
			
			var borderTop:FlxTileblock = new FlxTileblock(0, 0, FlxG.width, 30);
			borderTop.loadTiles(Registry.ImgLevel1Tiles, 10, 10, 0,true);
			add(borderTop);
			
			var borderBottom:FlxTileblock = new FlxTileblock(0, FlxG.height-30, FlxG.width, 30);
			borderBottom.loadTiles(Registry.ImgLevel1Tiles, 10, 10, 0,true);
			add(borderBottom);		
			
			var headingTxt:FlxText = new FlxText(0, 8, FlxG.width, "Options", true);
			headingTxt.color = 0xffffffff;
			headingTxt.size = 8;
			headingTxt.alignment = "center";
			add(headingTxt);
			
			
			
			
			ping = new FlxSound();
			ping.loadEmbedded(Registry.SndBlip);
			ping.volume = 0.5;
			
			buttonsGroup = new FlxGroup();
			
			fullScreenBtn = new FlxButton(Registry.xPos1, Registry.ySmallPos1, "full screen", this.fullScreen);
			fullScreenBtn.soundOver = ping;
			fullScreenBtn.color = Registry.WAREHOUSE_PURPLE;
			fullScreenBtn.label.color = 0xffffff;
			buttonsGroup.add(fullScreenBtn);
			
			fullScreenBtn.status = FlxButton.HIGHLIGHT;
			
			fullScreenText = new FlxText(Registry.xPos1+fullScreenBtn.width,Registry.ySmallPos1,FlxG.width/2,"Window.");
			fullScreenText.size = 8;
			fullScreenText.alignment = "left";
			fullScreenText.color = 0x8000FF;
			add(fullScreenText);

			
			alignBtn = new FlxButton(Registry.xPos1, Registry.ySmallPos2, "align", this.align);
			alignBtn.soundOver = ping;
			alignBtn.color = Registry.WAREHOUSE_PURPLE;
			alignBtn.label.color = 0xffffff;
			buttonsGroup.add(alignBtn);
			
			alignText = new FlxText(Registry.xPos1+fullScreenBtn.width,Registry.ySmallPos2,FlxG.width/2,"Left aligned");
			alignText.size = 8;
			alignText.alignment = "left";
			alignText.color = 0x8000FF;
			add(alignText);
			
			
			scaleBtn = new FlxButton(Registry.xPos1, Registry.ySmallPos3, "scale", this.scale);
			scaleBtn.soundOver = ping;
			scaleBtn.color = Registry.WAREHOUSE_PURPLE;
			scaleBtn.label.color = 0xffffff;
			buttonsGroup.add(scaleBtn);
			
			scaleText = new FlxText(Registry.xPos1+fullScreenBtn.width,Registry.ySmallPos3,FlxG.width/2,"No scale - the pixel connoisseurs choice");
			scaleText.size = 8;
			scaleText.alignment = "left";
			scaleText.color = 0x8000FF;
			add(scaleText);
			
			
			mouseBtn = new FlxButton(Registry.xPos1, Registry.ySmallPos4, "mouse", this.mouse);
			mouseBtn.soundOver = ping;
			mouseBtn.color = Registry.WAREHOUSE_PURPLE;
			mouseBtn.label.color = 0xffffff;
			buttonsGroup.add(mouseBtn);	
			
			mouseText = new FlxText(Registry.xPos1+fullScreenBtn.width,Registry.ySmallPos4,FlxG.width/2,"Mouse off.");
			mouseText.size = 8;
			mouseText.alignment = "left";
			mouseText.color = 0x8000FF;
			add(mouseText);			
			
			eraseBtn = new FlxButton(Registry.xPos1, Registry.ySmallPos5, "delete", this.deleteHistory);
			eraseBtn.soundOver = ping;
			eraseBtn.color = Registry.WAREHOUSE_PURPLE;
			eraseBtn.label.color = 0xffffff;
			buttonsGroup.add(eraseBtn);	
			
			eraseText = new FlxText(Registry.xPos1+fullScreenBtn.width,Registry.ySmallPos5,FlxG.width/2,"Erase progress.");
			eraseText.size = 8;
			eraseText.alignment = "left";
			eraseText.color = 0x8000FF;
			add(eraseText);
			
			exportProgressBtn = new FlxButton(Registry.xPos1, Registry.ySmallPos6, "export progress", this.exportProgress);
			exportProgressBtn.soundOver = ping;
			exportProgressBtn.color = Registry.WAREHOUSE_PURPLE;
			exportProgressBtn.label.color = 0xffffff;
			buttonsGroup.add(exportProgressBtn);	
			
			importText = new FlxText(Registry.xPos1+fullScreenBtn.width,Registry.ySmallPos7,FlxG.width/2,"Load a .slf file with your progress.");
			importText.size = 8;
			importText.alignment = "left";
			importText.color = 0x8000FF;
			add(importText);
			
			exportText = new FlxText(Registry.xPos1+fullScreenBtn.width,Registry.ySmallPos6,FlxG.width/2,"Save a .slf file with your progress.");
			exportText.size = 8;
			exportText.alignment = "left";
			exportText.color = 0x8000FF;
			add(exportText);			
			
			importProgressBtn = new FlxButton(Registry.xPos1, Registry.ySmallPos7, "import progress", this.onLoadFileClick);
			importProgressBtn.soundOver = ping;
			importProgressBtn.color = Registry.WAREHOUSE_PURPLE;
			importProgressBtn.label.color = 0xffffff;
			buttonsGroup.add(importProgressBtn);
			
			
			playersBtn = new FlxButton(Registry.xPos1, Registry.ySmallPos8, "players", this.players);
			playersBtn.soundOver = ping;
			playersBtn.color = Registry.WAREHOUSE_PURPLE;
			playersBtn.label.color = 0xffffff;
			buttonsGroup.add(playersBtn);
			
			playersText = new FlxText(Registry.xPos1+fullScreenBtn.width,Registry.ySmallPos8,FlxG.width/2,"1 or 2 Players");
			playersText.size = 8;
			playersText.alignment = "left";
			playersText.color = 0x8000FF;
			add(playersText);

			joystickBtn = new FlxButton(Registry.xPos1, Registry.ySmallPos9, "joysick", this.joystick);
			joystickBtn.soundOver = ping;
			joystickBtn.color = Registry.WAREHOUSE_PURPLE;
			joystickBtn.label.color = 0xffffff;
			buttonsGroup.add(joystickBtn);
			
			joystickText = new FlxText(Registry.xPos1+fullScreenBtn.width,Registry.ySmallPos9,FlxG.width/2,"joystick status");
			joystickText.size = 8;
			joystickText.alignment = "left";
			joystickText.color = 0x8000FF;
			add(joystickText);
			
			
			backBtn = new FlxButton(Registry.xPos1, Registry.ySmallPos10 , "back", this.onQuit);
			backBtn.soundOver = ping;
			backBtn.color = Registry.WAREHOUSE_PURPLE;
			backBtn.label.color = 0xffffff;
			buttonsGroup.add(backBtn);
			
			add(buttonsGroup);
			
			
		}

		override public function update():void
		{
			if (!fading && !FlxG.mouse.visible)
				this.handleButtons();
				
			this.setTextValues();
			
			if ( (FlxG.keys.justPressed(Registry.homeKey) || FlxG.joystick.j1ButtonBackJustPressed ) && !fading) {
				onQuit();			
				
			}
			
			
			super.update();

		}
		
		protected function onQuit():void
		{
			FlxG.switchState(new PCMenuState());
			return;
		}
		
		public function handleButtons():void {
			
			
			
			if (FlxG.keys.justPressed(Registry.p1Down)  || FlxG.joystick.j1Stick1DownJustPressed ) {
				currentButton++;
				FlxG.play(Registry.SndBlip, 0.3);
				
			}
			else if (FlxG.keys.justPressed(Registry.p1Up) || FlxG.joystick.j1Stick1UpJustPressed ) {
				currentButton--;
				FlxG.play(Registry.SndBlip, 0.3);
			}
			
			if (FlxG.keys.justPressed(Registry.p1Action) ||  FlxG.keys.justPressed(Registry.p1Switch) || FlxG.keys.justPressed(Registry.p1Jump) || FlxG.joystick.j1ButtonAJustPressed ) {
				FlxG.play(Registry.SndPing,Registry.pingVolume);
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
		
		
		protected function setTextValues():void
		{		
			// full screen. align. scale
			
			if (FlxG.stage.displayState==StageDisplayState.FULL_SCREEN) {
				fullScreenText.text = "Full screen mode";
				
				if (FlxG.stage.align == StageAlign.TOP_LEFT) {
					alignText.text = "Top Left";
				}
				else if (FlxG.stage.align == StageAlign.TOP) {
					alignText.text = "Top";
				}
				else if (FlxG.stage.align == "") {
					alignText.text = "Center";
				}			
				else if (FlxG.stage.align == StageAlign.LEFT) {
					alignText.text = "Left";
				}
				
				
				if (FlxG.stage.scaleMode==StageScaleMode.NO_SCALE) {
					scaleText.text = "No scale - the pixel connoisseurs choice";
				}
				else if (FlxG.stage.scaleMode==StageScaleMode.SHOW_ALL) {
					scaleText.text = "Show all - warning, will stretch your pixels";
				}
				else if (FlxG.stage.scaleMode==StageScaleMode.EXACT_FIT) {
					scaleText.text = "Exact fit - warning, will stretch your pixels badly";
				}
				
			}
			else if (FlxG.stage.displayState==StageDisplayState.NORMAL) {
				fullScreenText.text = "Window mode";
				alignText.text = "Not available in window mode";
				scaleText.text = "Not available in window mode";
			}
			
			// Mouse enabled for navigation:
			
			if (Registry.mouseEnabled) {
				mouseText.text = "Mouse on";
			}
			else{
				FlxG.mouse.hide();
				mouseText.text = "Mouse off";
			}
			
			// players:
			
			if (Registry.playersNo == 2) {
				playersText.text = "2 player";
			}
			else if (Registry.playersNo == 1) {
				playersText.text = "1 player";
			}
			
			if (FlxG.usingJoystick) {
				joystickText.text = joystickOnMsg;
			}
			else if (!FlxG.usingJoystick) {
				joystickText.text = joystickOffMsg;
			}			
			
			

		}
		
		
		protected function fullScreen():void
		{			
			if (FlxG.stage.displayState==StageDisplayState.NORMAL) {
				FlxG.stage.displayState = StageDisplayState.FULL_SCREEN;
				fullScreenText.text = "Full screen";
			}
			
			else if (FlxG.stage.displayState==StageDisplayState.FULL_SCREEN) {
				FlxG.stage.displayState = StageDisplayState.NORMAL;	
				fullScreenText.text = "Window";
			}
			

		}
		
		protected function align():void
		{	
			
			if (FlxG.stage.align == StageAlign.TOP_LEFT) {
				FlxG.stage.align = StageAlign.TOP;
				alignText.text = "Top";
			}
			else if (FlxG.stage.align == StageAlign.TOP) {
				FlxG.stage.align = "";
				alignText.text = "Center";
			}
			else if (FlxG.stage.align == "") {
				FlxG.stage.align = StageAlign.LEFT;
				alignText.text = "Left";
			}			
			else if (FlxG.stage.align == StageAlign.LEFT) {
				FlxG.stage.align = StageAlign.TOP_LEFT;
				alignText.text = "Top left";
			}			

		}		
		
		
		protected function scale():void
		{			
						
			if (FlxG.stage.scaleMode==StageScaleMode.NO_SCALE) {
				FlxG.stage.scaleMode = StageScaleMode.SHOW_ALL;
				scaleText.text = "Show all - warning, will stretch your pixels";
			}
			else if (FlxG.stage.scaleMode==StageScaleMode.SHOW_ALL) {
				FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
				scaleText.text = "Exact fit - warning, will stretch your pixels badly";
			}
			else if (FlxG.stage.scaleMode==StageScaleMode.EXACT_FIT) {
				FlxG.stage.scaleMode = StageScaleMode.NO_SCALE;
				scaleText.text = "No scale - the pixel connoisseurs choice";
			}		
			
			
		}		
		
		protected function mouse():void
		{			
			
			Registry.mouseEnabled = !Registry.mouseEnabled;
			
			if (Registry.mouseEnabled) {
				FlxG.mouse.show();
				mouseText.text = "Mouse on";
				currentButton = -1;
			}
			else{
				FlxG.mouse.hide();
				mouseText.text = "Mouse off";
				currentButton = 3;
			}
			
			
		}
		
		protected function deleteHistory():void
		{			
			
			if (eraseBtn.label.text == "delete") {
				eraseBtn.label.text = "are you sure";
			}
			else if (eraseBtn.label.text == "are you sure") {
				eraseBtn.label.text = "really?";
			}
			else if (eraseBtn.label.text == "really?") {
				FlxG.shake(0.01, 0.1);
				eraseBtn.label.text = "erased";
				var save:FlxSave = new FlxSave();
				if(save.bind("SLF"))
				{
					save.erase();
					save.close();
				}
			}			
		}
		
		protected function exportProgress():void
		{			
						
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
			
			var myFileRefSave:FileReference;
			myFileRefSave = new FileReference();
			myFileRefSave.save(export, "progress.slf");
			
			
		}
		
/*		protected function importProgress():void
		{			
			
			this.onLoadFileClick();
			
			var saves:Array = saveData.toString().split(".");
			
		
			var save:FlxSave = new FlxSave();
			if(save.bind("SLF"))
			{
				save.data.warehouseLevelsComplete = saves[0];
				save.data.hcwarehouseLevelsComplete = saves[1];					
				save.data.factoryLevelsComplete = saves[2];					
				save.data.hcfactoryLevelsComplete = saves[3];					
				save.data.mgmtLevelsComplete = saves[4];					
				save.data.hcmgmtLevelsComplete = saves[5];	
				
				save.data.warehouseLevelsTalk = saves[6];
				save.data.hcwarehouseLevelsTalk = saves[7];					
				save.data.factoryLevelsTalk = saves[8];					
				save.data.hcfactoryLevelsTalk = saves[9];					
				save.data.mgmtLevelsTalk = saves[10];					
				save.data.hcmgmtLevelsTalk = saves[11];
				
				save.data.warehouseLevelsTalkAndre = saves[12];
				save.data.hcwarehouseLevelsTalkAndre = saves[13];					
				save.data.factoryLevelsTalkAndre = saves[14];					
				save.data.hcfactoryLevelsTalkAndre = saves[15];					
				save.data.mgmtLevelsTalkAndre = saves[16];					
				save.data.hcmgmtLevelsTalkAndre = saves[17];				
				
				save.data.warehouseCap = saves[18];
				save.data.hcwarehouseCap = saves[19];					
				save.data.factoryCap = saves[20];					
				save.data.hcfactoryCap = saves[21];					
				save.data.mgmtCap = saves[22];					
				save.data.hcmgmtCap = saves[23];				
				
				save.close();
			}
		
			
		}*/
		
		protected function players():void
		{			
			
			if (Registry.playersNo == 1) {
				Registry.playersNo = 2;
				playersText.text = "2 player";
			}
			else if (Registry.playersNo == 2) {
				Registry.playersNo = 1;
				playersText.text = "1 player";
			}
		
			
		}
		
		protected function joystick():void
		{			
			//load saved joystick prefs if they exist
			var joyPrefs:FlxSave = new FlxSave();
			
			if (FlxG.usingJoystick == false) {
				FlxG.usingJoystick = true;
				if(joyPrefs.bind("flixel"))
				{
					joystickOnMsg = "Joystick on - restart to take effect";
					
					joyPrefs.data.usingJoystick = true;
					joyPrefs.close();
					
					
				}				
				
			}
			else if (FlxG.usingJoystick == true) {
				FlxG.usingJoystick = false;
				if(joyPrefs.bind("flixel"))
				{
					joystickOffMsg = "Joystick off - restart to take effect";
					
					joyPrefs.data.usingJoystick = false;
					joyPrefs.close();
					
					
				}			
			}
			
		}		
		
		protected function beginFade():void
		{
			if (currentButton>=0) {
				switch(currentButton) {
					case 0:
						this.fullScreen();
						break;
					case 1:
						this.align();
						break;
					case 2:
						this.scale();
						break;
					case 3:
						this.mouse();
						break;		
					case 4:
						this.deleteHistory();
						break;	
					case 5:
						this.exportProgress();
						break;					
					case 6:
						this.onLoadFileClick();
						break;					
					case 7:
						this.players();
						break;		
					case 8:
						this.joystick();
						break;							
					case 9:
						fading = true;
						FlxG.fade(0xff000000, 0.4, completeFade);
						break;
						
				}
			}
			else {
				fading = true;
				FlxG.fade(0xff000000, 0.4, completeFade);
			}
			
		}
		
		protected function completeFade():void
		{
			switch(currentButton) {
				case 0:
					break;
				case 1:
					this.align();
					break;
				case 2:
					this.scale();
					break;
				case 3:
					this.mouse();
					break;
				case 4:
					this.deleteHistory();
					break;	
				case 5:
					this.exportProgress();
					break;		
				case 6:
					this.onLoadFileClick();
					break;
				case 7:
					this.players();
					break;
				case 8:
					this.joystick();
					break;
				case 9:
					FlxG.switchState(new PCMenuState());
					break;		
	
					
			}
				
			
		}		
		

		
		
		//IMPORT FILE HELPERS
		
		//called when the user clicks the load file button
		private function onLoadFileClick():void
		{
			//create the FileReference instance
			fr = new FileReference();

			//listen for when they select a file
			fr.addEventListener(Event.SELECT, onFileSelect);

			//listen for when then cancel out of the browse dialog
			fr.addEventListener(Event.CANCEL,onCancel);

			//open a native browse dialog that filters for text files
			fr.browse(FILE_TYPES);
		}

		/************ Browse Event Handlers **************/

		//called when the user selects a file from the browse dialog
		private function onFileSelect(e:Event):void
		{
			//listen for when the file has loaded
			fr.addEventListener(Event.COMPLETE, onLoadComplete);

			//listen for any errors reading the file
			fr.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);

			//load the content of the file
			fr.load();
			
			
			
		}

		//called when the user cancels out of the browser dialog
		private function onCancel(e:Event):void
		{
			trace("File Browse Canceled");
			fr = null;
		}

		/************ Select Event Handlers **************/

		//called when the file has completed loading
		private function onLoadComplete(e:Event):void
		{
			//get the data from the file as a ByteArray
			var data:ByteArray = fr.data;
			
			
			//saveData = data;
			//FlxG.log(data);
			
			//clean up the FileReference instance
			
			
			var saves:Array = data.toString().split(".");
			
			var s1:Array = saves[0].split(",");
			var s2:Array = saves[1].split(",");
			var s3:Array = saves[2].split(",");
			var s4:Array = saves[3].split(",");
			var s5:Array = saves[4].split(",");
			var s6:Array = saves[5].split(",");
			
			var s7:Array = saves[6].split(",");
			var s8:Array = saves[7].split(",");
			var s9:Array = saves[8].split(",");
			var s10:Array = saves[9].split(",");
			var s11:Array = saves[10].split(",");
			var s12:Array = saves[11].split(",");			
			
			var s13:Array = saves[12].split(",");
			var s14:Array = saves[13].split(",");
			var s15:Array = saves[14].split(",");
			var s16:Array = saves[15].split(",");
			var s17:Array = saves[16].split(",");
			var s18:Array = saves[17].split(",");			
			
			var s19:Array = saves[18].split(",");
			var s20:Array = saves[19].split(",");
			var s21:Array = saves[20].split(",");
			var s22:Array = saves[21].split(",");
			var s23:Array = saves[22].split(",");
			var s24:Array = saves[23].split(",");
			
			var save:FlxSave = new FlxSave();
			if(save.bind("SLF"))
			{
				save.data.warehouseLevelsComplete = s1;
				save.data.factoryLevelsComplete = s2;					
				save.data.mgmtLevelsComplete = s3;									
				save.data.hcwarehouseLevelsComplete = s4;					
				save.data.hcfactoryLevelsComplete = s5;					
				save.data.hcmgmtLevelsComplete = s6;	

				save.data.warehouseLevelsTalk = s7;
				save.data.factoryLevelsTalk = s8;					
				save.data.mgmtLevelsTalk = s9;					
				save.data.hcwarehouseLevelsTalk = s10;
				save.data.hcfactoryLevelsTalk = s11;					
				save.data.hcmgmtLevelsTalk = s12;
				
				save.data.warehouseLevelsTalkAndre = s13;
				save.data.factoryLevelsTalkAndre = s14;					
				save.data.mgmtLevelsTalkAndre = s15;					
				save.data.hcwarehouseLevelsTalkAndre = s16;					
				save.data.hcfactoryLevelsTalkAndre = s17;					
				save.data.hcmgmtLevelsTalkAndre = s18;				
				
				save.data.warehouseCap = s19;
				save.data.factoryCap = s20;					
				save.data.mgmtCap = s21;					
				save.data.hcwarehouseCap = s22;					
				save.data.hcfactoryCap = s23;					
				save.data.hcmgmtCap = s24;
				

				save.close();
			}
			
			

			fr = null;
			

		}

		//called if an error occurs while loading the file contents
		private function onLoadError(e:IOErrorEvent):void
		{
			trace("Error loading file : " + e.text);
		}
		
		
		
		
		
		
	}
}