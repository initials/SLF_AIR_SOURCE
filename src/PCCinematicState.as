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
 * PCCinematicState.as
 * Created On: 14/05/2012 11:07 PM
 */
 
package 
{
	import org.flixel.*;
	import org.flixel.system.FlxTile;

	public class PCCinematicState extends FlxState
	{
		[Embed(source="../data/C64.ttf",fontFamily="commodore",embedAsCFF="false")] protected var c64:String;
		
		[Embed(source = '../data/sfxVoice128/notepad0.mp3')] private var SndNotePad0:Class;
		[Embed(source = '../data/sfxVoice128/notepad1.mp3')] private var SndNotePad1:Class;
		[Embed(source = '../data/sfxVoice128/notepad2.mp3')] private var SndNotePad2:Class;
		[Embed(source = '../data/sfxVoice128/notepad3.mp3')] private var SndNotePad3:Class;
		[Embed(source = '../data/sfxVoice128/notepad4.mp3')] private var SndNotePad4:Class;
		[Embed(source = '../data/sfxVoice128/notepad5.mp3')] private var SndNotePad5:Class;
		[Embed(source = '../data/sfxVoice128/notepad6.mp3')] private var SndNotePad6:Class;		
		[Embed(source = '../data/sfxVoice128/army1.mp3')] private var SndArmy1:Class;
		[Embed(source = '../data/sfxVoice128/army2.mp3')] private var SndArmy2:Class;
		[Embed(source = '../data/sfxVoice128/army3.mp3')] private var SndArmy3:Class;				
		[Embed(source = '../data/sfxVoice128/chef1.mp3')] private var SndChef1:Class;
		[Embed(source = '../data/sfxVoice128/chef2.mp3')] private var SndChef2:Class;
		[Embed(source = '../data/sfxVoice128/chef3.mp3')] private var SndChef3:Class;
		[Embed(source = '../data/sfxVoice128/worker1.mp3')] private var SndWorker1:Class;
		[Embed(source = '../data/sfxVoice128/worker2.mp3')] private var SndWorker2:Class;
		[Embed(source = '../data/sfxVoice128/worker3.mp3')] private var SndWorker3:Class;		
		[Embed(source = '../data/sfxVoice128/inspector1.mp3')] private var SndInspector1:Class;
		[Embed(source = '../data/sfxVoice128/inspector2.mp3')] private var SndInspector2:Class;
		[Embed(source = '../data/sfxVoice128/inspector3.mp3')] private var SndInspector3:Class;
		[Embed(source = '../data/sfxVoice128/inspector4.mp3')] private var SndInspector4:Class;
		[Embed(source = '../data/sfxVoice128/inspector5.mp3')] private var SndInspector5:Class;
		[Embed(source = '../data/sfxVoice128/inspector6.mp3')] private var SndInspector6:Class;	
		
		[Embed(source = "../data/notepadTiles.png")] private var ImgNotepadTiles:Class;
		[Embed(source = "../data/speechBubbleTiles.png")] private var ImgSpeechBubble:Class;
		[Embed(source = "../data/HUD/congrats330x31.png")] private var ImgCongrats:Class;
		
		[Embed(source = "../data/conveyorBeltBlockWithEnds.png")] private var ImgConveyorBelt:Class;
		[Embed(source = "../data/warehouse_back.png")] private var Warehouse:Class;
		[Embed(source = "../data/shelfLayer.png")] private var ImgShelves:Class;
		[Embed(source = "../data/level1_leftSideMG.png")] private var ImgBags1:Class;
		[Embed(source = "../data/level1_rightSideMG.png")] private var ImgBags2:Class;				
		[Embed(source = "../data/level1_windows.png") ] private var level1_windows:Class;
		[Embed(source = "../data/level1/noticeBoard.png") ] private var noticeBoard:Class;
		[Embed(source = "../data/level1/cratesBox.png") ] private var cratesBox:Class;
		[Embed(source = "../data/level1/L1_Shelf.png") ] private var L1_Shelf:Class;
		[Embed(source = "../data/level1/level1_shelfTile.png") ] private var level1_shelfTile:Class;
		[Embed(source = "../data/level1/sodaPack.png") ] private var sodaPack:Class;
		[Embed(source = "../data/level1/sugarBags.png") ] private var sugarBags:Class;
		[Embed(source = "../data/level1/sugarBagsAndCrates.png") ] private var sugarBagsAndCrates:Class;
		[Embed(source = "../data/level1/palettes.png") ] private var palettes:Class;		
		[Embed(source = "../data/level1/level1_specialBlock.png") ] private var level1_specialBlock:Class;
		[Embed(source = "../data/level1/level1_specialPlatform.png") ] private var level1_specialPlatform:Class;
		[Embed(source = "../data/level1/level1_bgSmoothGrad.png") ] private var level1_bgSmoothGrad:Class;		
		[Embed(source = "../data/level1/spike0.png") ] private var spike0:Class;
		[Embed(source = "../data/level1/spike1.png") ] private var spike1:Class;
		[Embed(source = "../data/level1/spike2.png") ] private var spike2:Class;
		[Embed(source = "../data/level1/spike3.png") ] private var spike3:Class;				
		[Embed(source = "../data/level2/level2_specialBlock.png") ] private var level2_specialBlock:Class;
		[Embed(source = "../data/level2/level2_specialPlatform.png") ] private var level2_specialPlatform:Class;		
		[Embed(source = "../data/level2/level2_spike0.png") ] private var level2_spike0:Class;
		[Embed(source = "../data/level2/level2_spike1.png") ] private var level2_spike1:Class;
		[Embed(source = "../data/level2/level2_spike2.png") ] private var level2_spike2:Class;
		[Embed(source = "../data/level2/level2_spike3.png") ] private var level2_spike3:Class;		
		[Embed(source = "../data/level2/level2_gradient.png") ] private var level2_gradient:Class;		
		[Embed(source = "../data/level2/level2_braceLeft.png") ] private var level2_braceLeft:Class;
		[Embed(source = "../data/level2/level2_braceRight.png") ] private var level2_braceRight:Class;
		[Embed(source = "../data/level2/level2_chainTile.png") ] private var level2_chainTile:Class;
		[Embed(source = "../data/level2/level2_FMG3.png") ] private var level2_FMG3:Class;
		[Embed(source = "../data/level2/level2_greenPipe.png") ] private var level2_greenPipe:Class;
		[Embed(source = "../data/level2/level2_metalPipe.png") ] private var level2_metalPipe:Class;
		[Embed(source = "../data/level2/level2_MG2.png") ] private var level2_MG2:Class;
		[Embed(source = "../data/level2/level2_pipe1.png") ] private var level2_pipe1:Class;
		[Embed(source = "../data/level2/level2_tank.png") ] private var level2_tank:Class;
		[Embed(source = "../data/level2/level2_window.png") ] private var level2_window:Class;		
		[Embed(source = "../data/level3/level3_window.png") ] private var level3_window:Class;		
		[Embed(source = "../data/level3/bookCase.png") ] private var bookCase:Class;
		[Embed(source = "../data/level3/filingCab1.png") ] private var filingCab1:Class;
		[Embed(source = "../data/level3/filingCab2.png") ] private var filingCab2:Class;
		[Embed(source = "../data/level3/plant1.png") ] private var plant1:Class;
		[Embed(source = "../data/level3/plant2.png") ] private var plant2:Class;		
		[Embed(source = "../data/level3/level3_cloud.png") ] private var level3_cloud:Class;
		[Embed(source = "../data/level3/level3_desk1.png") ] private var level3_desk1:Class;
		[Embed(source = "../data/level3/level3_desk2.png") ] private var level3_desk2:Class;
		[Embed(source = "../data/level3/level3_desk3.png") ] private var level3_desk3:Class;		
		[Embed(source = "../data/level3/level3_MG_pylon.png") ] private var level3_MG_pylon:Class;
		[Embed(source = "../data/level3/level3_gradient.png") ] private var level3_gradient:Class;		
		[Embed(source = "../data/level3/level3_painting1.png") ] private var level3_painting1:Class;
		[Embed(source = "../data/level3/level3_painting2.png") ] private var level3_painting2:Class;
		[Embed(source = "../data/level3/level3_painting3.png") ] private var level3_painting3:Class;		
		[Embed(source = "../data/level3/level3_salesChart.png") ] private var level3_salesChart:Class;			
		[Embed(source = "../data/level1/level1_specialPlatformSmall.png") ] private var level1_specialPlatformSmall:Class;	
		[Embed(source = "../data/level2/level2_specialPlatformSmall.png") ] private var level2_specialPlatformSmall:Class;	
		[Embed(source = "../data/level3/level3_specialPlatformSmall.png") ] private var level3_specialPlatformSmall:Class;			
		[Embed(source = "../data/pickups/andreCheckPoint.png") ] private var andreCheckPoint:Class;		
		[Embed(source = "../data/pickups/liselotCheckPoint.png") ] private var liselotCheckPoint:Class;				
		[Embed(source = "../data/level3/level3_specialBlock.png") ] private var level3_specialBlock:Class;
		[Embed(source = "../data/level3/level3_specialPlatform.png") ] private var level3_specialPlatform:Class;		
		[Embed(source = "../data/level3/level3_spike0.png") ] private var level3_spike0:Class;
		[Embed(source = "../data/level3/level3_spike1.png") ] private var level3_spike1:Class;
		[Embed(source = "../data/level3/level3_spike2.png") ] private var level3_spike2:Class;
		[Embed(source = "../data/level3/level3_spike3.png") ] private var level3_spike3:Class;			
		[Embed(source = "../data/tiles.png")] private var ImgAutoTiles:Class;
		[Embed(source = "../data/level1_tiles.png")] private var ImgTiles:Class;
		[Embed(source = "../data/speechBubbleTiles.png")] private var ImgSpeechTiles:Class;
		[Embed(source = "../data/level2/level2_tiles.png")] private var ImgTiles2:Class;
		[Embed(source = "../data/level3/level3_tiles.png")] private var ImgTiles3:Class;
		[Embed(source = "../data/tilesBrownBase.png")] private var ImgTilesBrownBase:Class;
		[Embed(source = "../data/bubble.png")] private var ImgBubbles:Class;
		[Embed(source = "../data/pickups/crateShards.png")] private var ImgCrateShards:Class;	
		[Embed(source = "../data/sfx_128/SndOnShoulders.mp3")] protected var SndOnShoulders:Class;		
		[Embed(source = "../data/sfx_128/whoosh.mp3")] protected var SndWhoosh:Class;		
		[Embed(source = "../data/sfx_128/SndExp.mp3")] protected var SndExp:Class;		
		[Embed(source = "../data/sfx_128/SwitchCharacters.mp3")] protected var SwitchCharacters:Class;		
		[Embed(source = "../data/sfx_128/deathSFX.mp3")] protected var SndDeath:Class;
		[Embed(source = "../data/sfx_128/initials_empire_tagtone1.mp3")] protected var SndTagTone1:Class;
		[Embed(source = "../data/sfx_128/initials_empire_tagtone4.mp3")] protected var SndTagTone4:Class;
		[Embed(source = "../data/sfx_128/powerUp.mp3")] protected var SndPowerUp:Class;
		[Embed(source = "../data/sfx_128/checkPoint.mp3")] protected var SndCheckPoint:Class;
		
		
		
		private static const interval:int = 50;
		
		
		private var cineBarUpper:FlxSprite;
		private var cineBarLower:FlxSprite;
		private var skipText:FlxText;
		private var nextText:FlxText;
		
		private var _army:EnemyGeneric;
		private var _chef:EnemyGeneric;
		private var _inspector:EnemyGeneric;
		private var _worker:EnemyGeneric;
		private var _player1:EnemyGeneric;
		private var _player2:EnemyGeneric;
		
		private var _counter:int;
		private var _pauseCount:Boolean;
		
		private var currentVoiceOver:FlxSound;
		
		private var currentTalker:String;
		
		private var speechBubbleTextValues:Array;
		
		private var world1CompleteTexts:Array;
		private var world2CompleteTexts:Array;
		private var world3CompleteTexts:Array;		
		
		private var world1CompleteTextshc:Array;
		private var world2CompleteTextshc:Array;
		private var world3CompleteTextshc:Array;
		
		
		
		private var speechText:FlxText;
		private var speechNotepadBubble:FlxTileblock;
		private var congrats:FlxSprite;
		
		
		override public function create():void
		{
		
			
		
							  
			// only use if using a PlayState as the super class.
			//super.create();
			
			currentVoiceOver = new FlxSound();
			
			var bg:FlxTileblock;
			
			if (Registry.levelType==1) {
				FlxG.bgColor = 0xffF8CB8F;
				bg = new FlxTileblock(0, 0, FlxG.width, FlxG.height);
				bg.loadTiles(level1_bgSmoothGrad, 1, 512, 0);
				bg.scrollFactor.x = bg.scrollFactor.y = 0;
				add(bg);
			}
			if (Registry.levelType==2) {
				FlxG.bgColor = 0xff92D588;
				bg = new FlxTileblock(0, 0, FlxG.width, FlxG.height);
				bg.loadTiles(level2_gradient, 1, 512, 0);
				bg.scrollFactor.x = bg.scrollFactor.y = 0;
				add(bg);
			}
			if (Registry.levelType==3) {
				FlxG.bgColor = 0xffE3C179;
				bg = new FlxTileblock(0, 0, FlxG.width, FlxG.height);
				bg.loadTiles(level3_gradient, 1, 512, 0);
				bg.scrollFactor.x = bg.scrollFactor.y = 0;
				add(bg);
			}			
			
			var p:XML;
			var bgTile:FlxTileblock;
			var spr:FlxSprite;
			
			for each(p in Registry.level.BGLayer1.*) {
				if (p.@width != undefined) { 
					bgTile = new FlxTileblock(p.@x, p.@y, p.@width, p.@height);
					bgTile.loadTiles(this[p.name().toString()], 0, 0, 0, false);
					add(bgTile);
				}
				else {
					spr = new FlxSprite(p.@x, p.@y, this[p.name().toString()] );
					add(spr);
				}
			}
			for each(p in Registry.level.BGLayer2.*) {
				if (p.@width != undefined) { 
					bgTile = new FlxTileblock(p.@x, p.@y, p.@width, p.@height);
					bgTile.loadTiles(this[p.name().toString()], 0, 0, 0, false);
					add(bgTile);
				}
				else {
					spr = new FlxSprite(p.@x, p.@y, this[p.name().toString()] );
					add(spr);
				}
			}			
			for each(p in Registry.level.BGLayer3.*) {
				if (p.@width != undefined) { 
					bgTile = new FlxTileblock(p.@x, p.@y, p.@width, p.@height);
					bgTile.loadTiles(this[p.name().toString()], 0, 0, 0, false);
					add(bgTile);
				}
				else {
					spr = new FlxSprite(p.@x, p.@y, this[p.name().toString()] );
					add(spr);
				}
			}	
			
			for each(p in Registry.level.characters.*) {
				if (p.name().toString()=="player") {
					_player1 = new EnemyGeneric(p.@x,p.@y);
					_player1.play("andreidle");
					_player1.facing = FlxObject.RIGHT;
					add(_player1);
					
					//FlxG.camera.follow(_player1, FlxCamera.STYLE_PLATFORMER);
					
				}
				if (p.name().toString()=="liselot") {
					_player2 = new EnemyGeneric(p.@x,p.@y);
					_player2.play("liselotidle");
					_player2.facing = FlxObject.RIGHT;
					add(_player2);	
				}
				
				if (p.name().toString()=="army") {
				
					_army = new EnemyGeneric(p.@x,p.@y);
					_army.play("armyidle");
					_army.facing = FlxObject.LEFT;
					add(_army);
				}
				
				if (p.name().toString()=="chef") {
					_chef = new EnemyGeneric(p.@x,p.@y);
					_chef.play("chefidle");
					_chef.facing = FlxObject.LEFT;
					add(_chef);			
				}
				
				if (p.name().toString()=="inspector") {
					_inspector = new EnemyGeneric(p.@x,p.@y);
					_inspector.play("inspectoridle");
					_inspector.facing = FlxObject.LEFT;			
					add(_inspector);	
				}
				
				if (p.name().toString()=="worker") {
					_worker = new EnemyGeneric(p.@x,p.@y);
					_worker.play("workeridle");
					_worker.facing = FlxObject.LEFT;				
					add(_worker);
				}
			}
			
			for each (var t:XML in Registry.level.solids)
			{
				//figure out the map dimesions based on the xml and set variables			
				//FlxG.log(t);
				
				for each (var u:XML in t.rect) {
			
					var b:FlxTileblock = new FlxTileblock(u.@x, u.@y, u.@w, u.@h);
					if (Registry.levelType==1)
						b.loadTiles(ImgTiles, 10, 10, 0, true);
					else if (Registry.levelType==2)
						b.loadTiles(ImgTiles2, 10, 10, 0, true);
					else if (Registry.levelType==3)
						b.loadTiles(ImgTiles3, 10, 10, 0, true);
					else 
						FlxG.log("Problems selecting tiles to load");
						
					b.solid = true;
					b.immovable = true;
					add(b);
				}
			}
			
			
			
			FlxG.playMusic(Registry.SndFarewell, 0.5);
			
			world1CompleteTexts = new Array("Nothing has changed here since I was a kid.",
			"You know what Thomas Wolfe said about going home?",
			"He had valid points but I'm not George Webber...",
			"...and I'm not interested in re-living my youth.",
			"The future is ours.");
			
			world2CompleteTexts = new Array("Fresh ingredients in, refreshing drinks out.",
			"Yuck, I am drenched in sweat. It's disgusting in here.",
			"Let's get out of here, it's time to go home.",
			"The day escapes.");
			
			world3CompleteTexts = new Array("Owning this factory will be a honor and a challenge.",
			"I think we'll do a great job.",
			"We signed on to supply the military with soft drinks for their rations.",
			"I quite liked the new durian flavor we are now producing.",
			"We won't be adopting our handyman's anarchist ideals.",
			"We've managed to avoid the food inspector's wrath this time.",
			"And us? We're still wildly in love.");
			
			

			world1CompleteTextshc = new Array ("How does it feel to be home?",
			"I grew up here. I thought I knew every inch of this town.",
			"With you by my side it feels like Paris at night.");

			world2CompleteTextshc = new Array ("When the carbon dioxide hits the water, it's magic.",
			"The contents of the bottle is greater than the sum of it's parts.",
			"It's been hard work but well worth it.",
			"We've seen every inch of the factory. Our factory.");
			
			world3CompleteTextshc = new Array ("It turns out the army was working with Henry K. Beecher.",
			"He used our lemonade in his placebo effect research.",
			"Our handyman still brings in socialist libertarian pamphlets.",
			"The food inspector was taking bribes and is now in jail.",
			"We'll see you next time in the sequel.",
			"Super Lemonade Factory II: Assembly Line Simulator.");


			
			speechBubbleTextValues = new Array("In the uncertainty following World War II, Andre and Liselot received a telegram from Andre's father asking the newlyweds to come to the capital.", 
			"Andre's father would be retiring, and leaving the entire factory to Andre and Liselot, provided they can make it through the whole factory.",
			"Each room in this factory serves an important role. Navigate the entire factory, and the whole operation will belong to you.",
			"I knew your father but I don't know you. You must earn my trust.",
			"One speck of dirt and I will bury you...\n \n", //Inspector - 11
			"...in paperwork.\n \n",
			"Hey buddy, I haven't seen you since you were knee high.", //Chef - 4
			"I fix things around here. You'll see me around.\n \n", //Worker - 6
			
			"The factory is the heart of the operations. Heavy, pressurized vats carbonate the sugary drinks.\n \n", // - Notepad (Narrator) - 7
			"The steam and heat down here is oppressive.\n \n",// - Notepad (Narrator) - 8
			"Our operations could use supplies manufactured here.\n \n", // Army General - 9
			"One... uhh... speck of ... dirt.\n \n", //Inspector - 17
			"What do you think about making a durian flavored soft drink?\n \n", //Chef - 10
			"If you see any problems, I can help.\n \n", //Worker - 12
			
			"The management office is on the top floor of the building. The views over the harbor are impressive.\n \n", // - Notepad (Narrator) - 13
			"Making it to the end will earn\nyou the right to own the\nSuper Lemonade Factory.\n \n",// - Notepad (Narrator) - 14
			"We have drawn up contracts for you to supply the army. Will you accept?\n \n", // Army General - 15
			"One... uhh... speck of ... dirt.\n \n", //Inspector - 17
			"The durian soft drink flavor has been a success!\n \n", // Chef - 16
			"So this is how the one percent work. This is extravagant.\n \n", //Worker - 18
			"I'll be around the factory, checking it's up to code.\n \n");
						

			speechNotepadBubble = new FlxTileblock(20, 70, FlxG.width-40, 100);
			speechNotepadBubble.loadTiles(ImgNotepadTiles, 10, 10, 0,true);
			speechNotepadBubble.scrollFactor.x = speechNotepadBubble.scrollFactor.y = 0;
			speechNotepadBubble.visible = false;
			add(speechNotepadBubble);
			
			
			speechText = new FlxText(speechNotepadBubble.x+8, speechNotepadBubble.y+8, FlxG.width-48, "", true);
			speechText.setFormat("commodore", 16);
			speechText.alignment = "left";
			speechText.size = 16;
			speechText.scrollFactor.x = 0;
			speechText.scrollFactor.y = 0;
			speechText.color = 0xff000000;
			speechText.visible = false;
			
			add(speechText);
			
			congrats  = new FlxSprite( 70,120,null);
			congrats.loadGraphic(ImgCongrats, true, false, 330, 31);
			add(congrats);
			congrats.addAnimation("cycle", [0, 1, 2, 3], 4, true);
			congrats.play("cycle");
			congrats.visible = false;
			
			cineBarUpper  = new FlxSprite(0, 0, null);
			cineBarUpper.makeGraphic(FlxG.width, FlxG.height / 5, 0xff000000);
			cineBarUpper.x = 0;
			cineBarUpper.y = 0 - (FlxG.height/5);
			cineBarUpper.scrollFactor.x = cineBarUpper.scrollFactor.y = 0;
			cineBarUpper.velocity.y = 50;
			cineBarUpper.drag.x = cineBarUpper.drag.y = 22;
			this.add(cineBarUpper);   
		
			cineBarLower  = new FlxSprite(0, 0, null);
			cineBarLower.makeGraphic(FlxG.width, FlxG.height / 5, 0xff000000);
			cineBarLower.x = 0;
			cineBarLower.y = FlxG.height;
			cineBarLower.scrollFactor.x = cineBarLower.scrollFactor.y = 0;
			cineBarLower.velocity.y = -50;
			cineBarLower.drag.x = cineBarLower.drag.y = 22;
			this.add(cineBarLower);  	
				
			skipText = new FlxText(0, 12, FlxG.width, "", true);
			skipText.alignment = "right";
			skipText.size = 8;
			skipText.scrollFactor.x = 0;
			skipText.scrollFactor.y = 0;
			add(skipText);
			
			if (FlxG.usingJoystick) {
				skipText.text = "Press Start to skip cut scene";
			}
			else {
				skipText.text = "Press Enter or " + Registry.homeKey + " to skip cut scene";
			}
			
			nextText = new FlxText(0, FlxG.height-30, FlxG.width, "", true);
			nextText.alignment = "right";
			nextText.size = 8;
			nextText.scrollFactor.x = 0;
			nextText.scrollFactor.y = 0;
			add(nextText);
			
			if (FlxG.usingJoystick) {
				nextText.text = "Press A to continue";
			}
			else {
				nextText.text = "Press " + Registry.p1Action + " to continue";
			}
			
			_counter = 0;
			
			//FlxG.log(Registry.levelNumber);
			
		}

		override public function update():void
		{
			if (!_pauseCount) {
				_counter++;
				nextText.visible = false;
			}
			
			if (Registry.levelNumber==1) {
			
				if (Registry.levelType == 1) {

					if (_counter == interval) {
						currentVoiceOver = FlxG.play(SndNotePad0, 1.0, false);
						
						speechText.text = speechBubbleTextValues[0];
						
						this.pause();
					}
					else if (_counter == interval*2) {
						currentVoiceOver = FlxG.play(SndNotePad1, 1.0, false);
						speechText.text = speechBubbleTextValues[1];
						this.pause();
					}
					else if (_counter == interval*3) {
						currentVoiceOver = FlxG.play(SndNotePad2, 1.0, false);
						speechText.text = speechBubbleTextValues[2];
						this.pause();
					}				
					else if (_counter == interval * 4) {
						currentTalker == "army";
						currentVoiceOver = FlxG.play(SndArmy1, 1.0, false);
						speechText.text = speechBubbleTextValues[3];
						_army.play("armytalk");
						this.pause();
					}	
					else if (_counter == (interval * 4) + 1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_army.play("armyidle");
						}
					}				
					else if (_counter == interval*5) {
						currentVoiceOver = FlxG.play(SndInspector4, 1.0, false);
						_army.velocity.x = 50;
						_army.play("armywalk");
						_army.facing = FlxObject.RIGHT;
						speechText.text = speechBubbleTextValues[4];
						_inspector.play("inspectortalk");
						
						this.pause();
					}	
					else if (_counter == (interval*5)+1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_inspector.play("inspectoridle");
						}
					}
					
					else if (_counter == interval*5+4) {
						_inspector.play("inspectortalk");
						speechText.text = speechBubbleTextValues[5];
						currentVoiceOver = FlxG.play(SndInspector5, 1.0, false);
						
						FlxG.camera.zoom = 4;
						FlxG.camera.focusOn(new FlxPoint(_inspector.x,_inspector.y));
						
						this.pause();
					}	
					else if (_counter == (interval*5)+5) {
						if (!currentVoiceOver.active) {
							_counter++;
							_inspector.play("inspectoridle");
						}
					}
					else if (_counter == interval * 6) {
						FlxG.camera.x = 0;
						FlxG.camera.y = 0;
						_inspector.velocity.x = 50;
						_inspector.play("inspectorwalk");
						_inspector.facing = FlxObject.RIGHT;
						speechText.text = speechBubbleTextValues[6];
						_chef.play("cheftalk");
						
						currentVoiceOver = FlxG.play(SndChef1, 1.0, false);
						FlxG.camera.zoom = 2;
						this.pause();
					}
					else if (_counter == (interval*6)+1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_chef.play("chefidle");
						}
					}
					else if (_counter == interval*7) {
						currentVoiceOver = FlxG.play(SndWorker1, 1.0, false);
						_chef.velocity.x = 50;
						_chef.play("chefwalk");
						_chef.facing = FlxObject.RIGHT;
						speechText.text = speechBubbleTextValues[7];
						_worker.play("workertalk");
						this.pause();
					}	
					else if (_counter == (interval*7)+1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_worker.play("workeridle");
						}
					}
					else if (_counter == interval * 8) {
						
						_worker.velocity.x = 50;
						_worker.play("workerwalk");
						_worker.facing = FlxObject.RIGHT;
						
					}
					else if (_counter == interval*9) {
						FlxG.fade(0xff000000, 1, fadeComplete);
					}
				}
				/**
				 * Level 2 - FACTORY --
				 */
				else if (Registry.levelType == 2) {
					if (_counter == interval) {
						currentVoiceOver = FlxG.play(SndNotePad3, 1.0, false);
						speechText.text = speechBubbleTextValues[8];
						this.pause();
					}
					else if (_counter == interval*2) {
						currentVoiceOver = FlxG.play(SndNotePad4, 1.0, false);
						speechText.text = speechBubbleTextValues[9];
						this.pause();
					}			
					else if (_counter == interval * 3) {
						currentTalker == "army";
						currentVoiceOver = FlxG.play(SndArmy2, 1.0, false);
						speechText.text = speechBubbleTextValues[10];
						_army.play("armytalk");
						this.pause();
					}	
					else if (_counter == (interval * 3) + 1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_army.play("armyidle");
						}
					}				
					else if (_counter == interval*4) {
						currentVoiceOver = FlxG.play(SndInspector6, 1.0, false);
						_army.velocity.x = 50;
						_army.play("armywalk");
						_army.facing = FlxObject.RIGHT;
						speechText.text = speechBubbleTextValues[11];
						_inspector.play("inspectortalk");
						
						this.pause();
					}	
					else if (_counter == (interval*4)+1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_inspector.play("inspectoridle");
						}
					}
					else if (_counter == interval * 5) {
						FlxG.camera.x = 0;
						FlxG.camera.y = 0;
						_inspector.velocity.x = 50;
						_inspector.play("inspectorwalk");
						_inspector.facing = FlxObject.RIGHT;
						speechText.text = speechBubbleTextValues[12];
						_chef.play("cheftalk");
						
						currentVoiceOver = FlxG.play(SndChef2, 1.0, false);
						FlxG.camera.zoom = 2;
						this.pause();
					}
					else if (_counter == (interval*5)+1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_chef.play("chefidle");
						}
					}
					else if (_counter == interval*6) {
						currentVoiceOver = FlxG.play(SndWorker2, 1.0, false);
						_chef.velocity.x = 50;
						_chef.play("chefwalk");
						_chef.facing = FlxObject.RIGHT;
						speechText.text = speechBubbleTextValues[13];
						_worker.play("workertalk");
						this.pause();
					}	
					else if (_counter == (interval*6)+1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_worker.play("workeridle");
						}
					}
					else if (_counter == interval*7) {
						_worker.velocity.x = 50;
						_worker.play("workerwalk");
						_worker.facing = FlxObject.RIGHT;
					}
					else if (_counter == interval*8) {
						FlxG.fade(0xff000000, 1, fadeComplete);
					}
				}
				/**
				 * LEVEL 3 - Management --
				 */
				else if (Registry.levelType == 3) {
					if (_counter == interval) {
						currentVoiceOver = FlxG.play(SndNotePad5, 1.0, false);
						speechText.text = speechBubbleTextValues[14];
						this.pause();
					}
					else if (_counter == interval*2) {
						currentVoiceOver = FlxG.play(SndNotePad6, 1.0, false);
						speechText.text = speechBubbleTextValues[15];
						this.pause();
					}			
					else if (_counter == interval * 3) {
						currentTalker == "army";
						currentVoiceOver = FlxG.play(SndArmy3, 1.0, false);
						_army.play("armytalk");
						speechText.text = speechBubbleTextValues[16];
						this.pause();
					}	
					else if (_counter == (interval * 3) + 1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_army.play("armyidle");
						}
					}				
					else if (_counter == interval*4) {
						currentVoiceOver = FlxG.play(SndInspector6, 1.0, false);
						_army.velocity.x = 50;
						_army.play("armywalk");
						_army.facing = FlxObject.RIGHT;
						speechText.text = speechBubbleTextValues[17];
						_inspector.play("inspectortalk");
						
						this.pause();
					}	
					else if (_counter == (interval*4)+1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_inspector.play("inspectoridle");
						}
					}
					else if (_counter == interval * 5) {
						FlxG.camera.x = 0;
						FlxG.camera.y = 0;
						_inspector.velocity.x = 50;
						_inspector.play("inspectorwalk");
						_inspector.facing = FlxObject.RIGHT;
						speechText.text = speechBubbleTextValues[18];
						_chef.play("cheftalk");
						
						currentVoiceOver = FlxG.play(SndChef3, 1.0, false);
						FlxG.camera.zoom = 2;
						this.pause();
					}
					else if (_counter == (interval*5)+1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_chef.play("chefidle");
						}
					}
					else if (_counter == interval*6) {
						currentVoiceOver = FlxG.play(SndWorker3, 1.0, false);
						_chef.velocity.x = 50;
						_chef.play("chefwalk");
						_chef.facing = FlxObject.RIGHT;
						speechText.text = speechBubbleTextValues[19];
						_worker.play("workertalk");
						this.pause();
					}	
					else if (_counter == (interval*6)+1) {
						if (!currentVoiceOver.active) {
							_counter++;
							_worker.play("workeridle");
						}
					}
					else if (_counter == interval*7) {
						_worker.velocity.x = 50;
						_worker.play("workerwalk");
						_worker.facing = FlxObject.RIGHT;
					}
					else if (_counter == interval*8) {
						FlxG.fade(0xff000000, 1, fadeComplete);
					}
				}			
			}
			/**
			 * GAME COMPLETES 
			 */
			
			else if (Registry.levelNumber == 12) {
				if (!Registry.hardCore && Registry.levelType==1) {
					if (_counter == interval) {
						congrats.visible = true;
						this.pause();
						speechNotepadBubble.visible = false;
					}
					else if (_counter == interval * 2) {
						congrats.visible = false;
						speechText.text = world1CompleteTexts[0];
						this.pause();
					}
					else if (_counter == interval * 3) {
						speechText.text = world1CompleteTexts[1];
						this.pause();
					}					
					else if (_counter == interval * 4) {
						congrats.visible = false;
						speechText.text = world1CompleteTexts[2];
						this.pause();
					}
					else if (_counter == interval * 5) {
						speechText.text = world1CompleteTexts[3];
						this.pause();
					}					
					else if (_counter == interval * 6) {
						congrats.visible = false;
						speechText.text = world1CompleteTexts[4];
						this.pause();
					}
					else if (_counter == interval*7) {
						FlxG.fade(0xff000000, 1, fadeComplete);
					}					
				}
				else if (!Registry.hardCore && Registry.levelType==2) {
					if (_counter == interval) {
						congrats.visible = true;
						this.pause();
						speechNotepadBubble.visible = false;
					}
					else if (_counter == interval * 2) {
						congrats.visible = false;
						speechText.text = world2CompleteTexts[0];
						this.pause();
					}
					else if (_counter == interval * 3) {
						speechText.text = world2CompleteTexts[1];
						this.pause();
					}					
					else if (_counter == interval * 4) {
						congrats.visible = false;
						speechText.text = world2CompleteTexts[2];
						this.pause();
					}
					else if (_counter == interval * 5) {
						speechText.text = world2CompleteTexts[3];
						this.pause();
					}					
					else if (_counter == interval*6) {
						FlxG.fade(0xff000000, 1, fadeComplete);
					}					
				}				
				else if (!Registry.hardCore && Registry.levelType==3) {
					if (_counter == interval) {
						congrats.visible = true;
						this.pause();
						speechNotepadBubble.visible = false;
					}
					else if (_counter == interval * 2) {
						congrats.visible = false;
						speechText.text = world3CompleteTexts[0];
						this.pause();
					}
					else if (_counter == interval * 3) {
						speechText.text = world3CompleteTexts[1];
						this.pause();
					}					
					else if (_counter == interval * 4) {
						congrats.visible = false;
						speechText.text = world3CompleteTexts[2];
						this.pause();
					}
					else if (_counter == interval * 5) {
						speechText.text = world3CompleteTexts[3];
						this.pause();
					}					
					else if (_counter == interval * 6) {
						congrats.visible = false;
						speechText.text = world3CompleteTexts[4];
						this.pause();
					}					
					else if (_counter == interval * 7) {
						congrats.visible = false;
						speechText.text = world3CompleteTexts[5];
						this.pause();
					}					
					else if (_counter == interval * 8) {
						congrats.visible = false;
						speechText.text = world3CompleteTexts[6];
						this.pause();
					}
					else if (_counter == interval*9) {
						FlxG.fade(0xff000000, 1, fadeComplete);
					}					
				}				
				else if (Registry.hardCore && Registry.levelType==1) {
					if (_counter == interval) {
						congrats.visible = true;
						this.pause();
						speechNotepadBubble.visible = false;
					}
					else if (_counter == interval * 2) {
						congrats.visible = false;
						speechText.text = world1CompleteTextshc[0];
						this.pause();
					}
					else if (_counter == interval * 3) {
						speechText.text = world1CompleteTextshc[1];
						this.pause();
					}					
					else if (_counter == interval * 4) {
						congrats.visible = false;
						speechText.text = world1CompleteTextshc[2];
						this.pause();
					}
					else if (_counter == interval*5) {
						FlxG.fade(0xff000000, 1, fadeComplete);
					}					
				}
				else if (Registry.hardCore && Registry.levelType==2) {
					if (_counter == interval) {
						congrats.visible = true;
						this.pause();
						speechNotepadBubble.visible = false;
					}
					else if (_counter == interval * 2) {
						congrats.visible = false;
						speechText.text = world2CompleteTextshc[0];
						this.pause();
					}
					else if (_counter == interval * 3) {
						speechText.text = world2CompleteTextshc[1];
						this.pause();
					}					
					else if (_counter == interval * 4) {
						congrats.visible = false;
						speechText.text = world2CompleteTextshc[2];
						this.pause();
					}
					else if (_counter == interval * 5) {
						speechText.text = world2CompleteTextshc[3];
						this.pause();
					}					
					else if (_counter == interval*6) {
						FlxG.fade(0xff000000, 1, fadeComplete);
					}					
				}				
				else if (Registry.hardCore && Registry.levelType==3) {
					if (_counter == interval) {
						congrats.visible = true;
						this.pause();
						speechNotepadBubble.visible = false;
					}
					else if (_counter == interval * 2) {
						congrats.visible = false;
						speechText.text = world3CompleteTexts[0];
						this.pause();
					}
					else if (_counter == interval * 3) {
						speechText.text = world3CompleteTexts[1];
						this.pause();
					}					
					else if (_counter == interval * 4) {
						congrats.visible = false;
						speechText.text = world3CompleteTexts[2];
						this.pause();
					}
					else if (_counter == interval * 5) {
						speechText.text = world3CompleteTexts[3];
						this.pause();
					}					
					else if (_counter == interval * 6) {
						congrats.visible = false;
						speechText.text = world3CompleteTexts[4];
						this.pause();
					}					
					else if (_counter == interval * 7) {
						congrats.visible = false;
						speechText.text = world3CompleteTexts[5];
						this.pause();
					}					
					else if (_counter == interval*8) {
						FlxG.fade(0xff000000, 1, fadeComplete);
					}					
				}						
				
				
			}
			
			if (FlxG.joystick.j1ButtonAJustPressed ||  FlxG.keys.justPressed(Registry.p1Action) ) {
				_pauseCount = false;
				currentVoiceOver.stop();
				currentTalker = "";
				speechNotepadBubble.visible = false;
				speechText.visible = false;
			
			}
			
			if (FlxG.joystick.j1ButtonStartJustPressed || FlxG.keys.justPressed("ENTER") || FlxG.keys.justPressed(Registry.homeKey)) {
				FlxG.fade(0xff000000, 1, fadeComplete);
				currentVoiceOver.stop();
				
			}
			
			super.update();
			
			

		}
		public function pause():void 
		{
			_counter++;
			_pauseCount = true;
			nextText.visible = true;
			speechNotepadBubble.visible = true;
			speechText.visible = true;
			
		}
		
		public function fadeComplete():void {
			if (Registry.levelNumber==1) {
				if (Registry.levelType==1) {
					Registry.level = XML(new Registry.Level1);
					FlxG.switchState(new PCPlayState);
				}
				else if (Registry.levelType==2) {
					Registry.level = XML(new Registry.Level13);
					FlxG.switchState(new PCPlayState);
				}			
				else if (Registry.levelType==3) {
					Registry.level = XML(new Registry.Level25);
					FlxG.switchState(new PCPlayState);
				}	
			}
			else if (Registry.levelNumber == 12) {
				FlxG.switchState(new PCMenuState);
			}
			
			
				
		}
	}
}