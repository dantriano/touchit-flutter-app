import 'package:flutter/material.dart';
import 'package:touchit_app/Routes.dart';
import 'package:touchit_app/constants/utils/data.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Pawan Kumar",
            ),
            accountEmail: Text(
              "mtechviral@gmail.com",
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage(Data.defaultAvatarImage),
            ),
          ),
          new ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(R_HOME);

              //Navigator.pop(context);
            },
            title: Text(
              "Main",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          new ListTile(
            title: Text(
              "Shopping",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
          ),
          new ListTile(
            title: Text(
              "Dashboard",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
          ),
          new ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(R_TIMELINE);
            },
            title: Text(
              "Timeline",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.timeline,
              color: Colors.cyan,
            ),
          ),
          Divider(),
          new ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
          ),
          Divider(),
          AboutListTile(
            applicationIcon: FlutterLogo(
              textColor: Colors.yellow,
            ),
            icon: FlutterLogo(
              textColor: Colors.yellow,
            ),
            aboutBoxChildren: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Developed By Pawan Kumar",
              ),
              Text(
                "MTechViral",
              ),
            ],
            applicationName: 'Pills APP',
            applicationVersion: "1.0.1",
            applicationLegalese: "Apache License 2.0",
          )
        ],
      ),
    );
  }
}
