import 'dart:convert';


import 'package:http/http.dart';

import '../ModelClass/MovieModel.dart';
import 'api_client.dart';


class MovieApi {
  ApiClient apiClient = ApiClient();


  Future<MovieModel> getMovie() async {
    String trendingpath = 'https://movies-api14.p.rapidapi.com/shows';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return MovieModel.fromJson(jsonDecode(response.body));
  }
}