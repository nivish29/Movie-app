import 'package:movie_app/data/responses/api_response.dart';
import 'package:movie_app/model/trending_movie_model.dart';
import 'package:movie_app/repository/trending_movie_repository.dart';
import 'package:flutter/foundation.dart';

class trendingMovieViewModel with ChangeNotifier {
  final _myRepo = TrendingRepository();

  ApiResponse<trendingMovieList> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<trendingMovieList> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchTrendingMovieApi() async {
    setMovieList(ApiResponse.loading());
    _myRepo.getTrendingList().then((value) {
      setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error(error.toString()));
    });
  }
}
