import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  //-----------------------------------------------------------------------------------------------------------------------------------------------------
  //  █████╗ ██╗   ██╗████████╗██╗  ██╗    ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗ █████╗ ██╗     ██╗████████╗██╗   ██╗
  // ██╔══██╗██║   ██║╚══██╔══╝██║  ██║    ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔══██╗██║     ██║╚══██╔══╝╚██╗ ██╔╝
  // ███████║██║   ██║   ██║   ███████║    █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████║██║     ██║   ██║    ╚████╔╝
  // ██╔══██║██║   ██║   ██║   ██╔══██║    ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║██╔══██║██║     ██║   ██║     ╚██╔╝
  // ██║  ██║╚██████╔╝   ██║   ██║  ██║    ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║██║  ██║███████╗██║   ██║      ██║
  // ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝   ╚═╝      ╚═╝
  //-----------------------------------------------------------------------------------------------------------------------------------------------------

  //--------------------------------------------
  // Private variables for Auth Functionality
  //--------------------------------------------
  String _email = '';
  String _token = '';
  String _role = '';
  // --------------------------------------------
  // Getters for Auth Functionality
  // --------------------------------------------
  String get email => _email;
  String get token => _token;
  String get role => _role;

  //----------------------------------------
  // Setters for Auth Functionality
  //----------------------------------------
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

  //----------------------------
  // Clear  Functionality
  //----------------------------
  void clear() {
    _email = '';
    _token = '';
    _role = '';
    notifyListeners();
  }
  //------------------------------------------------------------------------------------------------------------------------------------
  // ██████╗ ███████╗ ██████╗ ██╗███████╗████████╗███████╗██████╗      █████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗
  // ██╔══██╗██╔════╝██╔════╝ ██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝
  // ██████╔╝█████╗  ██║  ███╗██║███████╗   ██║   █████╗  ██████╔╝    ███████║██║     ██║     ██║   ██║██║   ██║██╔██╗ ██║   ██║
  // ██╔══██╗██╔══╝  ██║   ██║██║╚════██║   ██║   ██╔══╝  ██╔══██╗    ██╔══██║██║     ██║     ██║   ██║██║   ██║██║╚██╗██║   ██║
  // ██║  ██║███████╗╚██████╔╝██║███████║   ██║   ███████╗██║  ██║    ██║  ██║╚██████╗╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║   ██║
  // ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝
  //------------------------------------------------------------------------------------------------------------------------------------

  //-----------------------------
  // Register User Provider
  //-----------------------------

  String _firstName = '';
  String _lastName = '';
  String _username = '';
  String _registeremail = '';
  String _address = '';
  String _password = '';
  String _confirmPassword = '';
  String _phoneNumber = '';
  String _country = '';
  String _state = '';
  String _city = '';

  // Getters
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get username => _username;
  String get regiseremail => _registeremail;
  String get address => _address;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String get phoneNumber => _phoneNumber;
  String get country => _country;
  String get state => _state;
  String get city => _city;

  // Setters
  void setRegisterFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  void setRegisterConfirPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  void setRegisterLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  void setRegisterUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setRegisterEmail(String value) {
    _registeremail = value;
    notifyListeners();
  }

  void setRegisterAddress(String value) {
    _address = value;
    notifyListeners();
  }

  void setRegisterPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setRegisterPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setRegisterCountry(String value) {
    _country = value;
    notifyListeners();
  }

  void setRegisterState(String value) {
    _state = value;
    notifyListeners();
  }

  void setRegisterCity(String value) {
    _city = value;
    notifyListeners();
  }

  // Clear Functionality
  void clearUserData() {
    _firstName = '';
    _lastName = '';
    _username = '';
    _registeremail = '';
    _address = '';
    _password = '';
    _confirmPassword = '';
    _phoneNumber = '';
    _country = '';
    _state = '';
    _city = '';
    notifyListeners();
  }

  //  ██████╗ ███████╗████████╗    ██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
  // ██╔════╝ ██╔════╝╚══██╔══╝    ██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
  // ██║  ███╗█████╗     ██║       ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗
  // ██║   ██║██╔══╝     ██║       ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝
  // ╚██████╔╝███████╗   ██║       ██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
  //  ╚═════╝ ╚══════╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝
}
