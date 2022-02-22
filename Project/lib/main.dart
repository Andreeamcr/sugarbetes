import 'package:flutter/material.dart';
import 'package:sugarbetes/screens/sign_up_page.dart';
import 'screens/welcome_page.dart';

void main() => runApp(MyApp());

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
      },
      // home: WelcomePage(),
    );
  }
}
