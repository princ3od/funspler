import 'package:flutter/cupertino.dart';
import 'package:funspler/modules/auth/screens/welcome_screen.dart';

class Routes {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    Routes.welcome: (context) => WelcomeScreen(),
    Routes.login: (context) => WelcomeScreen(),
  };
}
