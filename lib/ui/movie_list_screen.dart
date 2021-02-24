import 'package:flutter/material.dart';
import 'package:flutter_movies/bloc/movies_bloc.dart';
import 'package:flutter_movies/model/item_model.dart';
import 'package:flutter_movies/ui/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bloc.fetchAllMovies();
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot){
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: snapshot.data.results.length,
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Image.network('https://image.tmdb.org/t/p/w185${snapshot.data.results[index]
                    .poster_path}',
                  fit: BoxFit.cover,
                ),
                onTap: () => openDetailPage(snapshot.data, index),
              )
          );

            // Column(
            //   children: [
            //     Expanded(
            //       flex: 3,
            //       child: Center(
            //         child: Image.network('https://image.tmdb.org/t/p/w185${snapshot.data.results[index]
            //               .poster_path}',
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            //     // Expanded(
            //     //   flex: 1,
            //     //   child: Center(
            //     //     child: Text(
            //     //       snapshot.data.results[index].title,
            //     //       style: TextStyle(
            //     //         color: Colors.amber,
            //     //         fontSize: 10,
            //     //       ),
            //     //       textAlign: TextAlign.center,
            //     //     ),
            //     //   ),
            //     // )
            //   ],
            // ),
        }
    );
  }

  openDetailPage(ItemModel data, int index){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetail(
          title: data.results[index].title,
          posterUrl: data.results[index].backdrop_path,
          description: data.results[index].overview,
          releaseDate: data.results[index].release_date,
          voteAverage: data.results[index].vote_average.toString(),
          movieId: data.results[index].id,
        );
      })
    );
  }
}
