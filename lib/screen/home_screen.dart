import 'package:flutter/material.dart';
import 'package:netflix_clone_coding/model/model_movie.dart';
import 'package:netflix_clone_coding/widget/box_slider.dart';
import 'package:netflix_clone_coding/widget/carousel_slider.dart';
import 'package:netflix_clone_coding/widget/circle_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Firestore firestore = Firestore.instance;
  late Stream<QuerySnapshot> streamData;

  // List<Movie> movies = [
  //   //모델을 선언해 더미 데이터 만듬 > 파이어베이스 연동을 위함
  //   Movie.fromMap({
  //     'title': '사랑의 불시착',
  //     'keyword': '사랑/로맨스/판타지',
  //     'poster': 'test_movie_1.png',
  //     'like': false
  //   })
  // ];

  @override
  void initStatue() {
    super.initState();
    streamData = firestore.collection('movie').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data!.documents);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImage(movies: movies),
            TopBar(),
          ],
        ),
        CircleSlider(
          movies: movies,
        ),
        BoxSlider(
          movies: movies,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //화면 크기에 맞춰 나열시킴
        children: <Widget>[
          Image.asset(
            'images/bbongflix_logo.png', //pubspec.yaml의 asset에 이미지 등록 후 가져오기
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
