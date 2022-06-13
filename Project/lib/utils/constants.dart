import 'package:flutter/material.dart';

import '../components/chart_data.dart';

const Color kGradient1 = Color(0xFF255B7C);
const Color kGradient2 = Color(0xFF77E6B6);
const Color kFullGreen = Color(0xFF7DEB9E);
const Color kFullNavyBlue = Color(0xFF22577A);
const Color kHighValue = Color(0xffecb3);
const Color kLowValue = Color(0xf44336);

const kWelcomeText = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w600,
  fontFamily: 'MontserratAlternates',
);
const kNotHavingAccountText = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  fontFamily: 'MontserratAlternates',
);
const kHyperlinkTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontFamily: 'MontserratAlternates',
  color: Colors.blue,
);
const kIconTextLabel = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontFamily: 'MontserratAlternates',
  color: Colors.black,
);
const kGenderTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontFamily: 'MontserratAlternates',
  color: Colors.black,
);
const kMathTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  fontFamily: 'MontserratAlternates',
  color: Colors.black,
);
const kMathTextStyleBold = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w900,
  fontFamily: 'MontserratAlternates',
  color: Colors.black,
);
const kToggleText = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w900,
  fontFamily: 'MontserratAlternates',
  color: Colors.black,
);
const kTimeBold = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w900,
  fontFamily: 'MontserratAlternates',
  color: kFullGreen,
);

const List<String> nivelActivitate = [
  'Repaus la pat',
  'Activitate nivel ușor',
  'Activitate nivel mediu',
  'Activitate nivel intensiv'
];

const List<String> zile = [
  'Azi',
  'O zi în urmă',
  'Două zile în urmă',
  'Trei zile în urmă',
  'Patru zile în urmă',
  'Cinci zile în urmă',
  'Șase zile în urmă',
];
const Map<String, int> daysMapped =
{
  'Azi': 0,
  'O zi în urmă': 1,
  'Două zile în urmă': 2,
  'Trei zile în urmă': 3,
  'Patru zile în urmă': 4,
  'Cinci zile în urmă': 5,
  'Șase zile în urmă': 6
};

const Map<int, List<int>> glucoseValues = {
  0: [88, 92, 86, 95, 100, 101, 97, 127, 153, 136, 102, 109, 124 /*ora: 12*/, 112, 142, 122, 105, 94, 92, 86, 80, 111, 99, 93 ],
  1: [88, 92, 86, 95, 100, 101, 97, 127, 153, 136, 102, 109, 124 /*ora: 12*/, 112, 142, 122, 105, 94, 92, 86, 80, 111, 99, 93 ],
  2: [88, 92, 86, 95, 100, 101, 97, 127, 153, 136, 102, 109, 124 /*ora: 12*/, 112, 142, 122, 105, 94, 92, 86, 80, 111, 99, 93 ],
  3: [88, 92, 86, 95, 100, 101, 97, 127, 153, 136, 102, 109, 124 /*ora: 12*/, 112, 142, 122, 105, 94, 92, 86, 80, 111, 99, 93 ],
  4: [88, 92, 86, 95, 100, 101, 97, 127, 153, 136, 102, 109, 124 /*ora: 12*/, 112, 142, 122, 105, 94, 92, 86, 80, 111, 99, 93 ],
  5: [88, 92, 86, 95, 100, 101, 97, 127, 153, 136, 102, 109, 124 /*ora: 12*/, 112, 142, 122, 105, 94, 92, 86, 80, 111, 99, 93 ],
  6: [88, 92, 86, 95, 100, 101, 97, 127, 153, 136, 102, 109, 124 /*ora: 12*/, 112, 142, 122, 105, 94, 92, 86, 80, 111, 99, 93 ]
};

