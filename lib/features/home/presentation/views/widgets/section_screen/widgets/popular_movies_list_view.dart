import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/data/repos/fetch_tv_series_movies_imp.dart';

class CustomMoviesListView extends StatelessWidget {
  CustomMoviesListView({required this.movies, required this.categoryTitle});
  List<Map<String, dynamic>> movies = [];
  String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 12.w, top: 20.h, bottom: 20.h),
            child: Text(
              categoryTitle,
              style: TextStyle(fontSize: 18.sp, color: Colors.amber),
            )),
        Container(
          height: 200.h,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
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
                              "https://image.tmdb.org/t/p/w500${movies[index]['poster_path']}",
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
                            child: Text("${movies[index]["Date"]}"),
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
                                      "${movies[index]['vote_average'].toString()}"),
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
  }
}
