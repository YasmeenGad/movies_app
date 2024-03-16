import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/core/utils/constants.dart';

List<Map<String, dynamic>> topRatedMovies = [];

class PopularMovie {
  static Future<void> fetchPopularMovies() async {
    var topRatedresponse = await http.get(Uri.parse(kPopularMovies));
    if (topRatedresponse.statusCode == 200) {
      var data = jsonDecode(topRatedresponse.body);
      var topRatedjson = data['results'];
      for (var i = 0; i < topRatedjson.length; i++) {
        topRatedMovies.add({
          "name": topRatedMovies[i]["name"],
          "poster_path": topRatedMovies[i]["poster_path"],
          "vote_average": topRatedMovies[i]["vote_average"],
          "Date": topRatedMovies[i]["first_air_date"],
          "id": topRatedMovies[i]["id"],
        });
      }
    }
  }
}
