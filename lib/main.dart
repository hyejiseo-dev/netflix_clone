import 'package:flutter/material.dart';
import 'package:netflix_clone_coding/screen/home_screen.dart';
import 'package:netflix_clone_coding/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetFlix',
      theme: ThemeData(
          //앱 테마색 지정
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
        length: 4, //4개의 영역으로 나눈다
        child: Scaffold(
          body: TabBarView(
            //tab바를 바디에 넣어준다(4개의 영역마다 다른 화면 표시)
            physics: NeverScrollableScrollPhysics(), //스크롤이 되지않도록
            children: <Widget>[
              HomeScreen(), //home_screen.dart
              Container(
                  child: Center(
                child: Text('Search'),
              )),
              Container(
                  child: Center(
                child: Text('Save'),
              )),
              Container(
                  child: Center(
                child: Text('More'),
              ))
            ],
          ),
          bottomNavigationBar: Bottom(), //bottom_bar.dart파일에서 쓴 Bottom을 가져와서 넣기
        ),
      ),
    );
  }
}
