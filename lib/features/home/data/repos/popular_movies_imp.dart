import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/core/utils/constants.dart';

List<Map<String, dynamic>> popularMovies = [];

class PopularMovie {
  static Future<void> fetchPopularMovies() async {
    var response = await http.get(Uri.parse(kPopularMovies));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var popularData = data['results'];
      for (int i = 0; i < popularData.lenght; i++) {
        popularMovies.add({
          "name": popularData[i]["name"],
          "poster_path": popularData[i]["poster_path"],
          "vote_average": popularData[i]["vote_average"],
          "Date": popularData[i]["first_air_date"],
          "id": popularData[i]["id"],
        });
      }
    }
  }
}
