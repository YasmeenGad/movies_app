import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/constants.dart';
import 'package:movies/core/widgets/circular_indicator.dart';
import 'package:movies/features/search/data/repos/search_imp.dart';
import 'package:movies/features/search/presentation/views/widgets/movie_details.dart';
import 'package:movies/features/search/presentation/views/widgets/rating_txt.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchtext = TextEditingController();
  bool showlist = false;
  var val1;
  ////////////////////////////////search bar function/////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print("tapped");
        FocusManager.instance.primaryFocus?.unfocus();
        showlist = !showlist;
      },
      child: Padding(
          padding: EdgeInsets.only(
              left: 20.0.w, top: 15.h, bottom: 15.h, right: 20.w),
          child: Column(
            children: [
              Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  autofocus: false,
                  controller: searchtext,
                  onSubmitted: (value) {
                    searchresult.clear();
                    setState(() {
                      val1 = value;
                      FocusManager.instance.primaryFocus?.unfocus();
                    });
                  },
                  onChanged: (value) {
                    searchresult.clear();

                    setState(() {
                      val1 = value;
                    });
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                              webBgColor: "#000000",
                              webPosition: "center",
                              webShowClose: true,
                              msg: "Search Cleared",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Color.fromRGBO(18, 18, 18, 1),
                              textColor: Colors.white,
                              fontSize: 16.0);

                          setState(() {
                            searchtext.clear();
                            FocusManager.instance.primaryFocus?.unfocus();
                          });
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.amber.withOpacity(0.6),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.amber,
                      ),
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.2)),
                      border: InputBorder.none),
                ),
              ),
              //
              //
              const SizedBox(
                height: 5,
              ),
              //if textfield has focus and search result is not empty then display search result
              searchtext.text.length > 0
                  ? FutureBuilder(
                      future: MovieSearch.searchMovies(val1),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                              height: !searchresult.isEmpty ? 400.h : 0.h,
                              child: ListView.builder(
                                  itemCount: searchresult.length,
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MovieDetails(
                                                        id: searchresult[index]
                                                            ['id'],
                                                        mediaType:
                                                            searchresult[index]
                                                                ['media_type'],
                                                      )));
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                top: 4, bottom: 4),
                                            height: 180,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    20, 20, 20, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Row(children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    image: DecorationImage(
                                                        //color filter

                                                        image: NetworkImage(
                                                            'https://image.tmdb.org/t/p/w500${searchresult[index]['poster_path']}'),
                                                        fit: BoxFit.fill)),
                                              ),
                                              // SizedBox(
                                              //   width: 5,
                                              // ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                        ///////////////////////
                                                        //media type
                                                        Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: Text(
                                                                '${searchresult[index]['media_type']}',
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.9),
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    letterSpacing:
                                                                        1.25))),

                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              //vote average box
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                height: 30,
                                                                // width:
                                                                //     100,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .amber
                                                                        .withOpacity(
                                                                            0.2),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(6))),
                                                                child: Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Colors
                                                                            .amber,
                                                                        size:
                                                                            14,
                                                                      ),
                                                                      // SizedBox(
                                                                      //   width:
                                                                      //       5,
                                                                      // ),
                                                                      RatingTxt(
                                                                          rateTxt:
                                                                              '${searchresult[index]['popularity']}')
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),

                                                              //popularity
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .amber
                                                                        .withOpacity(
                                                                            0.2),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8))),
                                                                child: Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .people_outline_sharp,
                                                                        color: Colors
                                                                            .amber,
                                                                        size:
                                                                            14,
                                                                      ),
                                                                      // SizedBox(
                                                                      //   width:
                                                                      //       5,
                                                                      // ),
                                                                      RatingTxt(
                                                                          rateTxt:
                                                                              '${searchresult[index]['popularity']}')
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),

                                                              //
                                                            ],
                                                          ),
                                                        ),

                                                        Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            height: 85,
                                                            child: Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                ' ${searchresult[index]['overview']}',
                                                                // 'dsfsafsdffdsfsdf sdfsadfsdf sadfsafd',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white)))
                                                      ])))
                                            ])));
                                  }));
                        } else {
                          return CustomCircularIndicator();
                        }
                      })
                  : Container(),
            ],
          )),
    );
  }
}
