import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuntax/models/user_model.dart';
import 'package:tuntax/services/database_service.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final DatabaseService _databaseService;

  AuthService(this._firebaseAuth, this._databaseService);

  Future<UserCredential> signUpWithEmailAndPassword(
      String email,
      String password,
      String displayName,
      String phoneNumber,
      DateTime birthDate) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update display name in Firebase Auth
      await userCredential.user?.updateDisplayName(displayName);

      // Create user model and save to Firestore
      final userModel = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        displayName: displayName,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        createdAt: DateTime.now(),
      );
      await _databaseService.createUser(userModel);

      return userCredential;
    } on FirebaseAuthException {
      rethrow; // Re-throw the exception for UI to handle
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException {
      rethrow; // Re-throw the exception for UI to handle
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  final firebaseAuth = FirebaseAuth.instance;
  final databaseService = ref.watch(databaseServiceProvider);
  return AuthService(firebaseAuth, databaseService);
});
