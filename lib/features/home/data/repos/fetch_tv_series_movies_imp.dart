import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/core/utils/constants.dart';

List<Map<String, dynamic>> popularTvSeries = [];
List<Map<String, dynamic>> topRatedTvSeries = [];
List<Map<String, dynamic>> onAirTvSeries = [];

class TvSeries {
  static Future<void> fetchTvSeriesMovies() async {
    // popular tv series
    var populartvresponse = await http.get(Uri.parse(kPopularTvSeries));
    if (populartvresponse.statusCode == 200) {
      var data = jsonDecode(populartvresponse.body);
      var populartvjson = data['results'];
      for (var i = 0; i < populartvjson.length; i++) {
        popularTvSeries.add({
          "name": populartvjson[i]["name"],
          "poster_path": populartvjson[i]["poster_path"],
          "vote_average": populartvjson[i]["vote_average"],
          "Date": populartvjson[i]["first_air_date"],
          "id": populartvjson[i]["id"],
        });
      }
    }

    // top rated tv series
    var topratedtvresponse = await http.get(Uri.parse(kTopRatedTvSeries));
    if (topratedtvresponse.statusCode == 200) {
      var data = jsonDecode(topratedtvresponse.body);
      var topratedtvjson = data['results'];
      for (var i = 0; i < topratedtvjson.length; i++) {
        topRatedTvSeries.add({
          "name": topratedtvjson[i]["name"],
          "poster_path": topratedtvjson[i]["poster_path"],
          "vote_average": topratedtvjson[i]["vote_average"],
          "Date": topratedtvjson[i]["first_air_date"],
          "id": topratedtvjson[i]["id"],
        });
      }
    }

    // on air tv series
    var onairtvresponse = await http.get(Uri.parse(kOnAirTvSeries));
    if (onairtvresponse.statusCode == 200) {
      var data = jsonDecode(onairtvresponse.body);
      var onairtvjson = data['results'];
      for (var i = 0; i < onairtvjson.length; i++) {
        onAirTvSeries.add({
          "name": onairtvjson[i]["name"],
          "poster_path": onairtvjson[i]["poster_path"],
          "vote_average": onairtvjson[i]["vote_average"],
          "Date": onairtvjson[i]["first_air_date"],
          "id": onairtvjson[i]["id"],
        });
      }
    }
  }
}
