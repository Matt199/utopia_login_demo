import 'package:demo_app/screen/auth/login/login_screen.dart';
import 'package:demo_app/screen/home/home.dart';
import 'package:demo_app/screen/splash/splash_screen.dart';
import 'package:utopia_arch/utopia_arch.dart';

import '../screen/auth/auth_container/auth_screen.dart';
import '../screen/auth/signup/signup_screen.dart';

class AppRouting {
  static final routes = <String, RouteConfig>{
    SplashScreen.route: SplashScreen.routeConfig,
    HomeScreen.route: HomeScreen.routeConfig,
    LoginScreen.route: LoginScreen.routeConfig,
    AuthScreen.route: AuthScreen.routeConfig,
    SignupScreen.route: SignupScreen.routeConfig,
  };

  static const initialRoute = SplashScreen.route;
  static const homeRoute = HomeScreen.route;
  static const loginScreen = LoginScreen.route;
  static const authScreen = AuthScreen.route;
  static const signupScreen = SignupScreen.route;
}
