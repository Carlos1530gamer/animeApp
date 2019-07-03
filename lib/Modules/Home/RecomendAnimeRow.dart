import 'package:anime_chauteco/Modules/Home/Anime.dart';
import 'package:anime_chauteco/Modules/Utils/AppColors.dart';
import 'HomePageConstans.dart';
import 'package:flutter/material.dart';

final constants = HomePageConstants.instance;

class RecomendAnimeRow extends StatelessWidget {
  Anime anime;

  RecomendAnimeRow({Key key, @required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final radius = Radius.circular(40.0);
    return Container(
      height: screenSize.height / 2,
      decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(anime.imageUrl),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ScoreView(
            score: anime.score.toString(),
            animeType: anime.animeType,
          ),
          TittleAnimeRow(animeTittle: anime.title),
        ],
      ),
    );
  }
}

class TittleAnimeRow extends StatelessWidget {
  String animeTittle;

  TittleAnimeRow({Key key, @required this.animeTittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _radius = Radius.circular(40.0);
    return Center(
      child: Container(

        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.only(
            bottomLeft: _radius,
            bottomRight: _radius,
          )
        ),
        height: 80.0,
        width: size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              animeTittle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
                fontSize: 21.0
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreView extends StatelessWidget {
  String score;
  final String animeType;

  ScoreView({Key key, @required this.score, @required this.animeType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TypeItemView(
            animeType: animeType,
          ),
          Spacer(),
          RatedItemView(
            animeScore: score,
          )
        ],
      ),
    );
  }
}

class TypeItemView extends StatelessWidget {
  final String animeType;
  final _radius = Radius.circular(40.0);

  TypeItemView({Key key, @required this.animeType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.gray,
        borderRadius: BorderRadius.only(
          topLeft: _radius,
          bottomRight: _radius
        )
      ),
      width: 80.0,
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: Center(
          child: Image.asset("assets/images/$animeType.png"),
        ),
      ),
    );
  }
}

class RatedItemView extends StatelessWidget {
  final _radius = Radius.circular(40.0);
  final String animeScore;

  RatedItemView({Key key, @required this.animeScore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.only(
          topRight: _radius,
          bottomLeft: _radius
        ),
        shape: BoxShape.rectangle
      ),
      width: 90.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            children: <Widget>[
              Image.asset("assets/images/Star.png"),
              Text(
                animeScore,
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


