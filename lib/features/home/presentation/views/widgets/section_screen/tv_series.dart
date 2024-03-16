import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/widgets/circular_indicator.dart';
import 'package:movies/features/home/data/repos/fetch_tv_series_movies_imp.dart';
import 'package:movies/features/home/presentation/views/widgets/section_screen/widgets/popular_movies_list_view.dart';

class TVseries extends StatelessWidget {
  const TVseries({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TvSeriesMovie.fetchTvSeriesMovies(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomCircularIndicator();
        }
        return Column(
          children: [
            CustomMoviesListView(
                movies: popularMovies, categoryTitle: "Popular Movies"),
            CustomMoviesListView(
                movies: topRatedMovies, categoryTitle: "Top Rated Movies")
          ],
        );
      },
    );
  }
}
