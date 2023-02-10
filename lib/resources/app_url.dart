import 'package:movie_app/resources/api_key.dart';

class AppUrl {
  static var BaseUrl = 'https://api.themoviedb.org/3/';

  static var trendingEndPoint =
      BaseUrl + 'trending/movie/day?api_key=' + ApiKey.apiKey;

  static var popularTvBaseUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=';

  // static var popularTvEndPoint = popularTvBaseUrl + ApiKey.apiKey;
  static var popularTvEndPoint =
      'https://api.themoviedb.org/3/tv/popular?api_key=74e83e30dbb2f3b125c2132c5cebb053&language=en-US&page=1';
}
