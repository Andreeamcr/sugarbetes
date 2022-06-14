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
  1: [101, 94, 85, 88, 99, 101, 105, 110, 112, 147, 155, 136, 114 /*ora: 12*/, 109, 146, 179, 205, 188, 121, 109, 65, 113, 110, 97 ],
  2: [173, 70, 65, 52, 53, 61, 60, 60, 97, 133, 139, 115, 109 /*ora: 12*/, 126, 112, 70, 101, 109, 105, 81, 93, 66, 72, 151 ],
  3: [138, 132, 147, 150, 155, 122, 124, 127, 130, 112, 102, 100, 96 /*ora: 12*/, 88, 137, 114, 108, 74, 99, 83, 136, 114, 107, 101 ],
  4: [115, 104, 122, 135, 117, 106, 105, 110, 129, 136, 112, 90, 99 /*ora: 12*/, 95, 236, 189, 129, 108, 122, 107, 97, 118, 101, 92 ],
  5: [57, 79, 177, 196, 154, 144, 128, 127, 169, 180, 146, 119, 116 /*ora: 12*/, 107, 153, 102, 96, 105, 67, 104, 88, 119, 100, 91 ],
  6: [256, 209, 270, 298, 221, 176, 168, 169, 148, 124, 118, 110, 155 /*ora: 12*/, 159, 183, 144, 133, 129, 126, 111, 109, 110, 117, 102 ]
};

