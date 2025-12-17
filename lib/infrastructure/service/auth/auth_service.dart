import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/screens/auth_wrapper/auth_wrapper.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(name);
      return userCredential.user;
    }
    // on FirebaseAuthException catch (e) {
    //   throw Exception(e.message);
    // }
    on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception("This email is already registered.");
      } else if (e.code == 'invalid-email') {
        throw Exception("Invalid email address.");
      } else if (e.code == 'weak-password') {
        throw Exception("Password is too weak.");
      }
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Something went Wrong");
    }
  }

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found with this email');
      } else if (e.code == 'wrong-password') {
        throw Exception('Incorrect password');
      } else if (e.code == 'invalid-email') {
        throw Exception('Invalid email address');
      }
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Something went wrong during sign-in');
    }
  }

  Stream<User?> authstateChanges() {
    return _auth.authStateChanges();
  }

  Future<void> signOut(BuildContext context) async {
    final navigator = Navigator.of(context);

    await _auth.signOut();
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => AuthWrapper()),
      (route) => false,
    );
    // Navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>AuthWrapper()), newRoute, predicate)
  }
}
