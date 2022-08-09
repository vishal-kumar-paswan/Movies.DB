import 'package:flutter/material.dart';

class Constants {
  static const Color white = Colors.white;
  static Color blue = Colors.blueAccent;

  static const backgroundColor = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 0, 0, 0),
        Color.fromARGB(255, 13, 4, 44),
      ],
    ),
  );

  static const TextStyle inputTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  static cardTextStyle(BuildContext buildContext) => TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(buildContext).size.width * 0.04,
        fontWeight: FontWeight.w500,
      );

  static InputDecoration textFeildInputDecoration(
          IconData inputTypeIcon, String inputTypeLabel) =>
      InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          inputTypeIcon,
          color: Constants.white,
          size: 24,
        ),
        hintText: inputTypeLabel,
        hintStyle: const TextStyle(
          color: Constants.white,
          fontSize: 17,
        ),
      );
}
