import 'package:flutter/material.dart';
import 'package:touchit_app/constants/styles/styles.dart';
import 'package:touchit_app/Routes.dart';
import 'package:touchit_app/core/services/graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: Graphql.initailizeClient(''),
        child: MaterialApp(
          title: 'Touchit',
          theme: Style.appTheme(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.routes(),
        ));
  }
}
