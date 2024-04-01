import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _email = '';
  String _token = '';

  String get email => _email;
  String get token => _token;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  // Add more fields as needed
}
