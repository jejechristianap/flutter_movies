import 'package:flutter/material.dart';
import 'package:flutter_movies/bloc/movies_bloc.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Container();
  }
}
