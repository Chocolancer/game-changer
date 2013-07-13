package  
{
	/**
	 * ...
	 * @author Akari Nakashige
	 */
	public class Resources 
	{
		[Embed(source = "/../assets/gameart/test_player.png")] public static var GFX_Player:Class;
		[Embed(source = "/../assets/gameart/testtileart.png")] public static var GFX_TestTileSet:Class;
		[Embed(source = "/../assets/tiles/chromatic_tileset.png")] public static var GFX_ChromaticTileSet:Class; 
		[Embed(source = "/../tilemaps/testtile.txt", mimeType = "application/octet-stream")] public static var TMAP_Map:Class;
		//[Embed(source = "/../tilemaps/hublevel.txt", mimeType = "application/octet-stream")] public static var TMAP_Map_HUB:Class;
		[Embed(source = "/../tilemaps/mapCSV_Group1_Map1.csv", mimeType = "application/octet-stream")] public static var TMAP_Map_HUB:Class;

		
		
		[Embed(source = "/../assets/gameart/hub_tiles.png")] public static var GFX_TSET_HUBTiles:Class; 
		
		[Embed(source = "/../assets/gameart/hub_background.png")] public static var GFX_HUB_Background:Class; 
		[Embed(source = "/../assets/gameart/TheEnd.png")] public static var GFX_THE_END:Class;
		[Embed(source = "/../assets/gameart/TheStart.png")] public static var GFX_THE_START:Class; 


		
		
		public function Resources() 
		{
			
		}
		
		
		
		
	}

}