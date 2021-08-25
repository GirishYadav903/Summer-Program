import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MYBOTTOMNAVIGATION extends StatefulWidget {
  @override
  _MYBOTTOMNAVIGATIONState createState() => _MYBOTTOMNAVIGATIONState();
}

class _MYBOTTOMNAVIGATIONState extends State<MYBOTTOMNAVIGATION> {
  Color bgcolor = Colors.blueAccent;
  var txt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      // appBar: AppBar(
      //   title: Text("for navigation bar"),
      // ),
      body: Center(
        child: Text(
          txt,
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        backgroundColor: bgcolor,
        items: [
          Icon(Icons.home),
          Icon(Icons.details),
          Icon(Icons.settings),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              bgcolor = Colors.blueAccent;
              txt = "home page";
            }
            if (index == 1) {
              bgcolor = Colors.yellowAccent;
              txt = "about page";
            }
            if (index == 2) {
              bgcolor = Colors.pinkAccent;
              txt = "settings page";
            }
          });
        },
      ),
    );
  }
}
