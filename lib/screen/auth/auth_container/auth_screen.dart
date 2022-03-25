import 'package:demo_app/screen/auth/auth_container/state/auth_state_screen.dart';
import 'package:demo_app/screen/auth/auth_container/view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';

import 'state/auth_state_screen.dart';

class AuthScreen extends HookWidget {
  static const route = "/auth";
  static final routeConfig = RouteConfig.material(AuthScreen.new);

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = authStateScreen();
    return AuthView(
      state: state,
    );
  }
}
