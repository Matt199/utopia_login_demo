import 'package:demo_app/screen/auth/signup/state/signup_screen_state.dart';
import 'package:demo_app/screen/auth/signup/view/signup_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';

class SignupScreen extends HookWidget {
  static const route = "/signup";
  static final routeConfig = RouteConfig.material(SignupScreen.new);

  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useSignupScreenState();
    return SignUpScreenView(
      state: state,
    );
  }
}
