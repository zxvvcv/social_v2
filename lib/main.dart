import 'package:app/responsive/mobile_screen_layout.dart';
import 'package:app/responsive/responsive_layout_screen.dart';
import 'package:app/responsive/web_screen_layout.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyCOUo9boV6SLiw9jRbuUzlxQ6SEdbQi_wU',
            appId: '1:635207942095:web:728be9178fbd116a2f5cba',
            messagingSenderId: '635207942095',
            projectId: 'socialapp-f2719',
            storageBucket: 'socialapp-f2719.appspot.com'),);
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home:  LoginScreen(),
    );
  }
}
