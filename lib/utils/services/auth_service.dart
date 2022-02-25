import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  User? getCurrentUser() => _firebaseAuth.currentUser;

  Future<String> get token => getCurrentUser()!.getIdToken(true);

  // Future<Map<String, dynamic>> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   try {
  //     await _firebaseAuth.signInWithCredential(credential);
  //     return {'status': 'success', 'message': 'OK'};
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint(e.code);

  //     return {'status': 'failed', 'message': e.code.toString()};
  //   }
  // }

  // Future updateUserProfile({String? name}) async {
  //   try {
  //     await _firebaseAuth.currentUser!.updateDisplayName(name);
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint(e.code);
  //   }
  // }

  Future<Map<String, dynamic>> register(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return {'status': 'success', 'message': 'OK'};
    } on FirebaseAuthException catch (e) {
      String msg = e.code;
      if (e.code == 'weak-password') {
        msg = 'Password lemah!';
      } else if (e.code == 'email-already-in-use') {
        msg = 'Email sudah digunakan!';
      }
      return {'status': 'failed', 'message': msg};
    }
  }

  Future<Map<String, dynamic>> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return {'status': 'success', 'message': 'OK'};
    } on FirebaseAuthException catch (e) {
      String msg = e.code;
      if (e.code == 'user-not-found') {
        msg = 'User tidak ditemukan!';
      } else if (e.code == 'wrong-password') {
        msg = 'Password yang dimasukkan salah!';
      }
      return {'status': 'failed', 'message': msg};
    }
  }

  Future<void> logout() async {
    _firebaseAuth.signOut();
  }
}
