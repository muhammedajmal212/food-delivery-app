import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/infrastructure/service/auth/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;
  AuthProvider() {
    _authService.authstateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }
  User? get user => _user;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    setLoading(true);
    _user = await _authService.signUp(
      name: name,
      email: email,
      password: password,
    );
    setLoading(false);
    notifyListeners();
  }

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    setLoading(true);
    try {
      _user = await _authService.signIn(email: email, password: password);
      return _user; // ✅ Return the user
    } catch (e) {
      rethrow; // ✅ Propagate the exception to controller
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> signOut(BuildContext context) => AuthService().signOut(context);
}
