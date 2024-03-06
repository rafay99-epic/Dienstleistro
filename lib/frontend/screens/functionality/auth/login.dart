import 'package:dienstleisto/frontend/screens/functionality/auth/forgetPassword.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/signup.dart';
import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

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
    // Get the screen size
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.15, width: size.width * 0.5),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          fontStyle: FontStyle.italic,
                          fontFamily: "ABeeZee",
                        ),
                      ),
                      TextSpan(
                        text: '\nback',
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
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Sign in to continue",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 25),
              CustomTextField(
                hintText: 'Email',
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Password',
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
                controller: passwordController,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.green, // inkwell color
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(
                                rememberMe
                                    ? Icons.check
                                    : Icons.check_box_outline_blank,
                                color: rememberMe ? Colors.green : Colors.black,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                rememberMe = !rememberMe;
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
                      // Handle forgot password here
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
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  //logic for sign In Button from firebase

                  //check for all fields no field is empty

                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 10,
                        duration: const Duration(seconds: 2),
                        width: size.width * 0.9,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        showCloseIcon: true,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "Please fill all the feilds",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                    return;
                  } else {
                    //* check email and password from firebase

                    //* if correct then login in start session

                    //* if not then show case a snak bar telling wrong email or password or a dialog box
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
                icon: FontAwesomeIcons.facebook,
                text: 'Sign in with Facebook',
                enableIcon: true,
                backgroundColor: Theme.of(context).colorScheme.background,
                borderRadius: 10.0,
                buttonTextColor: Theme.of(context).colorScheme.primary,
                buttonTextSize: 17,
                buttonTextAlign: TextAlign.center,
                buttonTextFontFamily: 'ABeeZee',
                buttonTextfontStyle: FontStyle.italic,
                iconColor: Theme.of(context).colorScheme.primary,
              ),
              Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
