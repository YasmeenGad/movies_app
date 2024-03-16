import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/core/utils/constants.dart';

List<Map<String, dynamic>> popularMovies = [];
List<Map<String, dynamic>> topRatedMovies = [];
List<Map<String, dynamic>> onAirTv = [];

class TvSeriesMovie {
  static Future<void> fetchTvSeriesMovies() async {
    // popular movies
    var populartvresponse = await http.get(Uri.parse(kPopularMovies));
    if (populartvresponse.statusCode == 200) {
      var data = jsonDecode(populartvresponse.body);
      var populartvjson = data['results'];
      for (var i = 0; i < populartvjson.length; i++) {
        popularMovies.add({
          "name": populartvjson[i]["name"],
          "poster_path": populartvjson[i]["poster_path"],
          "vote_average": populartvjson[i]["vote_average"],
          "Date": populartvjson[i]["first_air_date"],
          "id": populartvjson[i]["id"],
        });
      }
    }

    // top rated movies
    var topratedtvresponse = await http.get(Uri.parse(kTopRatedMovies));
    if (topratedtvresponse.statusCode == 200) {
      var data = jsonDecode(topratedtvresponse.body);
      var topratedtvjson = data['results'];
      for (var i = 0; i < topratedtvjson.length; i++) {
        topRatedMovies.add({
          "name": topratedtvjson[i]["name"],
          "poster_path": topratedtvjson[i]["poster_path"],
          "vote_average": topratedtvjson[i]["vote_average"],
          "Date": topratedtvjson[i]["first_air_date"],
          "id": topratedtvjson[i]["id"],
        });
      }
    }

    // on air series
    var onAirresponse = await http.get(Uri.parse(kPopularMovies));
    if (onAirresponse.statusCode == 200) {
      var data = jsonDecode(onAirresponse.body);
      var onAirjson = data['results'];
      for (var i = 0; i < onAirjson.length; i++) {
        onAirTv.add({
          "name": onAirTv[i]["name"],
          "poster_path": onAirTv[i]["poster_path"],
          "vote_average": onAirTv[i]["vote_average"],
          "Date": onAirTv[i]["first_air_date"],
          "id": onAirTv[i]["id"],
        });
      }
    }
  }
}
