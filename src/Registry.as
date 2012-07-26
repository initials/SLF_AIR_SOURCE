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
        import flash.display.Stage;
        import org.flixel.*;
		


        public class Registry
        {
			[Embed(source="org/flixel/data/nokiafc22.ttf",fontFamily="commodore",embedAsCFF="false")] protected var c64:String;
			
			[Embed(source = "../data/logo.png")] public static  var ImgLogo:Class;
			[Embed(source = "../data/illustration/andre_drawing.png")] public static  var ImgAndre:Class;
			[Embed(source = "../data/illustration/liselot_drawing.png")] public static  var ImgLiselot:Class;
			[Embed(source = "../data/illustration/worker_drawing.png")] public static  var ImgWorker:Class;
			[Embed(source = "../data/illustration/army_drawing.png")] public static  var ImgArmy:Class;
			
			
			// Winnitron Levels
			
			[Embed(source = '../data/SLF_levelEditor/w_level1.oel', mimeType = 'application/octet-stream')] public static var wLevel1:Class;
			[Embed(source = '../data/SLF_levelEditor/w_level2.oel', mimeType = 'application/octet-stream')] public static var wLevel2:Class;
			[Embed(source = '../data/SLF_levelEditor/w_level3.oel', mimeType = 'application/octet-stream')] public static var wLevel3:Class;
			[Embed(source = '../data/SLF_levelEditor/w_level4.oel', mimeType = 'application/octet-stream')] public static var wLevel4:Class;
			[Embed(source = '../data/SLF_levelEditor/w_level5.oel', mimeType = 'application/octet-stream')] public static var wLevel5:Class;
			[Embed(source = '../data/SLF_levelEditor/w_level6.oel', mimeType = 'application/octet-stream')] public static var wLevel6:Class;
			
			//regular levels;
			
			[Embed(source = '../data/SLF_levelEditor/PC/level1.oel', mimeType = 'application/octet-stream')] public static var Level1:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level2.oel', mimeType = 'application/octet-stream')] public static var Level2:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level3.oel', mimeType = 'application/octet-stream')] public static var Level3:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level4.oel', mimeType = 'application/octet-stream')] public static var Level4:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level5.oel', mimeType = 'application/octet-stream')] public static var Level5:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level6.oel', mimeType = 'application/octet-stream')] public static var Level6:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level7.oel', mimeType = 'application/octet-stream')] public static var Level7:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level8.oel', mimeType = 'application/octet-stream')] public static var Level8:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level9.oel', mimeType = 'application/octet-stream')] public static var Level9:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level10.oel', mimeType = 'application/octet-stream')] public static var Level10:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level11.oel', mimeType = 'application/octet-stream')] public static var Level11:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level12.oel', mimeType = 'application/octet-stream')] public static var Level12:Class;
			
			[Embed(source = '../data/SLF_levelEditor/PC/level13.oel', mimeType = 'application/octet-stream')] public static var Level13:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level14.oel', mimeType = 'application/octet-stream')] public static var Level14:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level15.oel', mimeType = 'application/octet-stream')] public static var Level15:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level16.oel', mimeType = 'application/octet-stream')] public static var Level16:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level17.oel', mimeType = 'application/octet-stream')] public static var Level17:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level18.oel', mimeType = 'application/octet-stream')] public static var Level18:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level19.oel', mimeType = 'application/octet-stream')] public static var Level19:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level20.oel', mimeType = 'application/octet-stream')] public static var Level20:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level21.oel', mimeType = 'application/octet-stream')] public static var Level21:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level22.oel', mimeType = 'application/octet-stream')] public static var Level22:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level23.oel', mimeType = 'application/octet-stream')] public static var Level23:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level24.oel', mimeType = 'application/octet-stream')] public static var Level24:Class;
			
			[Embed(source = '../data/SLF_levelEditor/PC/level25.oel', mimeType = 'application/octet-stream')] public static var Level25:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level26.oel', mimeType = 'application/octet-stream')] public static var Level26:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level27.oel', mimeType = 'application/octet-stream')] public static var Level27:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level28.oel', mimeType = 'application/octet-stream')] public static var Level28:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level29.oel', mimeType = 'application/octet-stream')] public static var Level29:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level30.oel', mimeType = 'application/octet-stream')] public static var Level30:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level31.oel', mimeType = 'application/octet-stream')] public static var Level31:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level32.oel', mimeType = 'application/octet-stream')] public static var Level32:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level33.oel', mimeType = 'application/octet-stream')] public static var Level33:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level34.oel', mimeType = 'application/octet-stream')] public static var Level34:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level35.oel', mimeType = 'application/octet-stream')] public static var Level35:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/level36.oel', mimeType = 'application/octet-stream')] public static var Level36:Class;
			
			//cutscenes
			
			[Embed(source = '../data/SLF_levelEditor/PC/level101.oel', mimeType = 'application/octet-stream')] public static var LevelCutscene1:Class;			
			[Embed(source = '../data/SLF_levelEditor/PC/level113.oel', mimeType = 'application/octet-stream')] public static var LevelCutscene2:Class;			
			[Embed(source = '../data/SLF_levelEditor/PC/level125.oel', mimeType = 'application/octet-stream')] public static var LevelCutscene3:Class;
			
			//end stages
			
			[Embed(source = '../data/SLF_levelEditor/PC/level49997.oel', mimeType = 'application/octet-stream')] public static var LevelEndScene1:Class;			
			[Embed(source = '../data/SLF_levelEditor/PC/level49998.oel', mimeType = 'application/octet-stream')] public static var LevelEndScene2:Class;			
			[Embed(source = '../data/SLF_levelEditor/PC/level49999.oel', mimeType = 'application/octet-stream')] public static var LevelEndScene3:Class;			
			
			//Hard core levels.
			
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel1.oel', mimeType = 'application/octet-stream')] public static var HCLevel1:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel2.oel', mimeType = 'application/octet-stream')] public static var HCLevel2:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel3.oel', mimeType = 'application/octet-stream')] public static var HCLevel3:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel4.oel', mimeType = 'application/octet-stream')] public static var HCLevel4:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel5.oel', mimeType = 'application/octet-stream')] public static var HCLevel5:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel6.oel', mimeType = 'application/octet-stream')] public static var HCLevel6:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel7.oel', mimeType = 'application/octet-stream')] public static var HCLevel7:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel8.oel', mimeType = 'application/octet-stream')] public static var HCLevel8:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel9.oel', mimeType = 'application/octet-stream')] public static var HCLevel9:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel10.oel', mimeType = 'application/octet-stream')] public static var HCLevel10:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel11.oel', mimeType = 'application/octet-stream')] public static var HCLevel11:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel12.oel', mimeType = 'application/octet-stream')] public static var HCLevel12:Class;
			
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel13.oel', mimeType = 'application/octet-stream')] public static var HCLevel13:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel14.oel', mimeType = 'application/octet-stream')] public static var HCLevel14:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel15.oel', mimeType = 'application/octet-stream')] public static var HCLevel15:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel16.oel', mimeType = 'application/octet-stream')] public static var HCLevel16:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel17.oel', mimeType = 'application/octet-stream')] public static var HCLevel17:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel18.oel', mimeType = 'application/octet-stream')] public static var HCLevel18:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel19.oel', mimeType = 'application/octet-stream')] public static var HCLevel19:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel20.oel', mimeType = 'application/octet-stream')] public static var HCLevel20:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel21.oel', mimeType = 'application/octet-stream')] public static var HCLevel21:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel22.oel', mimeType = 'application/octet-stream')] public static var HCLevel22:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel23.oel', mimeType = 'application/octet-stream')] public static var HCLevel23:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel24.oel', mimeType = 'application/octet-stream')] public static var HCLevel24:Class;
			
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel25.oel', mimeType = 'application/octet-stream')] public static var HCLevel25:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel26.oel', mimeType = 'application/octet-stream')] public static var HCLevel26:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel27.oel', mimeType = 'application/octet-stream')] public static var HCLevel27:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel28.oel', mimeType = 'application/octet-stream')] public static var HCLevel28:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel29.oel', mimeType = 'application/octet-stream')] public static var HCLevel29:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel30.oel', mimeType = 'application/octet-stream')] public static var HCLevel30:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel31.oel', mimeType = 'application/octet-stream')] public static var HCLevel31:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel32.oel', mimeType = 'application/octet-stream')] public static var HCLevel32:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel33.oel', mimeType = 'application/octet-stream')] public static var HCLevel33:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel34.oel', mimeType = 'application/octet-stream')] public static var HCLevel34:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel35.oel', mimeType = 'application/octet-stream')] public static var HCLevel35:Class;
			[Embed(source = '../data/SLF_levelEditor/PC/hclevel36.oel', mimeType = 'application/octet-stream')] public static var HCLevel36:Class;
			
			//Tiles.
			[Embed(source = "../data/level1/level1_tiles.png")] public static var ImgLevel1Tiles:Class;
			[Embed(source = "../data/level2/level2_tiles.png")] public static var ImgLevel2Tiles:Class;
			[Embed(source = "../data/level3/level3_tiles.png")] public static var ImgLevel3Tiles:Class;
			
			//Music
			// Original soundtrack taken out except for this song.
			[Embed(source = "../data/music_128/farewell.mp3")] public static var SndFarewell:Class;	
			
			
			[Embed(source = "../data/sfx_128/Blip_Select.mp3")] public static var SndBlip:Class;
			[Embed(source = "../data/sfx_128/ping.mp3")] public static var SndPing:Class;
			[Embed(source = "../data/sfx_128/ping2.mp3")] public static var SndPing2:Class;
			[Embed(source = "../data/sfx_128/SndOnShoulders.mp3")] public static var SndOnShoulders:Class;
			[Embed(source = "../data/sfx_128/jump.mp3")] public static var SndJump:Class;
			public static var pingVolume:Number = 0.5;
			
			public static var stage:Stage;
			
			
			
			/**
			 * DEMO MODE - FIRST THREE LEVELS
			 * 
			 * --- TURN OFF FOR REAL BUILDS
			 */
			public static var DEMO:Boolean = false;
			public static const DEMO_numberOfLevelsInDemo:int = 2;
			

			public static var filePath:String;
			/**
			 * The version of the game (AIR)
			 */
			public static var version:String;
			
			/**
			 * New version or not.
			 */
			public static var newVersionText:String = "Connecting...";
			
			/**
			 * The XML data of the level
			 */
			public static var level:XML;
			
			/**
			* 1 = Vertical
			* 2 = Horizontal
			*/
						
			public static var splitScreenType:int = 1;
			
			/**
			* Number of players. 1 or 2.
			*/
						
			public static var playersNo:int = 1;
			
			/**
			* 1=Warehouse,2=Factory,3=Mgmt
			*/
						
			public static var levelType:int = 1;
			
			/**
			* Level number 1 - 12;
			* Check levelType for World - Warehouse/factory/mgmt
			* check hardCore for harder levels.
			*/
						
			public static var levelNumber:int = 1;
			
			/**
			* Whether hardCore is turned on or not
			*/
						
			public static var hardCore:Boolean = false;
			
			/**
			* Name of Level
			*/
						
			
			public static var levelName:String;
			
			
			/**
			* Are you playing the demo, or have you loaded your own level.
			*/
			
			
			public static var isPlayingDemo:Boolean;
			
			/**
			* Level number if playing demo.
			*/
			
			
			public static var demoLevel:int;
			
			/**
			* Time left for Winnitron Arcade version
			*/
			
			public static var timeLeft:Number = 50;
			
			/**
			* Amount of time at game initialization
			*/
			
			public static const timeAtStart:Number = 50;
			
			/**
			 * Will this version be a Winnitron Version?
			 */
			
			public static var isWinnitron:Boolean = false;
			
			/**
			 * Will this version be a PC Version?
			 */
			
			public static var isPCVersion:Boolean = true;	
			
			/**
			 * Set to true if playing a custom loaded level.
			 * Helps go back to the right menu.
			 */
			
			public static var isPlayingCustomLevel:Boolean = false;
			
			/**
			* Level number if playing Winnitron.
			*/
			
			public static var winniLevel:int;
			
			/**
			* Enable Mouse?
			*/
			
			public static var mouseEnabled:Boolean = false;
			
			/**
			* Exits will pass in the next level to go to.
			*/
			
			public static var winniNextLevel:int;
			
			
			/**
			* Exits will pass in the next level to go to.
			*/
			
			public static var endingType:int = 0;	
			
			
			/*
			 * Are we in Attract Mode?
			 */
			 
			public static var attractMode:Boolean = false;
			
			/*
			 * Old School mode does away with the menus and issues three lives for the whole game.
			 */
			 
			public static var oldSchoolMode:Boolean = false;			
			
			public static var oldSchoolLivesM:int = 3;	
			public static var oldSchoolLivesF:int = 3;	
			
			
			/**
			 * Can jump. Used to eliminate jumps when pressing restart
			 * 
			 */
			public static var canJump:Boolean = true;
			
			
			/**
			 * Restart Music
			 */
			
			public static var restartMusic:Boolean = false;
			
			
			public static const WAREHOUSE_PURPLE:uint = 0xC082FF;
			public static const FACTORY_GREEN:uint = 0x62D593;
			public static const MGMT_BROWN:uint = 0xFFAA82;
			public static const GREY:uint = 0x7D7D7D;
			
			public static const xPos1:int = FlxG.width / 2 - 140 - 40;
			public static const xPos2:int = FlxG.width / 2  - 40;
			public static const xPos3:int = FlxG.width / 2 + 140 - 40;
			
			public static const yPos1:int = 20+40;
			public static const yPos2:int = 80+40;
			public static const yPos3:int = 120+40;		
			public static const yPos4:int = 160+40;		
			public static const yPos5:int = 200+40;		
			public static const yPos6:int = 240 + 40;	
			public static const yPos7:int = 280 + 40;	
			
			
			
			// button positions
			
			public static const ySmallPos0:int = 30;
			public static const ySmallPos1:int = 60;
			public static const ySmallPos2:int = 90;
			public static const ySmallPos3:int = 120;
			public static const ySmallPos4:int = 150;
			public static const ySmallPos5:int = 180;
			public static const ySmallPos6:int = 210;
			public static const ySmallPos7:int = 240;
			public static const ySmallPos8:int = 270;
			public static const ySmallPos9:int = 300;
			public static const ySmallPos10:int = 330;
			
			
		
		
			
			// *****************
			// Level Tester Keys
			// *****************
			
			
			public static var p1Left:String = "LEFT";
			public static var p1Right:String = "RIGHT";
			public static var p1Up:String = "UP";
			public static var p1Down:String = "DOWN";
			public static var p1Action:String = "X";			
			public static var p1Jump:String = "C";
			public static var p1Switch:String = "V";
			public static var p1Piggyback:String = "B";
			
			public static var p2Left:String = "A";
			public static var p2Right:String = "D";
			public static var p2Up:String = "W";
			public static var p2Down:String = "S";		
			public static var p2Jump:String = "T";
			public static var p2Action:String = "R";
			public static var p2Switch:String = "Y";
			public static var p2Piggyback:String = "U";
			
			public static var homeKey:String = "ONE";
			
			
			
			// *****************
			// Winnitron Keys
			// *****************
			
			if (isWinnitron) {
				p1Left = "LEFT";
				p1Right = "RIGHT";
				p1Up = "UP";
				p1Down = "DOWN";		
				p1Jump = "X";
				p1Action = "Z";
				
				p2Left = "J";
				p2Right = "L";
				p2Up = "I";
				p2Down = "K";		
				p2Jump = "M";
				p2Action = "N";
				
				p1Switch = "E";
				p2Switch = "R";
				
				homeKey = "ONE";
			}

			

                public function Registry()
                {
					
                }

        }
}