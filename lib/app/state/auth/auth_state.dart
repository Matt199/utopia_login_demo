import 'package:flutter/material.dart';
import 'package:utopia_hooks/utopia_hooks.dart';

class AuthState {
  final bool isUserDataLoaded;
  final String? userId;

  const AuthState({
    required this.isUserDataLoaded,
    required this.userId,
  });
}

class AuthStateProvider extends HookStateProviderWidget<AuthState> {
  @override
  AuthState use() {
    final userState = useMemoizedFuture<String?>(
      () async => await Future.delayed(
          const Duration(seconds: 2), () => "userID-qwerty"),
      initialData: null,
    );
    return AuthState(
        isUserDataLoaded: userState.connectionState == ConnectionState.done,
        userId: userState.data.toString());
  }
}
