import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

ValueNotifier<AuthService> authServiceNotifier = ValueNotifier<AuthService>(
  AuthService(),
);

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // Sign in with email and password
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Create a new account with email and password
  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // reset password
  Future<void> resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateProfile(String name) async {
      await currentUser!.updateProfile(displayName: name);
  }

  Future<void> deleteAccount(
    String email,
    String password,
  ) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }

  Future<void> resetPasswordFromCurrentPassword(
    String email,
    String currentPassword,
    String newPassword,
  ) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }
}
