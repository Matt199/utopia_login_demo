import 'package:demo_app/common/app_logo.dart';
import 'package:demo_app/common/constants/app_values.dart';
import 'package:demo_app/common/widgets/button/button.dart';
import 'package:demo_app/common/widgets/field/text/app_text_field.dart';
import 'package:demo_app/screen/auth/login/state/login_view_state.dart';
import 'package:flutter/material.dart';
import 'package:utopia_utils/utopia_utils.dart';

class LogInScreenView extends StatelessWidget {
  final LoginScreenState state;

  const LogInScreenView({Key? key, required this.state}) : super(key: key);

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
          child: state.validateStatus == ValidateStatus.inProgress
              ? const CircularProgressIndicator()
              : Button(
                  onPressed: () {
                    state.addUserToDatabase(context);
                  },
                  text: "Log in",
                ),
        ),
        if (state.validateStatus == ValidateStatus.invalid)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              "email should be 1 char long, password should be 5 char long",
              style: TextStyle(color: Colors.red),
            ),
          )
        else
          Container()
      ],
    );
  }
}
