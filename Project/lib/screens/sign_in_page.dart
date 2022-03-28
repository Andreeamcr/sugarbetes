import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/components/bottom_button.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
import 'package:sugarbetes/components/form_field.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(height * 0.07),
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
                          inputLabel: 'Introduceți adresa de email',
                          icon: Icon(Icons.email),
                          obscure: false,
                          suggestions: true,
                          onPressed: () {},
                        ),
                        MyFormField(
                            inputLabel: 'Introduceți parola',
                            icon: Icon(Icons.password),
                            obscure: true,
                            suggestions: false,
                            onPressed: () {}),
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
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
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
                                  Navigator.pushNamed(context, '/signUp');
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
      ],
    );
  }
}
