import 'package:anime_chauteco/Modules/AnimeDetail/AnimeDetail.dart';
import 'package:anime_chauteco/Modules/AnimeDetail/AnimeDetail.dart';
import 'package:anime_chauteco/Modules/Home/Anime.dart';
import 'package:anime_chauteco/Modules/Network/Network.dart';
import 'package:anime_chauteco/Modules/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class AnimeDetailPage extends StatelessWidget {
  Anime anime;

  AnimeDetailPage({Key key, @required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
        backgroundColor: AppColors.appBar,
      ),

      body: DetailView(anime: anime),

      backgroundColor: AppColors.backroudApp,
    );
  }
}

class DetailView extends StatefulWidget {
  final Anime anime;

  DetailView({Key key, @required this.anime}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState(anime: anime);
}

class _DetailViewState extends State<DetailView> {
  final network = Network.instance;
  final Anime anime;
  AnimeDetail _animeDetail;

  _DetailViewState({Key key, @required this.anime}) : super();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    network.getInfoForAnime(anime.animeId, (data){
      setState(() {
        _animeDetail = AnimeDetail.fromMap(data); 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FadeInImage.assetNetwork(
          fadeInCurve: Curves.slowMiddle,
          placeholder: "assets/images/Rolling-1s-200px.gif",
          image: _animeDetail != null ? _animeDetail.imageUrl : "assets/images/Rolling-1s-200px.gif",
        )
      ],
    );
  }
}


