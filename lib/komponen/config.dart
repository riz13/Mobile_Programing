import 'dart:convert';

import 'package:fff/komponen/movieViewer.dart';
import 'package:http/http.dart'  show Client, Response;

class ApiProvider{
  String apiKey = '8c0967206c78db60c4a4303f374f8756';
  String baseUrl = 'api.themoviedb.org';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async{

    //  String url = '$baseUrl/movie/popular?api_key=$apiKey';
    //  print(url);
    Response response = await client.get(Uri.https(baseUrl, '/3/discover/movie', {'api_key': apiKey}));

    if(response.statusCode == 200){
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}