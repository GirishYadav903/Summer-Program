import 'dart:async';
// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task11/app_screens/home_screen.dart';
import 'package:task11/app_screens/registration_Form.dart';

class SPLASHSCREEN extends StatefulWidget {
  @override
  _SPLASHSCREENState createState() => _SPLASHSCREENState();
}

class _SPLASHSCREENState extends State<SPLASHSCREEN> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => VERIFICATIONPAGE()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // appBar: AppBar(
      //   title: Text("splashscreen"),
      // ), // run this code than
      child: Padding(
          padding: const EdgeInsets.all(40),
          child: Expanded(
            child: Image(
                image: NetworkImage(
                    "https://www.creative-tim.com/blog/content/images/wordpress/2019/09/cover-0408-FlutterMessangerDemo-Luke_Newsletter-30d5a65064b44f0ef56a801d4811964a.png")),
          )
          // Image(
          //   image: NetworkImage(
          //       "https://down-yuantu.pngtree.com/element_our/bg/20191001/bg/20f8cc9b52566.png?e=1629865233&st=MmQzMTk3MGFmOGJiZGVmMzQxNzRlZjA0NTZkODliOGI&n=%E2%80%94Pngtree%E2%80%94user+login+or+authenticate+icon_5089976.png"),
          // ),
          ),
    );
  }
}

class VERIFICATIONPAGE extends StatefulWidget {
  @override
  _VERIFICATIONPAGEState createState() => _VERIFICATIONPAGEState();
}

class _VERIFICATIONPAGEState extends State<VERIFICATIONPAGE> {
  var _myformkey = GlobalKey<FormState>();
  var _password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? email;
  String? passwd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text("LOGIN"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.all(50.0),
                child: Form(
                  key: _myformkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          onChanged: (val) {
                            email = val;
                          },
                          validator: (msg) {
                            if (msg == null || msg.isEmpty) {
                              return "Enter Email";
                            } else if (msg.length < 10) {
                              return "Enter the valid Email ID";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Email",
                              // labelStyle: TextStyle(fontSize: 20.0),
                              hintText: "Enter your name",
                              // hintStyle: TextStyle(fontSize: 20.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          obscureText: true,
                          onChanged: (val) {
                            passwd = val;
                          },
                          keyboardType: TextInputType.text,
                          validator: (msg) {
                            if (msg == null || msg.isEmpty) {
                              return "Enter the password";
                            } else if (msg.length < 7) {
                              return "not valid";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter your password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton(
                    onPressed: () async {
                      print(passwd);
                      if (_myformkey.currentState!.validate()) {
                        final UserCredential newUser =
                            await _auth.signInWithEmailAndPassword(
                                email: email!, password: passwd!);
                        if (newUser != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HOMESCREEN()),
                          );
                        }
                      }
                    },
                    child: Text("LOGIN")),
              ),
              SizedBox(
                height: 150.0,
              ),
              TextButton(
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MYFORM()));
                  },
                  child: Text("New User? Create Account!!")),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
