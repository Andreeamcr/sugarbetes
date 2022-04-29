import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sugarbetes/screens/home_page.dart';
import 'package:sugarbetes/utils/constants.dart';
import '../utils/background_design.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
import 'package:sugarbetes/components/form_field.dart';
import 'package:sugarbetes/components/bottom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  static String id = 'signUp';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  String? lastName;
  String? firstName;
  String email = '';
  String password = '';
  String? confirmPass;
  bool showSpinner = false;
  String kConfirmLabel = "Confirmare parolă";
  TextStyle? changedLabelColor;
  // @override
  // void initState() {
  //   super.initState();
  //   Firebase.initializeApp().whenComplete(()
  //   {
  //     print("connection completed");
  //     setState(() {
  //
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Stack(children: [
      BackgroundColorWidget(),
      Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
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
                    padding: EdgeInsets.symmetric(vertical: height * 0.07),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyCircleAvatar(
                          imageUrl: 'assets/images/BloodSugar.jpg',
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Text(
                          'Creare cont',
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
                    color: kFullGreen,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        MyFormField(
                            inputLabel: 'Introduceți numele',
                            icon: Icon(Icons.people),
                            obscure: false,
                            suggestions: true,
                            onChange: (value) {
                              lastName = value;
                            }),
                        MyFormField(
                            inputLabel: 'Introduceți prenumele',
                            icon: Icon(Icons.people),
                            obscure: false,
                            suggestions: true,
                            onChange: (value) {
                              firstName = value;
                            }),
                        MyFormField(
                            inputLabel: 'Introduceți adresa de email',
                            icon: Icon(Icons.email),
                            obscure: false,
                            suggestions: true,
                            onChange: (value) {
                              email = value;
                            }),
                        MyFormField(
                            inputLabel: 'Introduceți parola',
                            icon: Icon(Icons.password),
                            obscure: true,
                            suggestions: false,
                            onChange: (value) {
                              password = value;
                            }),
                        MyFormField(
                            inputLabel: kConfirmLabel,
                            labelColor: changedLabelColor,
                            icon: Icon(Icons.password),
                            obscure: true,
                            suggestions: false,
                            onChange: (value) {
                              confirmPass = value;
                            }),
                        BottomButton(
                          label: 'Crează cont',
                          onPress: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            if (confirmPass != password) {
                              print("does not match!");
                              kConfirmLabel = "Parola incorecta";
                              changedLabelColor = TextStyle(color: Colors.red);
                            } else {
                              kConfirmLabel = "Confirmare parola";
                              changedLabelColor = TextStyle(color: Colors.blue);

                              try {
                                final existingUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                if (existingUser != null) {
                                  Navigator.pushNamed(context, HomePage.id);
                                }
                                FirebaseFirestore.instance
                                    .collection('registration')
                                    .add({
                                  'lastname': lastName,
                                  'firstname': firstName,
                                  'email': email
                                });
                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                print(e);
                                setState(() {
                                  showSpinner = false;
                                });
                              }
                            }
                          },
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
    ]);
  }
}
