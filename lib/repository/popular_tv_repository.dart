import 'dart:io';
import 'package:movie_app/data/app_exceptions.dart';
import 'package:movie_app/data/network/BaseApiServices.dart';
import 'package:movie_app/data/network/NetworkApiServices.dart';
// import 'package:http/http.dart' as http;
import 'package:movie_app/model/popular_TV_model.dart';
import 'package:movie_app/resources/app_url.dart';

class PopularTvRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getPopularTvList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.popularTvEndPoint);
      return response = PopularTvModel.fromJson(response);
    } catch (e) {
      print(e.toString());
    }
  }
}
