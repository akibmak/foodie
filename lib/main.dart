import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:foodie/home_page.dart';


import 'package:foodie/sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Stuff',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff2b2b2b),
        appBarTheme: AppBarTheme(
          color: Color(0xff2b2b2b),
        ),
      ),
      home: HomePage(),
    );
  }
}
