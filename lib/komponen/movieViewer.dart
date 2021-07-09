
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fff/komponen/config.dart';
import 'package:fff/main.dart';

import 'package:http/http.dart' as http;

class MovieViewer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MovieViewerState();

}

class _MovieViewerState extends State<MovieViewer> {

  List movielist = [];

  List detail = [
    MovieDetail(), MovieDetail2(), MovieDetail3()
  ];
  Widget movieViewer;

  void getData() async {
    var data = await getDiscover();

    setState(() {
      movielist = data['results'];
    });

    List<Widget> moviecollection = [];

    movielist.toList().forEach((element)  {
      moviecollection.add(
        Row(
          children: [
            new Padding(
              padding: EdgeInsets.all(4.0),
              child: new Container(
                child: Image(image: new NetworkImage(MOVIE_IMAGE_URL + element['poster_path'])),
                width: 175.0,
                height: 200.0,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xD769A047),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 12.0
                      )
                    ]
                ),
                padding: EdgeInsets.all(12.0),
              ),
            ),
            new Expanded(
                child: new Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: new Column(
                    children: [
                      new Text(element['original_title'], textAlign: TextAlign.center, style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                      new Padding(padding: EdgeInsets.all(2.0)),
                      new Text(element['overview'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(
                          fontSize: 15.0
                      ),
                      ),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) => detail[0]
                            ));
                      }, child: Text("Detail"))
                    ],
                  ),
                )
            )
          ],
        ),
      );

    });

    movieViewer = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 16.0),
      children: moviecollection,
    );
  }

  @override
  void initState() {
    super.initState();

    getData();


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Expanded(
        child: (movieViewer == null) ? CupertinoActivityIndicator() : movieViewer,

    );
  }

  Future<Map> getDiscover() async {
    var discoverurl = Uri.https(MOVIE_URL_API, '/3/discover/movie', { 'api_key':API_KEY});
    var response = await http.get(discoverurl);
    return json.decode(response.body);
  }

}