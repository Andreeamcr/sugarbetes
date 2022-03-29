import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/components/icon_text_data.dart';
import 'package:sugarbetes/components/reusable_home_card.dart';
import 'package:sugarbetes/screens/alarms_screen.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/screens/sign_in_page.dart';
import 'package:sugarbetes/screens/profile_page.dart';
import 'package:sugarbetes/screens/mathematics_screen.dart';

class HomePage extends StatefulWidget {
  static String id = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamed(context, SignInPage.id);
            },
            padding: EdgeInsets.only(right: width * 0.05),
          )
        ],
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sugar.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: ReusableHomeCard(
                        color: kFullNavyBlue,
                        radius:
                            BorderRadius.only(topRight: Radius.circular(10.0)),
                        onPress: () =>
                            Navigator.pushNamed(context, ProfilePage.id),
                        cardChild: IconTextWidget(
                          icon: Icons.person,
                          label: 'Profil',
                        ),
                      )),
                      Expanded(
                        child: ReusableHomeCard(
                          color: kFullGreen,
                          radius:
                              BorderRadius.only(topLeft: Radius.circular(10.0)),
                          onPress: () =>
                              Navigator.pushNamed(context, MathPage.id),
                          cardChild: IconTextWidget(
                            icon: Icons.calculate,
                            label: 'Matematica insulinei',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: ReusableHomeCard(
                        color: kFullGreen,
                        radius: BorderRadius.zero,
                        onPress: () =>
                            Navigator.pushNamed(context, ReminderPage.id),
                        cardChild: IconTextWidget(
                          icon: Icons.notification_add,
                          label: 'Alarme',
                        ),
                      )),
                      Expanded(
                          child: ReusableHomeCard(
                        color: kFullNavyBlue,
                        radius: BorderRadius.zero,
                        onPress: () => print('HELLO4'),
                        cardChild: IconTextWidget(
                          icon: Icons.restaurant,
                          label: 'Alimente',
                        ),
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableHomeCard(
                          color: kFullNavyBlue,
                          radius: BorderRadius.zero,
                          onPress: () => print('HELLO5'),
                          cardChild: IconTextWidget(
                            icon: Icons.opacity,
                            label: 'Glicemii',
                          ),
                        ),
                      ),
                      Expanded(
                          child: ReusableHomeCard(
                        color: kFullGreen,
                        radius: BorderRadius.zero,
                        onPress: () => print('HELLO6'),
                        cardChild: IconTextWidget(
                          icon: Icons.settings,
                          label: 'Setări',
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
