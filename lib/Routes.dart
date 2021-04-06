import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:touchit_app/ui/screens/home/home.dart';
import 'package:touchit_app/ui/screens/login/login.dart';
import 'package:touchit_app/ui/screens/timeline/timeline.dart';
import 'package:touchit_app/constants/styles/styles.dart';

import 'core/services/graphql.dart';
import 'core/services/shared_preferences_service.dart';

const R_TEST = '/';
const R_LOGIN = '/login';
const R_HOME = '/home';
const R_TIMELINE = '/timeline';

class Routes {
  static FutureBuilder loadGraphql(screen) {
    return FutureBuilder<String>(
        future: sharedPreferenceService.token,
        builder: (BuildContext ctx, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return GraphQLProvider(
              client: Graphql.initailizeClient(), child: screen);
        });
  }

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
      return MaterialPageRoute(
          builder: (BuildContext context) => loadGraphql(screen));
    };
  }
}
