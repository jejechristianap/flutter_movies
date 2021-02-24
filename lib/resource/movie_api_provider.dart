import 'dart:convert';

import 'package:flutter_movies/model/item_model.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client client = Client();
  final apiKey = '7f15dcc7f6403267221c0c04512e4213';

  Future<ItemModel> fetchMovieList() async {
    print('fetchMovieList => entered');
    final response = await client
        .get('http://api.themoviedb.org/3/movie/popular?api_key=$apiKey');
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}