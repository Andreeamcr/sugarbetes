import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/components/icon_text_data.dart';
import 'package:sugarbetes/components/reusable_home_card.dart';
import 'package:sugarbetes/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                        radius: BorderRadius.zero,
                        onPress: () => Navigator.pushNamed(context, '/profile'),
                        cardChild: IconTextWidget(
                          icon: Icons.person,
                          label: 'Profile',
                        ),
                      )),
                      Expanded(
                        child: ReusableHomeCard(
                          color: kFullGreen,
                          radius:
                              BorderRadius.only(topLeft: Radius.circular(10.0)),
                          onPress: () => print('HELLO2'),
                          cardChild: IconTextWidget(
                            icon: Icons.calculate,
                            label: 'Mathematics',
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
                        onPress: () => print('HELLO3'),
                        cardChild: IconTextWidget(
                          icon: Icons.notification_add,
                          label: 'Reminders',
                        ),
                      )),
                      Expanded(
                          child: ReusableHomeCard(
                        color: kFullNavyBlue,
                        radius: BorderRadius.zero,
                        onPress: () => print('HELLO4'),
                        cardChild: IconTextWidget(
                          icon: Icons.restaurant,
                          label: 'Food',
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
                          radius: BorderRadius.only(
                              topRight: Radius.circular(10.0)),
                          onPress: () => print('HELLO5'),
                          cardChild: IconTextWidget(
                            icon: Icons.opacity,
                            label: 'Blood Glucose',
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
                          label: 'Settings',
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
