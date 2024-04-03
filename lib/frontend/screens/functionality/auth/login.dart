// ignore_for_file: use_build_context_synchronously, camel_case_types, library_private_types_in_public_api

import 'package:dienstleisto/backend/api/auth/auth_api.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/forgetPassword.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/signup.dart';

import 'package:dienstleisto/frontend/screens/home/navbar.dart';
import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  final Authentication _auth = Authentication();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 130.0),
              _buildWelcomeText(),
              const SizedBox(height: 10),
              _buildSignInText(),
              const SizedBox(height: 25),
              _buildEmailField(),
              const SizedBox(height: 10),
              _buildPasswordField(),
              const SizedBox(height: 15),
              _buildRememberMeAndForgotPasswordRow(context),
              const SizedBox(height: 20),
              _buildSignInButton(context, size),
              const SizedBox(height: 10),
              _buildOrText(),
              const SizedBox(height: 10),
              _buildGoogleSignInButton(context),
              _buildSignUpRow(context, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Welcome\nback',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
                fontStyle: FontStyle.italic,
                fontFamily: "ABeeZee",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: MyText(
        text: "Sign in to continue",
        fontSize: 17,
        fontFamily: "ABeeZee",
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.left,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      hintText: 'Email',
      fillColor: const Color.fromRGBO(239, 239, 244, 1),
      hintColor: Colors.grey,
      controller: _emailController,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      hintText: 'Password',
      fillColor: const Color.fromRGBO(239, 239, 244, 1),
      hintColor: Colors.grey,
      controller: _passwordController,
      showPassword: true,
      obscureText: true,
    );
  }

  Widget _buildRememberMeAndForgotPasswordRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.green,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Icon(
                      _rememberMe ? Icons.check : Icons.check_box_outline_blank,
                      color: _rememberMe ? Colors.green : Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _rememberMe = !_rememberMe;
                    });
                  },
                ),
              ),
            ),
            MyText(
              text: 'Remember Me',
              fontFamily: "ABeeZee",
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: ForgetPassword(),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
          child: MyText(
            text: 'Forgot Password?',
            fontFamily: "ABeeZee",
            fontSize: 15,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.right,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context, Size size) {
    return CustomButton(
      onPressed: () async {
        if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 10,
              duration: const Duration(seconds: 2),
              width: size.width * 0.9,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
              content: Text(
                "Please fill all the fields",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 15,
                ),
              ),
            ),
          );
          return;
        } else {
          await _handleLogin(context);
          _emailController.clear();
          _passwordController.clear();
        }
      },
      text: "Sign In",
      enableIcon: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      buttonTextColor: Theme.of(context).colorScheme.background,
      buttonTextSize: 17,
      buttonTextAlign: TextAlign.center,
      buttonTextFontFamily: 'ABeeZee',
      buttonTextfontStyle: FontStyle.italic,
    );
  }

  Widget _buildOrText() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        "or",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        try {
          await _auth.signInWithGoogle();
          // Navigate to the next page or update the UI here
        } catch (e) {
          print('Error occurred while signing in with Google: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 10,
              duration: const Duration(seconds: 2),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
              content: Text(
                "'Failed to login: $e'",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 15,
                ),
              ),
            ),
          );
          // Show an error message or handle the error here
        }
      },
      icon: FontAwesomeIcons.google,
      text: 'Sign in with Google',
      enableIcon: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      borderRadius: 10.0,
      buttonTextColor: Theme.of(context).colorScheme.primary,
      buttonTextSize: 17,
      buttonTextAlign: TextAlign.center,
      buttonTextFontFamily: 'ABeeZee',
      buttonTextfontStyle: FontStyle.italic,
      iconColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _buildSignUpRow(BuildContext context, Size size) {
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.1,
        right: size.width * 0.1,
        bottom: size.height * 0.02,
        top: size.height * 0.13,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MyText(
            text: "Don't have an account?",
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 17,
            textAlign: TextAlign.center,
            fontFamily: "ABeeZee",
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: const signUp(),
                  duration: const Duration(milliseconds: 500),
                ),
              );
            },
            child: MyText(
              text: ' Sign Up',
              color: Theme.of(context).colorScheme.primary,
              fontSize: 17,
              textAlign: TextAlign.center,
              fontFamily: "ABeeZee",
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      bool loginSuccess = await _auth.loginAPI(email, password, context);
      if (loginSuccess) {
        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        userProvider.setEmail(email);
        String role = userProvider.role;
        print('Role: $role');
        if (role == 'Seller' || role == 'Customer') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Navbar()),
          );
        } else if (role == 'Admin') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Admin not available'),
                content: const Text(
                    'Admin is not available on mobile. Please use the website for admin account.'),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {
          print('Invalid role: $role');
          // Handle invalid role or show error message
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return AlertDialog(
          //       title: const Text('Error'),
          //       content: const Text('There is some Error, Please Try again.'),
          //       actions: <Widget>[
          //         ElevatedButton(
          //           child: const Text('OK'),
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //         ),
          //       ],
          //     );
          //   },
          // );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 10,
          duration: const Duration(seconds: 2),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Invalid email or password. Please try again.',
            style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontSize: 15,
            ),
          ),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 10,
          duration: const Duration(seconds: 2),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          content: Text(
            "'Failed to login: $e'",
            style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontSize: 15,
            ),
          ),
        ),
      );
    }
  }
}
