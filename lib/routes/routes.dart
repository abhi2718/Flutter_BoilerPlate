import 'package:flutter/material.dart';
import '../screens/auth.screen/signin.dart';
import '../screens/splash_screen.dart';
import './routes_name.dart';


class Routes {
  Map<String, Widget Function(BuildContext)> routes = {
    RouteName.splashRoute: (context) => const SplashScreen(),
    RouteName.signinRoute: (context) =>  const SignInScreen(),
  };
}
