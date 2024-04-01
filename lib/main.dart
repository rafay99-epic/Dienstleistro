import 'package:dienstleisto/backend/api/auth/auth_api.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/frontend/screens/home/navbar.dart';
import 'package:dienstleisto/frontend/screens/splash.dart';
import 'package:dienstleisto/frontend/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   final Authentication _auth = Authentication();

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: lightmode,
//       debugShowCheckedModeBanner: false,
//       // home: const splash(),
//       home: FutureBuilder<bool>(
//         future: _auth.isLoggedIn(),
//         builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.data == true) {
//             return const Navbar();
//           } else {
//             return const splash();
//           }
//         },
//       ),
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Authentication _auth = Authentication();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightmode,
      debugShowCheckedModeBanner: false,
      // home: const splash(),
      home: FutureBuilder<bool>(
        future: _auth.isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.data == true) {
            return const Navbar();
          } else {
            return const splash();
          }
        },
      ),
    );
  }
}
