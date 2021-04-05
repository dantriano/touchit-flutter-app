import 'package:flutter/material.dart';
import 'package:touchit_app/src/screens/timeline/calendar.dart';
import 'package:touchit_app/src/screens/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';

class TimeLine extends StatefulWidget {
  @override
  TimeLineState createState() => TimeLineState();
}

class TimeLineState extends State<TimeLine> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                /* Navigator.push(
                    context,
                    MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return MonthPickerPage();
                      },
                      fullscreenDialog: true,
                    ));*/
                _openCalendar(context);
              },
            )
          ],
          centerTitle: true,
          title: const Text('PillsApp'),
        ),
        key: scaffoldKey,
        drawer: CommonDrawer(),
        backgroundColor: Colors.white,
        body: bodyData());
  }

  void _openCalendar(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
            title: new Text("Do you like flutter?"),
            children: <Widget>[MonthPickerPage()]));
  }

  Widget bodyData() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
            headerTitle("Febrero 2019"),
            headerTime(" 17/01/2019 (8:30h)"),
            bodyTime(),
            headerTime(" 17/01/2019 (8:30h)"),
            bodyTime(),
            headerTime(" 17/01/2019 (8:30h)"),
            bodyTime(),
            headerTime(" 17/01/2019 (8:30h)"),
            bodyTime(),
            headerTime(" 17/01/2019 (8:30h)"),
            bodyTime(),
            headerTime(" 17/01/2019 (8:30h)"),
            bodyTime(),
            headerTime(" 17/01/2019 (8:30h)"),
            bodyTime(),
            headerTime(" 17/01/2019 (8:30h)"),
            bodyTime(),
            headerTime(" 17/01/2019 (8:30h)"),
            bodyTime(),
            headerTime(" 17/01/2019 (8:30h)"),
            bodyTime(),
          ])),
    );
  }

  Widget headerTitle(text) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0))
          ]),
      color: Colors.grey[300],
    );
  }

  Widget headerTime(text) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(children: <Widget>[Icon(CupertinoIcons.time), Text(text)]),
      color: Colors.grey[200],
    );
  }

  Widget bodyTime() {
    return Stack(children: <Widget>[
      Positioned(
          top: 2.0,
          left: 4.0,
          child: Row(
              children: <Widget>[Icon(CupertinoIcons.time), Text(' 12:13')])),
      Positioned(
          bottom: 4.0,
          left: 4.0,
          child: Row(
              children: <Widget>[Icon(CupertinoIcons.time), Text(' 12:13')])),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
          color: Colors.black,
          width: 2.0,
        ))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("13:30 - 14:00  My Awesome Border (3h)"),
              SizedBox(height: 10),
              Text("13:30 - --  My Awesome Border (3h)")
            ]),
      )
    ]);
  }
}
