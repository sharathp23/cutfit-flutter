import 'package:flutter/material.dart';

class MainScreenTitle extends StatelessWidget {
  const MainScreenTitle({
    Key? key,
    required this.mainWord,
    required this.secondaryWord,
    this.mainWordColor,
    this.secondaryWordColor,
  }) : super(key: key);

  final String mainWord, secondaryWord;
  final Color? mainWordColor, secondaryWordColor;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: mainWord.toUpperCase(),
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: mainWordColor ?? Colors.white,
          ),
          children: [
            TextSpan(
              text: secondaryWord.toUpperCase(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: secondaryWordColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
