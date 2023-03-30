import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import './base_api_services.dart';
import '../app_excaptions.dart';

class NetworkApiService extends BaseApiServices {
 dynamic _jsonResponse;
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      _jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection!");
    }
    return _jsonResponse;
  }

  @override
  Future getPostApiResponse(String url, dynamic payload) async {
    try {
      final response = await http
          .post(Uri.parse(url), body: payload)
          .timeout(const Duration(seconds: 10));
      _jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection!");
    }
    return _jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    final body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return body;
      case 201:
        return body;
      case 400:
        throw BadRequestException(body["error"].toString());
      case 404:
        throw UnAuthorisedException(body["error"].toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server with status code ${response.statusCode}');
    }
  }
}
