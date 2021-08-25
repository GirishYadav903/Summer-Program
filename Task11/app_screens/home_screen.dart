// ignore: unused_import
// import 'dart:html';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:task11/app_screens/menu_drawer.dart';
import 'package:task11/app_screens/splash_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HOMESCREEN extends StatefulWidget {
  @override
  _HOMESCREENState createState() => _HOMESCREENState();
}

class _HOMESCREENState extends State<HOMESCREEN> {
  // _launchURL() async {
  //   const url = "https://flutter.dev/";
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw "could not launch $url";
  //   }
  // }
  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Color bgcolor = Colors.blueAccent;
  var txt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        elevation: 15,
        // toolbarOpacity: 1,
        backgroundColor: bgcolor,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("REALAPP"),
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => VERIFICATIONPAGE()));
              },
              icon: Icon(Icons.logout)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Image(
                    height: 150,
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTJSp-P6efwsvzMuv_rHcRugaZcIxzgh7x7A&usqp=CAU")),
              ),
            ),
            ElevatedButton(onPressed: _launchURL, child: Text("Docker")),
            SizedBox(height: 2),
            Container(
              child: Center(
                child: Image(
                    height: 150.0,
                    image: NetworkImage(
                        "https://mk0getcloudify4yiua1.kinstacdn.com/wp-content/uploads/2020/08/Icon_02_081020.png")),
              ),
            ),
            ElevatedButton(onPressed: _launchURL, child: Text("Kubernetes")),
          ],
        ),
      ),
      drawer: MYDRAWER(),
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
              bgcolor = Colors.yellowAccent;
              // txt = "CHOOSE THE SERVICE THAT YOU WANT TO PERFORM";
              // ElevatedButton(onPressed: () {}, child: Text("DOCKER SERVICES"));
              // ElevatedButton(
              //     onPressed: () {}, child: Text("KUBERNETES SERVICES"));
              Center(
                  child: Column(children: [
                Container(
                  margin: EdgeInsets.all(25),
                  child: TextButton(
                    child: Text(
                      'SignUp',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: TextButton(
                    child: Text(
                      'LogIn',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    // color: Colors.blueAccent,
                    // textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ]));
            }
            if (index == 1) {
              Center(
                child: Text("setting page"),
              );
              bgcolor = Colors.greenAccent;
              txt = "about page";
            }
            if (index == 2) {
              bgcolor = Colors.pinkAccent;
              txt = "settings page";
            }
          });
        },
      ),
      // leading: GestureDetector(
      //   onTap: () {
      //     MYDRAWER();
      //   },
      //   child: Icon(Icons.menu),
    );
  }
}
