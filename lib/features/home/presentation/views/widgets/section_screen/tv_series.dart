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
                padding: EdgeInsets.only(left: 12.w, top: 20.h, bottom: 20.h),
                child: Text(
                  "Popular Movies",
                  style: TextStyle(fontSize: 18.sp, color: Colors.amber),
                )),
            Container(
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
                      child: Stack(
                        children: [
                          ClipRRect(
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 6),
                                child: Text("${popularMovies[index]["Date"]}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 2),
                                    child: Row(children: [
                                      Icon(Icons.star,
                                          color: Colors.yellow, size: 15.sp),
                                      Text(
                                          "${popularMovies[index]['vote_average'].toString()}"),
                                    ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
