import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/data/repos/trending_week_movies_imp.dart';

class SliverAppBarSection extends StatelessWidget {
  const SliverAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // centerTitle: true,
      toolbarHeight: 60.h,
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: FutureBuilder(
          future: TrendingWeekMovie.fetchTrendingWeekMovies(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    height: MediaQuery.of(context).size.height,
                  ),
                  items: trendingweek.map((trendingWeek) {
                    return Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {},
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.amber.withOpacity(0.5)),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500${trendingWeek['poster_path']}",
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.amber,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList());
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          },
        ),
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Trending 🔥",
          style:
              TextStyle(fontSize: 25.sp, color: Colors.white.withOpacity(0.8)),
        ),
      ]),
    );
  }
}
