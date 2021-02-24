import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  MovieDetail({
    this.title,
    this.posterUrl,
    this.description,
    this.releaseDate,
    this.voteAverage,
    this.movieId,
  });

  @override
  _MovieDetailState createState() {
    return _MovieDetailState(
        title: title,
        posterUrl: posterUrl,
        description: description,
        releaseDate: releaseDate,
        voteAverage: voteAverage,
        movieId: movieId);
  }
}

class _MovieDetailState extends State<MovieDetail> {
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  _MovieDetailState({
    this.title,
    this.posterUrl,
    this.description,
    this.releaseDate,
    this.voteAverage,
    this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                floating: false,
                pinned: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://image.tmdb.org/t/p/w500$posterUrl",
                    fit: BoxFit.cover,
                  )
                ),
                title: Text(title),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                ),
                Text(title, style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),),
                Container(margin: EdgeInsets.only(top: 8, bottom: 8),),
                Row(
                  children: [
                    Icon(Icons.star),
                    Container(margin: EdgeInsets.only(left: 1, right: 1),),
                    Text(voteAverage, style: TextStyle(
                      fontSize: 18.0
                    )),
                    Container(margin: EdgeInsets.only(left: 10, right: 10)),
                    Text(releaseDate, style: TextStyle(
                      fontSize: 18.0
                    ))
                  ],
                ),
                Container(margin: EdgeInsets.only(top: 8, bottom: 8)),
                Text(description)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
