import 'package:flutter/material.dart';
import 'package:sugarbetes/screens/sign_up_page.dart';
import 'screens/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        appBarTheme: AppBarTheme(color: Color(0xFF090C22)),

        // backgroundColor: BackgroundColorWidget(),
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
