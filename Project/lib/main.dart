import 'package:flutter/material.dart';
import 'package:sugarbetes/screens/food_page.dart';
import 'package:sugarbetes/screens/formulas_screen.dart';
import 'package:sugarbetes/screens/glicemii_screen.dart';
import 'package:sugarbetes/screens/insulin_page.dart';
import 'package:sugarbetes/screens/home_page.dart';
import 'package:sugarbetes/screens/mathematics_screen.dart';
import 'package:sugarbetes/screens/profile_page.dart';
import 'package:sugarbetes/screens/settings_screen.dart';
import 'package:sugarbetes/screens/sign_in_page.dart';
import 'package:sugarbetes/screens/sign_up_page.dart';
import 'screens/settings_screen.dart';
import 'screens/welcome_page.dart';
import 'package:flutter/services.dart';
import 'screens/alarms_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //these lines are for always remaining in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        SignUpPage.id: (context) => SignUpPage(),
        SignInPage.id: (context) => SignInPage(),
        HomePage.id: (context) => HomePage(),
        ProfilePage.id: (context) => ProfilePage(),
        InsulinPage.id: (context) => InsulinPage(),
        MathPage.id: (context) => MathPage(),
        MathFormulas.id: (context) => MathFormulas(),
        ReminderPage.id: (context) => ReminderPage(),
        SettingsPage.id: (context) => SettingsPage(),
        FoodPage.id: (context) => FoodPage(),
        GlicemiiPage.id: (context) => GlicemiiPage(),
      },
      // home: WelcomePage(),
    );
  }
}
