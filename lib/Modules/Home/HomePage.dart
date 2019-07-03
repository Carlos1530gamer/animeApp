import 'package:anime_chauteco/Modules/AnimeDetail/AnimeDetailPage.dart';
import 'package:anime_chauteco/Modules/Home/RecomendAnimeRow.dart';
import 'package:anime_chauteco/Modules/Network/Network.dart';
import 'package:anime_chauteco/Modules/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'Anime.dart';
import 'HomePageConstans.dart';

final constants = HomePageConstants.instance;
class HomePage extends StatelessWidget {
  //var _recomendAnimes = List<Anime>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(constants.tittle),
        backgroundColor: AppColors.appBar,
      ),

      body: RecomendAnimeList(),
      backgroundColor: AppColors.backroudApp,
    );
  }
}

class RecomendAnimeList extends StatefulWidget {
  @override
  _RecomendAnimeListState createState() => _RecomendAnimeListState();
}

class _RecomendAnimeListState extends State<RecomendAnimeList> {
  final network = Network.instance;
  var _actualPage = 1;
  var _controller = ScrollController();
  var _recomedAnimeList = List<Anime>();

  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener(_scrollListener);
    super.initState();
    network.getPopularAnime((data){
      for(final animeMap in data){
        final anime = Anime.fromMap(animeMap);
        setState(() {
          _recomedAnimeList.add(anime); 
        });
      }
    }, _actualPage);
  }

  @override
  Widget build(BuildContext context) {
    final screenSzie = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: screenSzie.height,
        width: screenSzie.width - 50.0,
        child: ListView.separated(
          separatorBuilder: (context,index) => Divider(color: Colors.transparent),
          itemCount: _recomedAnimeList.length,
          itemBuilder: (context, index){
            return GestureDetector(
              child: RecomendAnimeRow(anime: _recomedAnimeList[index]),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context){
                      return AnimeDetailPage(anime: _recomedAnimeList[index]);
                    }
                  )
                );
              },
            );
          },
          controller: _controller,
        ),
      ),
    );
  }

  void _scrollListener(){
    if(_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange){
      _actualPage++;
      getNewAnimes();
    }
  }

  void getNewAnimes(){
    network.getPopularAnime((data){
      for(final animeMap in data){
        final anime = Anime.fromMap(animeMap);
        setState(() {
          _recomedAnimeList.add(anime); 
        });
      }
    }, _actualPage);
  }
}