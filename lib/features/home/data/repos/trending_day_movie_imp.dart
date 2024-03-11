import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/core/utils/constants.dart';

List<Map<String, dynamic>> trendingday = [];

class TrendingDayMovie {
  static Future<void> fetchTrendingDayMovies() async {
    var trendingWeekResponse = await http.get(Uri.parse(trendingdayurl));
    if (trendingWeekResponse.statusCode == 200) {
      var data = jsonDecode(trendingWeekResponse.body);
      var trendingweekjson = data['results'];
      for (var i = 0; i < trendingweekjson.length; i++) {
        trendingday.add({
          'id': trendingweekjson[i]['id'],
          'poster_path': trendingweekjson[i]['poster_path'],
          'vote_average': trendingweekjson[i]['vote_average'],
          'media_type': trendingweekjson[i]['media_type'],
          'indexno': i,
        });
      }
    }
  }
}
