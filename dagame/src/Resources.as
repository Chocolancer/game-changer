package  
{
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Resources 
	{
		//TILES
		[Embed(source = "/../assets/tiles/raymario.png")] public static var GFX_TestTileSet:Class;
		[Embed(source = "/../assets/tiles/chromatic.png")] public static var GFX_ChromaticTileSet:Class; 
		[Embed(source = "/../assets/tiles/disco.png")] public static var GFX_DiscoTileSet:Class;
		[Embed(source = "/../assets/tiles/malio.png")] public static var GFX_MalioTileSet:Class;
		[Embed(source = "/../assets/tiles/paperscraps.png")] public static var GFX_PaperscrapsTileSet:Class;
		[Embed(source = "/../assets/tiles/tower.png")] public static var GFX_TowerTileSet:Class;
		[Embed(source = "/../assets/gameart/hub_tiles.png")] public static var GFX_TSET_HUBTiles:Class; 
		
		//TILEMAPS
		[Embed(source = "/../tilemaps/testmap.txt", mimeType = "application/octet-stream")] public static var TMAP_Map:Class;
		//[Embed(source = "/../tilemaps/hublevel.txt", mimeType = "application/octet-stream")] public static var TMAP_Map_HUB:Class;
		[Embed(source = "/../tilemaps/mapCSV_Group1_Map1.csv", mimeType = "application/octet-stream")] public static var TMAP_Map_HUB:Class;
		[Embed(source = "/../tilemaps/disco.csv", mimeType = "application/octet-stream")] public static var TMAP_DiscoMap:Class;
		[Embed(source = "/../tilemaps/malio.csv", mimeType = "application/octet-stream")] public static var TMAP_MalioMap:Class;
		[Embed(source = "/../tilemaps/paperscraps.csv", mimeType = "application/octet-stream")] public static var TMAP_PaperscrapsMap:Class;
		[Embed(source = "/../tilemaps/tower.csv", mimeType = "application/octet-stream")] public static var TMAP_TowerMap:Class;
		
		//SPRITES
		[Embed(source = "/../assets/gameart/test_player_cropped.png")] public static var GFX_Player:Class;
		[Embed(source = "/../assets/gameart/fireball.png")] public static var GFX_Fireball:Class;
		
		//OTHER ART
		[Embed(source = "/../assets/gameart/hub_background.png")] public static var GFX_HUB_Background:Class; 
		[Embed(source = "/../assets/gameart/TheEnd.png")] public static var GFX_THE_END:Class;
		[Embed(source = "/../assets/gameart/TheStart.png")] public static var GFX_THE_START:Class; 

		
		

		
		
		
		
		
		


		
		
		public function Resources() 
		{
			
		}
		
		
		
		
	}

}