import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tuntax/services/auth_service.dart'; // Will create this next

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

  // Methods to manually trigger state changes if needed (e.g., after login/logout)
  void setAuthenticated() {
    state = AuthState.authenticated;
  }

  void setUnauthenticated() {
    state = AuthState.unauthenticated;
  }
}

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider); // Will create this next
  return AuthStateNotifier(authService);
});
