import 'package:flutter_movies/model/item_model.dart';
import 'package:flutter_movies/resource/Repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final repository = Repository();
  final moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await repository.fetchAllMovies();
    moviesFetcher.sink.add(itemModel);
  }

  dispose(){
    moviesFetcher.close();
  }
}

final bloc = MoviesBloc();