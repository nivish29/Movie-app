import 'package:movie_app/data/responses/api_response.dart';
import 'package:movie_app/model/kidsPopular_model.dart';
import 'package:movie_app/repository/kids_popular_repository.dart';
import 'package:movie_app/repository/popular_tv_repository.dart';
import 'package:flutter/foundation.dart';
import '../model/popular_TV_model.dart';

class kidsPopularViewModel with ChangeNotifier {
  final _myRepo1 = KidsPopularRepository();

  ApiResponse<kidsPopularModel> kidsPopularList = ApiResponse.loading();

  setkidsPopularList(ApiResponse<kidsPopularModel> response) {
    kidsPopularList = response;
    notifyListeners();
  }

  Future<void> FetchkidsPopularList() async {
    setkidsPopularList(ApiResponse.loading());
    _myRepo1.getkidsPopularList().then((value) {
      setkidsPopularList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setkidsPopularList(ApiResponse.error(error.toString()));
    });
  }
}
