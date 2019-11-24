import 'dart:convert';

import 'package:http/http.dart' as http;


class Network {
  static const urlBase = "https://api.jikan.moe/v3";

  static final instance = Network();

  void getPopularAnime(Function completion(List data), int page) async{
    final newUrl = urlBase + "/top/anime/" + page.toString() +"/airing";
    http.Response response = await http.get(newUrl);
    final jsonData = json.decode(response.body);
    final data = jsonData["top"] as List;
    completion(data);
  }

  Future<void> getInfoForAnime(int animeId, Future<Function> completion(data)) async {
    final newUrl = urlBase + "/anime/" + animeId.toString();

    http.Response response = await http.get(newUrl);
    final jsonData = json.decode(response.body);
    completion(jsonData);
  }
}