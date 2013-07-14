package  
{
	import org.flixel.FlxG;
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
		[Embed(source = "/../tilemaps/hublevel.txt", mimeType = "application/octet-stream")] public static var TMAP_Map_HUB:Class;
		[Embed(source = "/../tilemaps/dungeon.txt", mimeType = "application/octet-stream")] public static var TMAP_Dungeon:Class;
		[Embed(source = "/../tilemaps/disco.csv", mimeType = "application/octet-stream")] public static var TMAP_DiscoMap:Class;
		[Embed(source = "/../tilemaps/malio.csv", mimeType = "application/octet-stream")] public static var TMAP_MalioMap:Class;
		[Embed(source = "/../tilemaps/paperscraps.csv", mimeType = "application/octet-stream")] public static var TMAP_PaperscrapsMap:Class;
		[Embed(source = "/../tilemaps/tower.csv", mimeType = "application/octet-stream")] public static var TMAP_TowerMap:Class;
		[Embed(source = "/../tilemaps/boss.txt", mimeType = "application/octet-stream")] public static var TMAP_BossMap:Class;
		

		//SPRITES
		//[Embed(source = "/../assets/gameart/test_player_cropped.png")] public static var GFX_Player:Class;
		[Embed(source = "/../assets/gameart/player.png")] public static var GFX_Player:Class;
		[Embed(source = "/../assets/gameart/fireball.png")] public static var GFX_Fireball:Class;
		[Embed(source = "/../assets/gameart/door.png")] public static var GFX_Door:Class;
		[Embed(source = "../assets/gameart/flyingpig.png")] public static var GFX_FlyingPig:Class
		[Embed(source = "../assets/gameart/scissors.png")] public static var GFX_Scissors:Class
		[Embed(source = "../assets/gameart/lapoubelle.png")] public static var GFX_Poubelle:Class;
		[Embed(source = "../assets/gameart/computer.png")] public static var GFX_Computere:Class;
		[Embed(source = "../assets/gameart/penguin.png")] public static var GFX_Penguin:Class;
		[Embed(source="../assets/gameart/trashcan.png")] public static var GFX_Trashcan:Class;
		[Embed(source="../assets/gameart/movingspikes.png")] public static var GFX_Movingspikes:Class;
		[Embed(source = "../assets/gameart/WhiteKnight.png")] public static var GFX_WhiteKnight:Class;
		[Embed(source="../assets/gameart/axe.png")] public static var GFX_Axe:Class;
		
		
		//OTHER ART
		[Embed(source = "/../assets/gameart/hub_background.png")] public static var GFX_HUB_Background:Class; 
		[Embed(source = "/../assets/gameart/TheEnd.png")] public static var GFX_THE_END:Class;
		[Embed(source = "/../assets/gameart/StartSprite.png")] public static var GFX_THE_START:Class;
		
		//TUNEZ
		[Embed(source = "/../assets/sounds/prock.mp3")] public static var SND_Partyrock:Class; 
		[Embed(source = "/../assets/sounds/jump.mp3")] public static var SND_Jump:Class; 
		[Embed(source = "/../assets/sounds/throw.mp3")] public static var SND_Throw:Class; 
		[Embed(source = "/../assets/sounds/playerdie.mp3")] public static var SND_Playerdie:Class; 
		[Embed(source = "/../assets/sounds/enemydie.mp3")] public static var SND_Enemydie:Class; 
		[Embed(source = "/../assets/sounds/nextlevel.mp3")] public static var SND_Nextlevel:Class;
		[Embed(source = "/../assets/sounds/Tower 1.mp3")] public static var SND_TowerLevel:Class;
		[Embed(source = "/../assets/sounds/Mario Level 1.mp3")] public static var SND_MarioLevel:Class;
	}
}