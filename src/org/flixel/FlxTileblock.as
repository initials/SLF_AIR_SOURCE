package org.flixel
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	/**
	 * This is a basic "environment object" class, used to create simple walls and floors.
	 * It can be filled with a random selection of tiles to quickly add detail.
	 * 
	 * @author Adam Atomic
	 */
	public class FlxTileblock extends FlxSprite
	{		
		/**
		 * Creates a new <code>FlxBlock</code> object with the specified position and size.
		 * 
		 * @param	X			The X position of the block.
		 * @param	Y			The Y position of the block.
		 * @param	Width		The width of the block.
		 * @param	Height		The height of the block.
		 */
		public function FlxTileblock(X:int,Y:int,Width:uint,Height:uint)
		{
			super(X,Y);
			makeGraphic(Width,Height,0,true);
			active = false;
			immovable = true;
		}
		
		/**
		 * Fills the block with a randomly arranged selection of graphics from the image provided.
		 * 
		 * @param	TileGraphic 	The graphic class that contains the tiles that should fill this block.
		 * @param	TileWidth		The width of a single tile in the graphic.
		 * @param	TileHeight		The height of a single tile in the graphic.
		 * @param	Empties			The number of "empty" tiles to add to the auto-fill algorithm (e.g. 8 tiles + 4 empties = 1/3 of block will be open holes).
		 * @param	Autotile		Uses the Autotile Algo.
		 */
		public function loadTiles(TileGraphic:Class,TileWidth:uint=0,TileHeight:uint=0,Empties:uint=0, Autotile:Boolean=true):FlxTileblock
		{
			if(TileGraphic == null)
				return this;
			
			//First create a tile brush
			var sprite:FlxSprite = new FlxSprite().loadGraphic(TileGraphic,true,false,TileWidth,TileHeight);
			var spriteWidth:uint = sprite.width;
			var spriteHeight:uint = sprite.height;
			var total:uint = sprite.frames + Empties;
			
			//Then prep the "canvas" as it were (just doublechecking that the size is on tile boundaries)
			var regen:Boolean = false;
			if(width % sprite.width != 0)
			{
				width = uint(width/spriteWidth+1)*spriteWidth;
				regen = true;
			}
			if(height % sprite.height != 0)
			{
				height = uint(height/spriteHeight+1)*spriteHeight;
				regen = true;
			}
			if(regen)
				makeGraphic(width,height,0,true);
			else
				this.fill(0);
			
			//Stamp random tiles onto the canvas
			var row:uint = 0;
			var column:uint;
			var destinationX:uint;
			var destinationY:uint = 0;
			var widthInTiles:uint = width/spriteWidth;
			var heightInTiles:uint = height/spriteHeight;
			while(row < heightInTiles)
			{
				destinationX = 0;
				column = 0;
				while(column < widthInTiles)
				{
					if(FlxG.random()*total > Empties)
					{
						if (!Autotile)
							sprite.randomFrame();
							
						else {			
							if (column == 0 && row == 0) { //top left
								sprite.frame = 0;
							}
							else if (column == widthInTiles-1 && row == 0 ) { //top right
								sprite.frame = 1;
							}
							else if (column == 0 && row == heightInTiles-1) { //bottom left
								sprite.frame = 2;
							}
							else if (column == widthInTiles-1 && row == heightInTiles-1) { //bottom right
								sprite.frame = 3;
							}	
							else if (row==0 && column!=0 && column!=widthInTiles-1) { //straight top
								sprite.frame = 4;
							} else if (row==heightInTiles-1 && column!=0 && column!=widthInTiles-1) { //straight bottom
								sprite.frame = 5;
							} else if (column==0 && row!=0 && row!=heightInTiles-1) { //left down straight
								sprite.frame = 6;
							} else if (column==widthInTiles-1 && row!=0 && row!=heightInTiles-1) { //right down straight
								sprite.frame = 7;
							} 
							else {
								sprite.frame = 15;
							}
							
							if (widthInTiles==1 && row==0) { //top single down.
								sprite.frame = 12;
							} else if (widthInTiles==1 && row==heightInTiles-1) { //bottowidthInTiles single down.
								sprite.frame = 13;
							} else if (widthInTiles==1 ) { // single straight down
								sprite.frame = 11;
							} else if (heightInTiles==1 && column==0) { //single flat first
								sprite.frame = 9;
							} else if (heightInTiles==1 && column==widthInTiles-1) { //single flat horizontal last.
								sprite.frame = 10;
							} else if (heightInTiles==1 ) { // single flat horizontal widthInTilesiddle
								sprite.frame = 8;
							}							
					
						}
						sprite.drawFrame();
						stamp(sprite, destinationX, destinationY);
						
						
					}
					destinationX += spriteWidth;
					column++;
				}
				destinationY += spriteHeight;
				row++;
			}
			
			return this;
		}
	}
}
