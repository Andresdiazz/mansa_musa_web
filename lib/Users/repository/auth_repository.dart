import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';

import 'firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase(String email, String password) => _firebaseAuthAPI.emailAndPasswordSignIn(email, password);
  Future<FirebaseUser> signInGoogle() => _firebaseAuthAPI.signIn();
  Future<FirebaseUser> createAccount(String email, String password) => _firebaseAuthAPI.createAccountEmailAndPassword(email, password);
  void signOut() => _firebaseAuthAPI.signOut();

}
