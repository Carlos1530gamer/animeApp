class AnimeDetail {
  String imageUrl;
  String youtubeVideoUrl;
  String sinopsis;

  AnimeDetail.fromMap(Map map){
    this.imageUrl = map["image_url"] as String;
    this.youtubeVideoUrl = map["trailer_url"] as String;
    this.sinopsis = map["synopsis"] as String;
  }
}