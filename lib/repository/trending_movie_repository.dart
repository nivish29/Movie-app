import 'dart:io';

import 'package:movie_app/data/app_exceptions.dart';
import 'package:movie_app/data/network/BaseApiServices.dart';
import 'package:movie_app/data/network/NetworkApiServices.dart';
import 'package:movie_app/model/trending_movie_model.dart';
import 'package:movie_app/resources/app_url.dart';

class TrendingRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getTrendingList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.trendingEndPoint);
      return response = trendingMovieList.fromJson(response);
    } catch (e) {
      print(e.toString());
    }
  }
}
