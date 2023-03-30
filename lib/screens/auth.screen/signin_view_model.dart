import 'package:flutter/material.dart';
import '../../repository/auth_repository.dart';
import '../../routes/routes_name.dart';
import '../../utils/utils.dart';

class SignInViewModel with ChangeNotifier {
  final _authRepository = AuthRepository();
  var _loading = false;
  var count = 0;

  bool get loading {
    return _loading;
  }

  setCount() {
    count = count + 1;
    notifyListeners();
  }

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<dynamic> loginApi(dynamic payload, BuildContext context) async {
    try {
      final data = await _authRepository.loginApi(payload);
      //Navigator.of(context).pushNamed(RouteName.homeRoute);
      return data;
    } catch (error) {
      Utils.flushBarErrorMessage("Alert!", error.toString(), context);
      rethrow;
    }
  }
}
