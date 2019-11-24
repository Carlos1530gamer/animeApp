import 'package:anime_chauteco/Modules/AnimeDetail/AnimeDetail.dart';
import 'package:anime_chauteco/Modules/AnimeDetail/AnimeDetailPage.dart';
import 'package:anime_chauteco/Modules/Home/RecomendAnimeRow.dart';
import 'package:anime_chauteco/Modules/Network/Network.dart';
import 'package:anime_chauteco/Modules/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Anime.dart';
import 'HomePageConstans.dart';

final constants = HomePageConstants.instance;
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(constants.tittle, style: TextStyle(color: Colors.white)),
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
        width: screenSzie.width,
        child: StaggeredGridView.countBuilder(
          itemCount: _recomedAnimeList.length,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (context, index) => GestureDetector(
            child: RecomendAnimeRow(anime: _recomedAnimeList[index]),
            onTap: () async {
              AnimeDetail _animeDetail;

              await network.getInfoForAnime(_recomedAnimeList[index].animeId, (data){
                 _animeDetail = AnimeDetail.fromMap(data);
              });

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AnimeDetailPage(anime: _recomedAnimeList[index], animeDetail: _animeDetail);
                  }
                )
              );
            },
          ),
          staggeredTileBuilder: (index) => StaggeredTile.count(2, index.isEven ? 4 : 3),
          controller: _controller,
        )
      )
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