import '../data/network/network_api_service.dart';
import '../res/app_url.dart';

class AuthRepository {
  final _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic payload) async {
    try {
      final response =
          await _apiServices.getPostApiResponse(AppUrl.userListEndPoint, payload);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic payload) async {
    try {
      final response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, payload);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
