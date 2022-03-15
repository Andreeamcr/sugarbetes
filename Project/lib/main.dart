import 'package:flutter/material.dart';
import 'package:sugarbetes/screens/home_page.dart';
import 'package:sugarbetes/screens/profile_page.dart';
import 'package:sugarbetes/screens/sign_in_page.dart';
import 'package:sugarbetes/screens/sign_up_page.dart';
import 'screens/welcome_page.dart';
import 'package:flutter/services.dart';

void main() {
  //these lines are for always remaining in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.teal,
        appBarTheme: AppBarTheme(color: Colors.transparent),
        //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/signUp': (context) => SignUpPage(),
        '/signIn': (context) => SignInPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
      },
      // home: WelcomePage(),
    );
  }
}
