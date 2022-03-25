import 'package:demo_app/app/state/auth/auth_state.dart';
import 'package:demo_app/app/state/setup/setup_state_hooks.dart';
import 'package:demo_app/screen/auth/auth_container/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:utopia_utils/utopia_utils.dart';

class SplashScreen extends HookWidget {
  static const route = '/splash';
  static final routeConfig = RouteConfig.material(SplashScreen.new);

  @override
  Widget build(BuildContext context) {
    final authState = useProvided<AuthState>();

    final navigator = context.navigator;

    void navigate(String route, [Object? args]) {
      navigator.pushReplacementNamed(route, arguments: args);
    }

    useSimpleEffectAfterSetup(() async {
      if (authState.isUserDataLoaded) {
        navigate(AuthScreen.route);
      } else {}
    }, [authState.isUserDataLoaded]);

    return const Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Text(
            "Welcome Screen",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
