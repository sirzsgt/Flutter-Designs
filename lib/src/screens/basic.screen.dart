import 'package:designs/src/helpers/helpers.dart';
import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  final TextStyle titleStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final TextStyle subtitleStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [_banner(), _title(), _actions(), _information()],
        ),
      ),
    );
  }

  Widget _banner() {
    return Container(
      width: double.infinity,
      height: 250,
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
            'https://lacf.ca/sites/default/files/images/homepage/banners/P14%20-%20brightcropped%20for%20landing%20page_%20Bridge%20in%20Gablenz%2C%20Germany%2C%20Photo%20by%20Martin%20Damboldt%20from%20Pexels.jpg'),
      ),
    );
  }

  Widget _title() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ness Lake", style: titleStyle),
                  SizedBox(height: 5),
                  Text("Weird lake in Scottland", style: subtitleStyle)
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 30.0),
            Text("41", style: subtitleStyle)
          ],
        ),
      ),
    );
  }

  Widget _actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _action(Icons.call, "Call"),
        _action(Icons.near_me, "Route"),
        _action(Icons.share, "Share")
      ],
    );
  }

  Widget _action(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 40),
        SizedBox(height: 5.0),
        Text(text, style: TextStyle(color: Colors.blue))
      ],
    );
  }

  Widget _information() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(Helpers.loremIpsum(), style: TextStyle(fontSize: 14.0)),
      ),
    );
  }
}
