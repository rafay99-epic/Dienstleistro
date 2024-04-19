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

  String _id = '';
  String _token = '';
  String _role = '';
  String _email = '';

  // Getters for Auth Functionality
  String get id => _id;
  String get token => _token;
  String get role => _role;
  String get email => _email;

  // Setters for Auth Functionality
  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setRole(String role) {
    _role = role;
    notifyListeners();
  }

  void setId(String id) {
    _id = id;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void clear() {
    _token = '';
    _role = '';
    _id = "";
    _email = "";
    notifyListeners();
  }

// ███████╗███████╗████████╗ ██████╗██╗  ██╗    ██╗   ██╗███████╗███████╗██████╗     ██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
// ██╔════╝██╔════╝╚══██╔══╝██╔════╝██║  ██║    ██║   ██║██╔════╝██╔════╝██╔══██╗    ██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
// █████╗  █████╗     ██║   ██║     ███████║    ██║   ██║███████╗█████╗  ██████╔╝    ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗
// ██╔══╝  ██╔══╝     ██║   ██║     ██╔══██║    ██║   ██║╚════██║██╔══╝  ██╔══██╗    ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝
// ██║     ███████╗   ██║   ╚██████╗██║  ██║    ╚██████╔╝███████║███████╗██║  ██║    ██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
// ╚═╝     ╚══════╝   ╚═╝    ╚═════╝╚═╝  ╚═╝     ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝

  String _name = '';
  String _profilePic = '';
  String _phoneNo = '';
  String _userAddress = '';
  String _userCountry = '';
  String _userState = '';
  String _userlanguage = '';
  String _userZipcode = '';
  String _aboutMe = '';
  String _facebook = '';
  String _twitter = '';
  String _instagram = '';
  String _website = '';
  String _other = '';
  String _proffesion = '';
  String _usergender = '';
  String _youtube = '';

  String get name => _name;
  String get profilePic => _profilePic;
  String get phoneNo => _phoneNo;
  String get userAddress => _userAddress;
  String get userCountry => _userCountry;
  String get userState => _userState;
  String get userlanguage => _userlanguage;
  String get userZipcode => _userZipcode;
  String get aboutMe => _aboutMe;
  String get facebook => _facebook;
  String get twitter => _twitter;
  String get instagram => _instagram;
  String get website => _website;
  String get other => _other;
  String get proffesion => _proffesion;
  String get usergender => _usergender;
  String get youtube => _youtube;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setProfilePic(String profilePic) {
    _profilePic = profilePic;
    notifyListeners();
  }

  void setPhoneNo(String phoneNo) {
    _phoneNo = phoneNo;
    notifyListeners();
  }

  void setUserAddress(String address) {
    _userAddress = address;
    notifyListeners();
  }

  void setUserCountry(String country) {
    _userCountry = country;
    notifyListeners();
  }

  void setUserState(String state) {
    _userState = state;
    notifyListeners();
  }

  void setUserLanguage(String language) {
    _userlanguage = language;
    notifyListeners();
  }

  void setUserZipcode(String zipcode) {
    _userZipcode = zipcode;
    notifyListeners();
  }

  void setAboutMe(String aboutMe) {
    _aboutMe = aboutMe;
    notifyListeners();
  }

  void setFacebook(String facebook) {
    _facebook = facebook;
    notifyListeners();
  }

  void setTwitter(String twitter) {
    _twitter = twitter;
    notifyListeners();
  }

  void setInstagram(String instagram) {
    _instagram = instagram;
    notifyListeners();
  }

  void setWebsite(String website) {
    _website = website;
    notifyListeners();
  }

  void setOther(String other) {
    _other = other;
    notifyListeners();
  }

  void setProffesion(String proffesion) {
    _proffesion = proffesion;
    notifyListeners();
  }

  void setUsergender(String usergender) {
    _usergender = usergender;
    notifyListeners();
  }

  void setYoutube(String youtube) {
    _youtube = youtube;
    notifyListeners();
  }

  // Clear Functionality

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
