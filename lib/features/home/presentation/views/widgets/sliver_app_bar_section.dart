import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/widgets/circular_indicator.dart';
import 'package:movies/features/home/data/repos/trending_week_movie_imp.dart';
import 'package:movies/features/home/data/repos/trending_day_movie_imp.dart';

class SliverAppBarSection extends StatefulWidget {
  const SliverAppBarSection({Key? key});

  @override
  State<SliverAppBarSection> createState() => _SliverAppBarSectionState();
}

class _SliverAppBarSectionState extends State<SliverAppBarSection> {
  int uval = 1;
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
          future: uval == 1
              ? TrendingWeekMovie.fetchTrendingWeekMovies()
              : TrendingDayMovie
                  .fetchTrendingDayMovies(), // Call appropriate method based on dropdown value
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    height: MediaQuery.of(context).size.height,
                  ),
                  items: uval == 1
                      ? trendingweek.map((trendingWeek) {
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
                        }).toList()
                      : trendingday.map((trendingday) {
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
                                          "https://image.tmdb.org/t/p/w500${trendingday['poster_path']}",
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
            return CustomCircularIndicator();
          },
        ),
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Trending 🔥",
          style:
              TextStyle(fontSize: 25.sp, color: Colors.white.withOpacity(0.8)),
        ),
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            // color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
              child: DropdownButton(
                onChanged: (value) {
                  setState(() {
                    trendingweek.clear();
                    trendingday.clear();
                    uval = int.parse(value.toString()); // Update dropdown value
                  });
                },
                value: uval,
                icon: Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.amber,
                  size: 30.sp,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Weekly",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 18.sp,
                      ),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Daily",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 18.sp,
                      ),
                    ),
                    value: 2,
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
