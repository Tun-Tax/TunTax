import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  AuthService(this._auth, this._googleSignIn, this._prefs) {
    _initializeGoogleSignIn();
  }

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final SharedPreferences _prefs;
  bool _isGoogleSignInInitialized = false;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize();
      _isGoogleSignInInitialized = true;
    } catch (e) {
      debugPrint('Failed to initialize Google Sign-In: $e');
    }
  }

  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      await _ensureGoogleSignInInitialized();
      
      // Use authenticate() to sign in
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email'], // Specify required scopes
      );

      // In v7, we need to get authorization for Firebase
      final authClient = googleUser.authorizationClient;
      final authorization = await authClient.authorizationForScopes(['email']);
      
      if (authorization == null) {
        // Request authorization from user
        final newAuth = await authClient.authorizeScopes(['email']);
        
        // Create credential with the new authorization
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: newAuth.accessToken,
          idToken: googleUser.authentication.idToken,
        );
        
        return await _auth.signInWithCredential(credential);
      } else {
        // Use existing authorization
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: authorization.accessToken,
          idToken: googleUser.authentication.idToken,
        );
        
        return await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      // Re-throw Firebase Auth exceptions as-is
      if (e is FirebaseAuthException) {
        rethrow;
      }
      // Wrap other exceptions
      throw FirebaseAuthException(
        code: 'GOOGLE_SIGN_IN_FAILED',
        message: 'Google Sign-In failed: ${e.toString()}',
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  bool isFirstTime() {
    return _prefs.getBool('first_time') ?? true;
  }

  Future<void> setFirstTime() async {
    await _prefs.setBool('first_time', false);
  }
}