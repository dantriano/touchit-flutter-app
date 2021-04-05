import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:touchit_app/src/screens/home/delayed_animation.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:touchit_app/src/screens/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class Clock {
  String date;
  String time;
}

class Service {
  String name;
  bool isBreak;
  DateTime start;
  DateTime end;
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Clock _clock = new Clock();

  final int delayedAmount = 500;
  double _scale;
  var alert, alertColor;
  AnimationController _controller;
  bool isIn = false, hasService = false;
  var service;
  List<Widget> listServices;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _getTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listServices = [
      ListTile(
          leading: Icon(Icons.text_fields),
          title: Text("Custom"),
          onTap: () async {
            Navigator.of(context).pop();
            var currentTeam = await _serviceDialog(context);
            print(currentTeam);
          }),
      ListTile(
        leading: Icon(Icons.person),
        title: Text("Comida"),
        onTap: () {
          _setService(true, "Comida");
        },
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text("Medico"),
        onTap: () {
          _setService(true, "Medico");
        },
      ),
    ];
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
          centerTitle: true,
          title: const Text('Touch it'),
        ),
        key: scaffoldKey,
        drawer: CommonDrawer(),
        backgroundColor: Color(0xFF8185E2),
        body: bodyData(context));
  }

  Widget bodyData(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    alert = (!isIn) ? 'Has entrado' : 'Has salido';
    alertColor = (!isIn) ? Colors.green : Colors.red;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          _clock.date,
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.white),
        ),
        Text(
          _clock.time,
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 35.0, color: Colors.white),
        ),
        SizedBox(
          height: 20.0,
        ),
        DelayedAimation(
          child: GestureDetector(
            onTap: () {
              showSimpleNotification(context, Text(alert),
                  background: alertColor);
              setState(() {
                isIn = !isIn;
              });
            },
            child: _avatarGlow,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        DelayedAimation(
          child: Column(children: <Widget>[
            Text(
              "Company Name",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 35.0, color: color),
            ),
            SizedBox(
              height: 0.0,
            ),
            Text(
              "Control de Personal",
              style: TextStyle(fontSize: 20.0, color: color),
            ),
            SizedBox(
              height: 80.0,
            ),
            GestureDetector(
              onTap: () {
                (hasService) ? _setService(false) : _openBottomSheet(context);
              },
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              child: Transform.scale(
                scale: _scale,
                child: _animatedButtonUI,
              ),
            )
          ]),
          delay: delayedAmount + 1000,
        ),
        Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
                //alignment:new Alignment(x, y)
                children: <Widget>[
              Text(
                  "Status: " +
                      ((isIn) ? 'Dentro' : 'Fuera') +
                      ((hasService) ? ' (' + service + ')' : ''),
                  style: TextStyle(fontSize: 15.0, color: color)),
              SizedBox(
                height: 50.0,
              ),
            ]))
      ],
    ));
  }

  Future<String> _serviceDialog(BuildContext context) async {
    bool inTime = false;
    final _formKey = GlobalKey();
    Service customService = new Service();
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          content: Form(
              key: _formKey,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "SERVICE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.redAccent,
                              width: 0.5,
                              style: BorderStyle.solid),
                        ),
                      ),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Expanded(
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your first name.';
                                }
                              },
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              onSaved: (val) =>
                                  setState(() => customService.name = val),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CheckboxListTile(
                        title: const Text("Include in Time",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 15.0,
                            )),
                        value: inTime,
                        onChanged: (val) {
                          setState(() => inTime = val);
                        }),
                  ])),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                final form = _formKey.currentState;
              },
            ),
          ],
        );
      },
    );
  }

  Widget get _serviceDialog2 => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)), //this right here
        child: Container(
          height: 300.0,
          width: 300.0,
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Text(
                        "SERVICE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                new Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: TextField(
                          obscureText: true,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'samarthagarwal@live.com',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                ),
              ]),
        ),
      );
  Widget get _avatarGlow => AvatarGlow(
        endRadius: 100,
        duration: Duration(seconds: 2),
        glowColor: Colors.white24,
        repeat: true,
        repeatPauseDuration: Duration(seconds: 2),
        startDelay: Duration(seconds: 1),
        child: Material(
            elevation: 8.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: (isIn) ? Colors.red[300] : Colors.green[300],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*FlutterLogo(
                      size: 50.0,
                    ),*/
                    Text((isIn) ? 'Salir' : 'Entrar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0))
                  ]),
              radius: 80.0,
            )),
      );

  void _getTime() {
    final DateTime now = DateTime.now();
    setState(() {
      _clock.time = DateFormat('hh:mm:ss').format(now);
      _clock.date = DateFormat('MM/dd/yyyy').format(now);
    });
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            (hasService) ? 'Finalizar Servicio' : 'Servicios',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8185E2),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _setService(bool hasService, [String name]) {
    var alertColor = hasService ? Colors.green : Colors.red;
    var alertText =
        hasService ? "Iniciado servicio " + name : "Servicio Finalizado";
    if (hasService) Navigator.of(context).pop();
    setState(() {
      this.hasService = hasService;
      this.service = name;
    });
    showSimpleNotification(context, Text(alertText), background: alertColor);
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: listServices,
          );
        });
  }
}
