import 'dart:convert';
import'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fff/komponen/config.dart';
import 'package:fff/komponen/movieViewer.dart';
import 'package:http/http.dart' as http;

import 'komponen/movieViewer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 0.0),
        child: Column(
          children: [MovieViewer()],
        ),
      ),
    );
  }
}

class MovieDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => _MovieDetailState();

}

class _MovieDetailState extends State<MovieDetail> {

  List moviedetail = [];


  void getfile() async {
    var file = await getDetail();
    setState(() {
      moviedetail = file['results'];
    });
    print(file);

  }


  @override
  Widget build(BuildContext context) {
    getDetail();
    getfile();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 0.0),
        child: Column(
          children: [
            Center(
                child:
                new Text(moviedetail[0], textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ))),
            new Padding(padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0)),
            new Text("is the third Spirit to appear. Due to her brutal actions, she is referred to as the Worst Spirit. "
                "She is also the first Spirit to appear as an antagonist in the Date A Live series. Kurumi is a girl with astonishing beauty as described by Shido Itsuka. "
                "She appears to be elegant and has very polite manners. She has ivory skin and long, black hair usually tied in long twin tails. "
                "Her right eye is red-tinted while her left eye appears as a golden, inorganic clock face. "
                "The positions of the clock hands represent her remaining time and are covered by her bangs, which are only revealed when she transforms into her Spirit form.", style: TextStyle(
                fontSize: 18.0
            )),
            new Padding(padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0)),
            new Image.asset("kurumi_tokisaki.jpg"),
            Spacer(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
                  child: ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  },child: Text("Back")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Future<Map> getDetail() async {
    var detailurl = Uri.https(
        MOVIE_URL_API, '/3/movie/508943', { 'api_key': API_KEY});
    var response = await http.get(detailurl);
    return json.decode(response.body);
  }
}


class MovieDetail2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => _MovieDetail2State();

}

class _MovieDetail2State extends State<MovieDetail2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 0.0),
        child: Column(
          children: [
            Center(
                child:
                new Text("About Kurumi", textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ))),
            new Padding(padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0)),
            new Text("is the third Spirit to appear. Due to her brutal actions, she is referred to as the Worst Spirit. "
                "She is also the first Spirit to appear as an antagonist in the Date A Live series. Kurumi is a girl with astonishing beauty as described by Shido Itsuka. "
                "She appears to be elegant and has very polite manners. She has ivory skin and long, black hair usually tied in long twin tails. "
                "Her right eye is red-tinted while her left eye appears as a golden, inorganic clock face. "
                "The positions of the clock hands represent her remaining time and are covered by her bangs, which are only revealed when she transforms into her Spirit form.", style: TextStyle(
                fontSize: 18.0
            )),
            new Padding(padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0)),
            new Image.asset("kurumi_tokisaki.jpg"),
            Spacer(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
                  child: ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  },child: Text("Back")),
                )
              ],
            )
          ],
        ),
      ),
    );

  }


}

class MovieDetail3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => _MovieDetail3State();

}

class _MovieDetail3State extends State<MovieDetail3> {
  @override



  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 0.0),
        child: Column(
          children: [
            Center(
                child:
                new Text("About Genshin Impact", textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ))),
            new Padding(padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0)),
            new Text("Genshin Impact[a] is an action role-playing game developed and published by miHoYo. "
                "The game features an open-world environment and action-based battle system using elemental magic and character-switching, "
                "and uses gacha game monetization for players to obtain new characters, weapons, and other resources. "
                "The game is online-only and features a limited multiplayer mode allowing up to four players to play together. "
                "It was released for Microsoft Windows, PlayStation 4, Android and iOS in September 2020. "
                "Genshin Impact is also planned to release for the Nintendo Switch and the PlayStation 5. "
                "The PlayStation 5 version will be released in April 2021.", style: TextStyle(
                fontSize: 18.0
            )),
            new Padding(padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0)),
            new Image.asset("GI.jpg"),
            Spacer(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
                  child: ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  },child: Text("Back")),
                )
              ],
            )
          ],
        ),
      ),
    );

  }




}

