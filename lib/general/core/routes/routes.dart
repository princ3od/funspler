import 'package:flutter/cupertino.dart';
import 'package:funspler/modules/auth/screens/login_screen.dart';
import 'package:funspler/modules/auth/screens/register_screen.dart';
import 'package:funspler/modules/auth/screens/welcome_screen.dart';
import 'package:funspler/modules/home/screens/home_screen.dart';

class Routes {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    Routes.welcome: (context) => WelcomeScreen(),
    Routes.login: (context) => LoginScreen(),
    Routes.register: (context) => RegisterScreen(),
    Routes.home: (context) => HomeScreen(),
  };
}
