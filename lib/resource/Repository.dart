import 'package:flutter_movies/model/item_model.dart';
import 'package:flutter_movies/resource/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}