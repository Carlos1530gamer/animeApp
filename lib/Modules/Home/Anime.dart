import 'dart:core';

class Anime {
  String title;
  dynamic animeId;
  String imageUrl;
  String animeType;
  dynamic score;

  Anime(String tittle, dynamic animeId, String imageUrl, dynamic score, String animeType){
    this.title = tittle;
    this.animeId = animeId;
    this.imageUrl = imageUrl;
    this.score = score;
    this.animeType = animeType;
  }

  static Anime fromMap(Map map){
    final animeId = map["mal_id"] as dynamic;
    final tittle = map["title"] as String;
    final imageUrl = map["image_url"] as String;
    final score = map["score"] as dynamic;
    final animeType = map["type"] as String;
    return Anime(tittle, animeId, imageUrl, score, animeType);
  }
}