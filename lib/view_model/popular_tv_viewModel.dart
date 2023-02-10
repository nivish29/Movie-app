import 'package:movie_app/data/responses/api_response.dart';
import 'package:movie_app/repository/popular_tv_repository.dart';
import 'package:flutter/foundation.dart';
import '../model/popular_TV_model.dart';

class popularTvViewModel with ChangeNotifier {
  final _myRepo1 = PopularTvRepository();

  ApiResponse<PopularTvModel> TvList = ApiResponse.loading();

  setTvList(ApiResponse<PopularTvModel> response) {
    TvList = response;
    notifyListeners();
  }

  Future<void> FetchPopularTvList() async {
    setTvList(ApiResponse.loading());
    _myRepo1.getPopularTvList().then((value) {
      setTvList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setTvList(ApiResponse.error(error.toString()));
    });
  }
}
