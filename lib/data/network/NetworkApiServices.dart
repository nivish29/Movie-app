import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:movie_app/data/app_exceptions.dart';
import 'package:movie_app/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String Url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(Url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('Check Your Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String Url, dynamic data) async {
    dynamic responseJson;
    try {
      final response =
          await post(Uri.parse(Url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('Check Your Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.statusCode.toString());

      case 404:
        throw UnauthorizedException(response.statusCode.toString());

      default:
        throw FetchDataException(
            "Error occured while communicating with the server with status code ${response.statusCode.toString()}");
    }
  }
}
