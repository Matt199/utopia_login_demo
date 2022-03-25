import 'package:demo_app/app/state/auth/auth_state.dart';
import 'package:demo_app/extensions.dart';
import 'package:demo_app/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';

enum ValidateStatus {
  initial,
  inProgress,
  validated,
  invalid,
}

class LoginScreenState {
  final FieldState emailState;
  final FieldState passwordState;
  final Function addUserToDatabase;
  final ValidateStatus validateStatus;

  const LoginScreenState({
    required this.emailState,
    required this.passwordState,
    required this.addUserToDatabase,
    required this.validateStatus,
  });
}

LoginScreenState useLoginScreenState() {
  final emailState = useFieldState();
  final passwordState = useFieldState();
  final startValidateUser = useState(ValidateStatus.initial);

  Future<void> addUserToDatabase(BuildContext context) async {
    // MARK: How to use validate in FieldState?????
    startValidateUser.value = ValidateStatus.inProgress;
    if (emailState.value.isNotEmpty && passwordState.value.length > 5) {
      await Future.delayed(const Duration(seconds: 2), () {});
      startValidateUser.value = ValidateStatus.validated;

      // TODO: LOL, I know
      final navigator = context.navigator;

      void navigate(String route, [Object? args]) {
        navigator.pushReplacementNamed(route, arguments: args);
      }

      navigate(HomeScreen.route);
    } else {
      // TODO: Perfrom action when an error occurs
      startValidateUser.value = ValidateStatus.invalid;
    }
  }

  return LoginScreenState(
    emailState: emailState,
    passwordState: passwordState,
    addUserToDatabase: addUserToDatabase,
    validateStatus: startValidateUser.value,
  );
}
