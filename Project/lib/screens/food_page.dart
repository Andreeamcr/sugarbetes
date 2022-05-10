import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';

class FoodPage extends StatefulWidget {
  static String id = 'food';
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  Icon customIcon = const Icon(Icons.search);
  Icon customIconBack = const Icon(Icons.arrow_back);
  Widget customSearchBar = const Text(
    'Valori nutriţionale',
    style: kMathTextStyleBold,
  );
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: customSearchBar,
            centerTitle: true,
            leading: IconButton(
              icon: customIconBack,
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: customIcon,
                onPressed: () {
                  setState(() {
                    isVisible = false;
                    if (customIcon.icon == Icons.search) {
                      customIcon = const Icon(Icons.cancel);
                      customSearchBar = const ListTile(
                        leading: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 28,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: 'Căutaţi un aliment',
                            hintStyle: kMathTextStyleBold,
                            border: InputBorder.none,
                          ),
                          style: kMathTextStyleBold,
                        ),
                      );
                    } else {
                      isVisible = true;
                      customIcon = const Icon(Icons.search);
                      customSearchBar = const Text(
                        'Valori nutriţionale',
                        style: kMathTextStyleBold,
                      );
                    }
                  });
                },
                padding: EdgeInsets.only(right: width * 0.05),
              ),
            ],
            backgroundColor: kFullNavyBlue,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.2),
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/svg/food.svg',
                        ),
                        height: height * 0.3,
                        width: width * 0.6,
                      ),
                    ),
                  ),
                  visible: isVisible,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}