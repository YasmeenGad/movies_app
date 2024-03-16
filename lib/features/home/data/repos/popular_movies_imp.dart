import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/core/utils/constants.dart';

List<Map<String, dynamic>> popularMovies = [];

class PopularMovie {
  static Future<void> fetchPopularMovies() async {
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
  }
}
