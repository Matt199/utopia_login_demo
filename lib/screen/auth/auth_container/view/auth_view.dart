import 'package:demo_app/screen/auth/auth_container/state/auth_state_screen.dart';
import 'package:demo_app/screen/auth/login/login_screen.dart';
import 'package:demo_app/screen/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:utopia_widgets/misc/un_focus_on_tap.dart';

class AuthView extends StatelessWidget {
  final AuthStateScreen state;

  const AuthView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnFocusOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            state.authStateScreen == LoginOrSignup.login ? "Log in" : "Signup",
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            if (state.authStateScreen == LoginOrSignup.login)
              const LoginScreen()
            else
              const SignupScreen(),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text("or"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextButton(
            onPressed: () => state.performScreenChange(),
            child: Text(
              state.authStateScreen == LoginOrSignup.login
                  ? "register"
                  : "log in",
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ),
      ],
    );
  }
}
