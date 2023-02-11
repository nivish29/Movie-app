import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/responses/api_response.dart';
import 'package:movie_app/repository/serach_repository.dart';

import '../model/search_Model.dart';

class SearchViewModel with ChangeNotifier {
  final _myRepo = SearchRepository();

  ApiResponse<searchModel> searchList = ApiResponse.loading();
  setSearchList(ApiResponse<searchModel> response) {
    searchList = response;
    notifyListeners();
  }

  Future<void> fetchSearchList(String data) async {
    // setSearchList(ApiResponse.loading());
    _myRepo.getSearchList(data).then((value) {
      // setSearchList(ApiResponse.completed(value));
      print('done');
    }).onError((error, stackTrace) {
      // setSearchList(ApiResponse.error(error.toString()));
    });
  }
}
