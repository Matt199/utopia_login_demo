import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';

class SignupScreenState {
  final FieldState nameState;
  final FieldState emailState;
  final FieldState passwordState;
  final FieldState confirmPasswordState;
  final Function addUserToDatabase;
  final bool startValidateUser;

  const SignupScreenState({
    required this.nameState,
    required this.emailState,
    required this.passwordState,
    required this.confirmPasswordState,
    required this.addUserToDatabase,
    required this.startValidateUser,
  });
}

SignupScreenState useSignupScreenState() {
  final nameState = useFieldState();
  final emailState = useFieldState();
  final passwordState = useFieldState();
  final confirmPassword = useFieldState();
  final startValidateUser = useState(false);

  Future<void> addUserToDatabase() async {
    // MARK: How to use validate in FieldState?????
    startValidateUser.value = true;
    if (emailState.value.isNotEmpty && passwordState.value.length > 5) {
      await Future.delayed(const Duration(seconds: 2), () {});
      startValidateUser.value = false;
    } else {
      // TODO: Perfrom action when an error occurs
      startValidateUser.value = false;
    }
  }

  return SignupScreenState(
    nameState: nameState,
    emailState: emailState,
    passwordState: passwordState,
    confirmPasswordState: confirmPassword,
    addUserToDatabase: addUserToDatabase,
    startValidateUser: startValidateUser.value,
  );
}
