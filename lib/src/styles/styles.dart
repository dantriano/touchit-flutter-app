import 'package:flutter/material.dart';

class Style {
  static const LargeTextSize = 26.0;
  static const MediumTextSize = 15.0;
  static const BodyTextSize = 12.0;
  static const SubtitleTextSize = 7.0;

  static const String FontNameDefault = 'Montserrat';

  static const AppBarTextStyle = TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w300,
      fontSize: LargeTextSize,
      color: Colors.white);
  static const LocationTitle = TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w300,
      fontSize: LargeTextSize,
      color: Colors.white);
  static const LocationBody = TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w300,
      fontSize: BodyTextSize,
      color: Colors.white);
  static const LocationDate = TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w100,
      fontSize: MediumTextSize,
      color: Colors.red);
  static const LocationSubititle = TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w300,
      fontSize: SubtitleTextSize,
      color: Colors.red);
  static const LocationListTitle = TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w300,
      fontSize: LargeTextSize,
      color: Colors.white);

  static const LocationListSubHead = TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w300,
      fontSize: MediumTextSize,
      color: Colors.red);

  static const LocationListSubtitle = TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: FontWeight.w300,
      fontSize: SubtitleTextSize,
      color: Colors.white);

  static ThemeData appTheme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: TextTheme(),
            color: Colors.red));
  }

  static AppBar appBar() {
    return AppBar(
        centerTitle: true,
        title: Text('TRAVELS & CO.'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme());
  }

  static ThemeData theme() {
    var themeData = ThemeData(
        textTheme: TextTheme());
    return themeData;
  }
}
