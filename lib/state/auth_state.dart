import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tuntax/models/user_model.dart';
import 'package:tuntax/services/auth_service.dart';
import 'package:tuntax/services/database_service.dart';
import 'package:tuntax/utils/app_preferences.dart';

enum AuthState {
  initial,
  unauthenticated,
  authenticated,
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthStateNotifier(this._authService) : super(AuthState.initial) {
    _authService.authStateChanges().listen((User? user) {
      if (user == null) {
        state = AuthState.unauthenticated;
      } else {
        state = AuthState.authenticated;
      }
    });
  }

  Future<void> completeFirstTimeUserExperience() async {
    await AppPreferences.setIsFirstTimeUser(false);
  }

  // Methods to manually trigger state changes if needed (e.g., after login/logout)
  void setAuthenticated() {
    state = AuthState.authenticated;
  }

  void setUnauthenticated() {
    state = AuthState.unauthenticated;
  }
}

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthStateNotifier(authService);
});

final userProvider = StreamProvider<UserModel?>((ref) {
  final authService = ref.watch(authServiceProvider);
  final databaseService = ref.watch(databaseServiceProvider);

  return authService.authStateChanges().asyncMap((user) {
    if (user != null) {
      return databaseService.getUser(user.uid);
    }
    return null;
  });
});
