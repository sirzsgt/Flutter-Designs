import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [_firstStep(), _secondStep(context)],
      ),
    );
  }

  Widget _firstStep() {
    return Stack(
      children: [_backgroundColor(), _backgroundImage(), _texts()],
    );
  }

  Widget _secondStep(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, "ButtonsScreen");
          },
          color: Color.fromRGBO(108, 192, 218, 0.5),
          shape: StadiumBorder(),
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text("Welcome", style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }

  Widget _backgroundColor() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _backgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _texts() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text("11°",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold)),
          Text("Miercoles",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600)),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70, color: Colors.white)
        ],
      ),
    );
  }
}
