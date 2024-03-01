import 'package:dienstleisto/frontend/screens/functionality/auth/signup.dart';
import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              //image for logo
              // Image.asset(""),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Welcome Back",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Sign in to continue",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              hintText: 'Email',
              fillColor: Colors.grey,
              hintColor: Colors.white,
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              controller: emailController,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Password',
              fillColor: Colors.grey,
              hintColor: Colors.white,
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              controller: passwordController,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      const Text('Remember Me'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle forgot password here
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {},
              text: "Login",
              enableIcon: false,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              padding: const EdgeInsets.only(left: 80.0, right: 80.0),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "or",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPressed: () {
                // Handle button press
              },
              icon: FontAwesomeIcons.google,
              text: 'Google',
              enableIcon: true,
              backgroundColor: Colors.amber[600],
              borderRadius: 10.0,
              padding: const EdgeInsets.only(left: 80.0, right: 80.0),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0, right: 90.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'New to Diensleisto?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signUp()),
                      );
                    },
                    child: const Text(
                      ' Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
