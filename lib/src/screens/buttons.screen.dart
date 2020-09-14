import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:math';
import 'dart:ui';

class ButtonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
        body: Stack(
          children: [
            _background(),
            SingleChildScrollView(
              child: Column(
                children: [_titles(), _roundedButtons()],
              ),
            )
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(context));
  }

  Widget _background() {
    final Widget container = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.7),
              end: FractionalOffset(0.0, 0.9),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final Widget pinkBox = Transform.rotate(
        angle: -pi / 4.0,
        child: Container(
          width: 360,
          height: 360,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(236, 98, 188, 1.0),
                Color.fromRGBO(241, 142, 172, 1.0)
              ]),
              borderRadius: BorderRadius.circular(80),
              color: Colors.pink),
        ));
    return Stack(
      children: [container, Positioned(top: -100, child: pinkBox)],
    );
  }

  Widget _titles() {
    final TextStyle title = TextStyle(
        fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold);
    final TextStyle subtitle = TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Classify Transaction", style: title),
          SizedBox(height: 10),
          Text("Classify this transaction into a particular category",
              style: subtitle)
        ]),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), title: Container())
        ],
      ),
    );
  }

  Widget _roundedButtons() {
    return Table(
      children: [
        TableRow(children: [
          _roudedButton(Colors.pinkAccent, Icons.border_all, "General"),
          _roudedButton(Colors.purpleAccent, Icons.directions_bus, "Bus")
        ]),
        TableRow(children: [
          _roudedButton(Colors.redAccent, Icons.group, "Accounts"),
          _roudedButton(Colors.blueAccent, Icons.info, "Info")
        ]),
        TableRow(children: [
          _roudedButton(Colors.deepOrange, Icons.feedback, "Feedback"),
          _roudedButton(Colors.cyan, Icons.add, "Add")
        ]),
        TableRow(children: [
          _roudedButton(Colors.yellow, Icons.access_alarm, "Alarm"),
          _roudedButton(Colors.green, Icons.help, "Help")
        ])
      ],
    );
  }

  Widget _roudedButton(Color color, IconData icon, String title) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 5),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(icon, color: Colors.white, size: 30.0),
              ),
              Text(title, style: TextStyle(color: color)),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
