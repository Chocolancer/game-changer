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
		
		
		[Embed(source = "/../tilemaps/testtile.txt", mimeType = "application/octet-stream")] public static var TMAP_Map:Class;
		[Embed(source = "/../tilemaps/hublevel.txt", mimeType = "application/octet-stream")] public static var TMAP_Map_HUB:Class;

		[Embed(source = "/../assets/gameart/hub_tiles.png")] public static var GFX_TSET_HUBTiles:Class; 
		
		[Embed(source = "/../assets/gameart/hub_background.png")] public static var GFX_HUB_Background:Class; 
		
		public function Resources() 
		{
			
		}
		
		
		
		
	}

}