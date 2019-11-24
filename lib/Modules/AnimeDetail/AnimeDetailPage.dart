import 'dart:ffi';

import 'package:anime_chauteco/Modules/AnimeDetail/AnimeDetail.dart';
import 'package:anime_chauteco/Modules/AnimeDetail/AnimeDetail.dart';
import 'package:anime_chauteco/Modules/Home/Anime.dart';
import 'package:anime_chauteco/Modules/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimeDetailPage extends StatefulWidget {

  final Anime anime;
  final AnimeDetail animeDetail;

  AnimeDetailPage({Key key, @required this.anime, @required this.animeDetail}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimeDetailPageState(anime: anime, animeDetail: animeDetail);
  }
  
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {

  final Anime anime;
  AnimeDetail animeDetail;

  _AnimeDetailPageState({Key key, @required this.anime, @required this.animeDetail}) : super();

  @override
  Void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(anime.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0
                  ),
                ),
                background: FadeInImage.memoryNetwork(
                  image: animeDetail.imageUrl,
                  placeholder: kTransparentImage,
                  fit: BoxFit.cover,
                )
              ),
            )
          ];
        },
        body: DetailView(
          animeDetail: animeDetail,
        ),
      ),
      backgroundColor: AppColors.backroudApp,
    );
  }
}

class DetailView extends StatefulWidget {
  final AnimeDetail animeDetail;

  DetailView({Key key, @required this.animeDetail}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState(animeDetail: animeDetail);
}

class _DetailViewState extends State<DetailView> {
  AnimeDetail animeDetail;

  _DetailViewState({Key key, @required this.animeDetail}) : super();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

      ],
    );
  }
}


