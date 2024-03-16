import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/widgets/circular_indicator.dart';
import 'package:movies/features/home/data/repos/popular_movies_imp.dart';

class TVseries extends StatelessWidget {
  const TVseries({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PopularMovie.fetchPopularMovies(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomCircularIndicator();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 15.h, bottom: 40.h),
              child: Container(
                height: 200.h,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: popularMovies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: 13.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                "https://image.tmdb.org/t/p/w500${popularMovies[index]['poster_path']}",
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
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
