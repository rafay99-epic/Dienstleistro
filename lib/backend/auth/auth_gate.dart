import 'package:dienstleisto/frontend/screens/home/navbar.dart';
import 'package:dienstleisto/frontend/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Navbar();
          } else {
            return const splash();
          }
        },
      ),
    );
  }
}
