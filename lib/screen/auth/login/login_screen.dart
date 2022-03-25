import 'package:demo_app/screen/auth/login/state/login_view_state.dart';
import 'package:demo_app/screen/auth/login/view/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';

class LoginScreen extends HookWidget {
  static const route = "/login";
  static final routeConfig = RouteConfig.material(LoginScreen.new);

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useLoginScreenState();
    return LogInScreenView(
      state: state,
    );
  }
}
