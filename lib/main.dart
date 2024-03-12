import 'package:dienstleisto/backend/auth/auth_gate.dart';
import 'package:dienstleisto/frontend/screens/functionality/job/details/JonDetail01.dart';
import 'package:dienstleisto/frontend/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightmode,
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      // home: const JobDetail01(),
    );
  }
}
