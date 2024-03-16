import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/core/utils/constants.dart';

List<Map<String, dynamic>> popularmovies = [];
List<Map<String, dynamic>> nowplayingmovies = [];

List<Map<String, dynamic>> topratedmovies = [];
List<Map<String, dynamic>> latestmovies = [];

class Movie {
  static Future<void> fetchMovies() async {
    // popular movies
    var popularMoviesresponse = await http.get(Uri.parse(kPopularMovies));
    if (popularMoviesresponse.statusCode == 200) {
      var data = jsonDecode(popularMoviesresponse.body);
      var popularmoviejson = data['results'];
      for (var i = 0; i < popularmoviejson.length; i++) {
        popularmovies.add({
          "name": popularmoviejson[i]["name"],
          "poster_path": popularmoviejson[i]["poster_path"],
          "vote_average": popularmoviejson[i]["vote_average"],
          "Date": popularmoviejson[i]["first_air_date"],
          "id": popularmoviejson[i]["id"],
        });
      }
    }

    // top rated movies
    var topratedtvresponse = await http.get(Uri.parse(kTopRatedMovies));
    if (topratedtvresponse.statusCode == 200) {
      var data = jsonDecode(topratedtvresponse.body);
      var topratedMoviesjson = data['results'];
      for (var i = 0; i < topratedMoviesjson.length; i++) {
        topratedmovies.add({
          "name": topratedMoviesjson[i]["name"],
          "poster_path": topratedMoviesjson[i]["poster_path"],
          "vote_average": topratedMoviesjson[i]["vote_average"],
          "Date": topratedMoviesjson[i]["first_air_date"],
          "id": topratedMoviesjson[i]["id"],
        });
      }
    }

    // now playing movies
    var nowplayingmoviesresponse =
        await http.get(Uri.parse(kNowplayingmoviesurl));
    if (nowplayingmoviesresponse.statusCode == 200) {
      var data = jsonDecode(nowplayingmoviesresponse.body);
      var nowplayingmoviesjson = data['results'];
      for (var i = 0; i < nowplayingmoviesjson.length; i++) {
        nowplayingmovies.add({
          "name": nowplayingmoviesjson[i]["title"],
          "poster_path": nowplayingmoviesjson[i]["poster_path"],
          "vote_average": nowplayingmoviesjson[i]["vote_average"],
          "Date": nowplayingmoviesjson[i]["release_date"],
          "id": nowplayingmoviesjson[i]["id"],
        });
      }
    }

    //
  }
}
