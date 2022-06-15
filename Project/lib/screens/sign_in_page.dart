import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sugarbetes/components/bottom_button.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
import 'package:sugarbetes/components/form_field.dart';
import 'package:sugarbetes/screens/welcome_page.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/services/databaseService.dart';
import 'home_page.dart';
import 'sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInPage extends StatefulWidget {
  static String id = 'signIn';
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool showSpinner = false;
  String kEmailLabel = 'Introduceți adresa de email';
  String kPasswordLabel = 'Introduceţi parola';
  TextStyle? changedPassLabelColor;
  TextStyle? changedEmailLabelColor;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, WelcomePage.id);
              },
            ),
            backgroundColor: Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(height * 0.07),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyCircleAvatar(
                            imageUrl: 'assets/images/logo_circle.png',
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text(
                            'Autentificare',
                            style: kWelcomeText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                        color: kFullGreen),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.05,
                          ),
                          MyFormField(
                            inputLabel: kEmailLabel,
                            labelColor: changedEmailLabelColor,
                            icon: Icon(Icons.email),
                            obscure: false,
                            suggestions: true,
                            onChange: (value) {
                              email = value;
                            },
                          ),
                          MyFormField(
                              inputLabel: kPasswordLabel,
                              labelColor: changedPassLabelColor,
                              icon: Icon(Icons.password),
                              obscure: true,
                              suggestions: false,
                              onChange: (value) {
                                password = value;
                              }),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.05),
                            child: InkWell(
                              child: Text(
                                "Mi-am uitat parola",
                                style: kHyperlinkTextStyle,
                              ),
                              onTap: () {
                                print("I forgot my password");
                              },
                            ),
                          ),
                          BottomButton(
                              label: 'Autentificare',
                              onPress: () async {
                                setState(() {
                                  showSpinner = true;
                                });
                                try {
                                  final existingUser =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);
                                  if (existingUser != null) {
                                    DatabaseService dbService =
                                        DatabaseService();
                                    dbService.getCurrentUserData(email);
                                    Navigator.pushNamed(context, HomePage.id);
                                  }
                                  setState(() {
                                    showSpinner = false;
                                  });
                                } on FirebaseAuthException catch (e) {
                                  print(e);
                                  if (e.code == 'user-not-found') {
                                    kEmailLabel =
                                        'Acest email nu este înregistrat';
                                    kPasswordLabel = 'Introduceţi parola';
                                    changedEmailLabelColor =
                                        TextStyle(color: Colors.red);
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  } else if (e.code == 'wrong-password') {
                                    changedEmailLabelColor = TextStyle();
                                    kEmailLabel = 'Introduceți adresa de email';
                                    kPasswordLabel = 'Parolă incorectă';
                                    changedPassLabelColor =
                                        TextStyle(color: Colors.red);
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  } else if (e.code == 'invalid-email') {
                                    kEmailLabel =
                                        'Formatul acestui email este invalid';
                                    changedEmailLabelColor =
                                        TextStyle(color: Colors.red);
                                    kPasswordLabel = 'Introduceţi parola';
                                    changedPassLabelColor = TextStyle();
                                  } else {
                                    changedPassLabelColor = TextStyle();
                                    kPasswordLabel = 'Introduceţi parola';
                                    changedEmailLabelColor = TextStyle();
                                    kEmailLabel = 'Introduceți adresa de email';
                                  }
                                  setState(() {
                                    showSpinner = false;
                                  });
                                }
                              }),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.05, right: width * 0.02),
                                child: Text(
                                  "Nu ai un cont?",
                                  style: kNotHavingAccountText,
                                ),
                              ),
                              InkWell(
                                  child: Text(
                                    "Crează cont",
                                    style: kHyperlinkTextStyle,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(context, SignUpPage.id);
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
