import 'package:movie_app/data/network/BaseApiServices.dart';
import 'package:movie_app/data/network/NetworkApiServices.dart';
import 'package:movie_app/model/search_Model.dart';
import 'package:movie_app/resources/app_url.dart';

class SearchRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getSearchList(String data) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.searchEndPoint + data);
      return response = searchModel.fromJson(response);
    } catch (e) {
      print('from search repo: ' + e.toString());
    }
  }
}
