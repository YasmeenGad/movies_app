import 'package:flutter/material.dart';
import 'package:movies/core/widgets/circular_indicator.dart';
import 'package:movies/features/home/data/repos/fetch_movies_imp.dart';

import 'widgets/popular_movies_list_view.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Movie.fetchMovies(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomCircularIndicator();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomMoviesListView(
                movies: popularmovies, categoryTitle: "Popular Movies"),
            CustomMoviesListView(
                movies: topratedmovies, categoryTitle: "Top Rated Movies"),
            CustomMoviesListView(
                movies: nowplayingmovies, categoryTitle: "Now Playing Movies")
          ],
        );
      },
    );
  }
}
