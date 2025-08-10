import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuntax/providers/auth_providers.dart';

enum AppState {
  initial,
  unauthenticated,
  authenticated,
  firstTime,
}

final appStateProvider = StateProvider<AppState>((ref) {
  final authState = ref.watch(authStateChangesProvider);
  final authService = ref.watch(authServiceProvider);

  return authState.when(
    data: (user) {
      if (user != null) {
        return AppState.authenticated;
      } else {
        if (authService.isFirstTime()) {
          return AppState.firstTime;
        } else {
          return AppState.unauthenticated;
        }
      }
    },
    loading: () => AppState.initial,
    error: (e, st) => AppState.unauthenticated,
  );
});
