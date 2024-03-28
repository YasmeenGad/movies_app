import 'package:flutter/material.dart';
import 'package:movies/core/widgets/circular_indicator.dart';
import 'package:movies/features/home/data/repos/fetch_tv_series_movies_imp.dart';
import 'package:movies/features/home/data/repos/fetch_upcoming_movies_imp.dart';
import 'package:movies/features/home/presentation/views/widgets/section_screen/widgets/popular_movies_list_view.dart';

class UpComing extends StatelessWidget {
  const UpComing({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UpComingMovie.fetchUpcommingMovies(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomCircularIndicator();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomMoviesListView(
                movies: popularTvSeries, categoryTitle: "Up Coming Movies"),
          ],
        );
      },
    );
  }
}
