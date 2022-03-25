import 'package:utopia_hooks/utopia_hooks.dart';

enum LoginOrSignup { login, signup }

class AuthStateScreen {
  final LoginOrSignup authStateScreen;

  final Function performScreenChange;

  const AuthStateScreen({
    required this.authStateScreen,
    required this.performScreenChange,
  });
}

AuthStateScreen authStateScreen() {
  final authScreen = useState(LoginOrSignup.login);

  void performScreenChange() {
    if (authScreen.value == LoginOrSignup.login) {
      authScreen.value = LoginOrSignup.signup;
    } else {
      authScreen.value = LoginOrSignup.login;
    }
  }

  return AuthStateScreen(
    authStateScreen: authScreen.value,
    performScreenChange: performScreenChange,
  );
}
