class GameImage {
  String url;
  String title;

  GameImage(this.url, this.title);
}

class Game {
  String title;
  GameImage coverImage;
  List<GameImage> images;
  String description;
  String studio;

  Game(this.title, this.coverImage, this.description, this.studio,
      [this.images = const []]);
}

List<Game> games = [
  Game(
    "Horizon Zero Dawn",
    GameImage("https://images7.alphacoders.com/718/thumb-1920-718521.jpg", ""),
    "",
    "Guerrilla Games",
  ),
  Game(
    "Metro Exodus",
    GameImage("https://images3.alphacoders.com/991/991929.jpg", ""),
    "",
    "4A Games",
  ),
  Game(
    "Tom Clancy's The Division 2",
    GameImage(
        "https://cdn.division.zone/uploads/2019/03/tc-the-division-2-preload-start-times-sizes-header.jpg",
        ""),
    "",
    "Massive Entertainment",
  ),
  Game(
    "Resident Evil 4",
    GameImage("https://wallpaperaccess.com/full/1853821.jpg", ""),
    "",
    "Capcom",
  ),
];

List<Game> games2 = [
  Game(
    "Grand Theft Auto V",
    GameImage(
        "https://gpstatic.com/acache/26/25/1/uk/packshot-7136bdab871d6b2c8f07ccc9ad33b4d0.jpg",
        ""),
    "",
    "Rockstar Games",
  ),
  Game(
    "The Last of Us Part II",
    GameImage("https://wallpapercave.com/wp/wp5801995.jpg", ""),
    "",
    "Naughty Dog",
  ),
  Game(
    "Sekiro: Shadows Die Twice",
    GameImage("https://images5.alphacoders.com/100/thumb-1920-1004016.jpg", ""),
    "",
    "From Software",
  ),
  Game(
    "Just Cause 4",
    GameImage(
        "https://s3.gaming-cdn.com/images/products/2666/orig/just-cause-4-cover.jpg",
        ""),
    "",
    "Avalanche Studios",
  ),
];

List<Game> featuredGames = [
  Game(
    "Black Myth: Wukong",
    GameImage("https://wallpapercave.com/wp/wp7954352.jpg", ""),
    "",
    "Feral Interactive",
  ),
  Game(
    "Ghost of Tsushima",
    GameImage("https://wallpapercave.com/wp/wp6364471.jpg", ""),
    "",
    "Infinity Ward",
  ),
  Game(
    "Elden Ring",
    GameImage("https://images3.alphacoders.com/121/thumb-1920-1214925.jpg", ""),
    "",
    "CyberConnect2",
  ),
  Game(
    "forza horizon 5",
    GameImage("https://wallpapercave.com/wp/wp12405298.jpg", ""),
    "",
    "NetherRealm Studios",
  )
];
