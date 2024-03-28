import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/core/utils/constants.dart';

List<Map<String, dynamic>> upcommingMovies = [];

class UpComingMovie {
  static Future<void> fetchUpcommingMovies() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var i = 0; i < json['results'].length; i++) {
        upcommingMovies.add({
          "poster_path": json['results'][i]['poster_path'],
          "name": json['results'][i]['title'],
          "vote_average": json['results'][i]['vote_average'],
          "Date": json['results'][i]['release_date'],
          "id": json['results'][i]['id'],
        });
      }
    }
  }
}
