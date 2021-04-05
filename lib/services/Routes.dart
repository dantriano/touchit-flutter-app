import 'package:flutter/material.dart';
import 'package:touchit_app/src/screens/home/home.dart';
import 'package:touchit_app/src/screens/login/login.dart';
import 'package:touchit_app/src/screens/timeline/timeline.dart';
import 'package:touchit_app/src/styles/styles.dart';

const R_TEST = '/';
const R_LOGIN = '/login';
const R_HOME = '/home';
const R_TIMELINE = '/timeline';

class Routes {
  static RouteFactory routes() {
    return (settings) {
      //final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case R_TEST:
          screen = Theme(data: Style.theme(), child: LoginScreen());
          break;
        case R_LOGIN:
          screen = Theme(data: Style.theme(), child: LoginScreen());
          break;
        case R_HOME:
          screen = Theme(data: Style.theme(), child: Home());
          break;
        case R_TIMELINE:
          screen = Theme(data: Style.theme(), child: TimeLine());
          break;
        /*case HomeRoute:
          screen = Theme(
              data: Style.locationTheme(),
              child: Home(arguments['id']));
          break;*/
        default:
          screen = Theme(data: Style.theme(), child: Home());
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
