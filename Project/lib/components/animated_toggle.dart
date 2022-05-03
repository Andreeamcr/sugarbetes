import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? textColor;

  AnimatedToggle(
      {required this.values,
      required this.onToggleCallback,
      this.backgroundColor,
      this.buttonColor,
      this.textColor});

  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.3,
      height: width * 0.13,
      margin: EdgeInsets.all(15),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              var index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onToggleCallback(index);
              setState(() {});
            },
            child: Container(
              width: width * 0.3,
              height: width * 0.13,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.values.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Text(
                      widget.values[index],
                      style: kMathTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: width * 0.15,
              height: width * 0.13,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.1),
                ),
              ),
              child: Text(
                initialPosition ? widget.values[0] : widget.values[1],
                style: kMathTextStyle,
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
