import 'package:flutter/material.dart';
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
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                  child: Center(
                child: Text('Home'),
              )),
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
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
