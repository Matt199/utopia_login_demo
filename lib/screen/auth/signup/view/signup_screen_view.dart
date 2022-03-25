import 'package:demo_app/common/app_logo.dart';
import 'package:demo_app/common/constants/app_values.dart';
import 'package:demo_app/common/widgets/button/button.dart';
import 'package:demo_app/common/widgets/field/text/app_text_field.dart';
import 'package:demo_app/screen/auth/signup/state/signup_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:utopia_utils/utopia_utils.dart';

class SignUpScreenView extends StatelessWidget {
  final SignupScreenState state;

  const SignUpScreenView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLogo(),
        _buildTextFields(context),
        _buildSubmitButton(context),
      ],
    );
  }

  Widget _buildLogo() {
    return const Padding(
      padding: EdgeInsets.only(top: 40, bottom: 60),
      child: AppLogo(
        heroEnabled: true,
        size: AppValues.bigLogoSize,
      ),
    );
  }

  Widget _buildTextFields(BuildContext context) {
    return AutofillGroup(
      child: Column(
        children: [
          AppTextField(
            state: state.nameState,
            hint: const Text("John Doe"),
            label: const Text(
              "Name",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          AppTextField(
            state: state.emailState,
            hint: const Text("user@gmail.com"),
            label: const Text(
              "Email",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          AppTextField(
            state: state.passwordState,
            hint: const Text("password"),
            label: const Text(
              "Password",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            obscuredState: MutableValue(true),
          ),
          const SizedBox(height: 16),
          AppTextField(
            state: state.confirmPasswordState,
            hint: const Text("password"),
            label: const Text(
              "Confirm password",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            obscuredState: MutableValue(true),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: state.startValidateUser
              ? const CircularProgressIndicator()
              : Button(
                  onPressed: state.addUserToDatabase,
                  text: "Log in",
                ),
        ),
      ],
    );
  }
}
