import 'package:flutter/material.dart';
import 'package:netflix_clone_coding/model/model_movie.dart';
import 'package:netflix_clone_coding/screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;
  CircleSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('미리보기'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal, //좌우 스크롤
              children: makeCircleImages(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          //정보 버튼을 눌렀을때 해당 영화 정보가 나오게 하는 로직
          Navigator.of(context).push(MaterialPageRoute<Null>(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  //디테일 화면이 보여짐
                  movie: movies[i],
                );
              }));
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage('./images/' + movies[i].poster),
              radius: 48,
            ),
          ),
        ),
      ),
    );
  }
  return results;
}
