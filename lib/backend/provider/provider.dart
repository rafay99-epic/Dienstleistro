import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  // Auth Provider
  String _email = '';
  String _token = '';
  String _role = '';

  String get email => _email;
  String get token => _token;
  String get role => _role;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setRole(String role) {
    _role = role;
    notifyListeners();
  }

  // Add this method
  void clear() {
    _email = '';
    _token = '';
    _role = '';
    notifyListeners();
  }
  // Add more fields as needed
}
