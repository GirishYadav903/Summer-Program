import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task11/app_screens/splash_screen.dart';

class MYFORM extends StatefulWidget {
  @override
  _MYFORMState createState() => _MYFORMState();
}

class _MYFORMState extends State<MYFORM> {
  var _myformkey = GlobalKey<FormState>();
  var _password = TextEditingController();
  var _confirmpassword = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("REGISTRATION"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(50.0),
          child: Form(
              key: _myformkey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (msg) {
                        if (msg == null || msg.isEmpty) {
                          return "enter name";
                        }
                        if (msg.length < 3) {
                          return "name is too short";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Name",
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
                      onChanged: (val) {
                        email = val;
                      },
                      keyboardType: TextInputType.text,
                      validator: (msg) {
                        if (msg == null || msg.isEmpty) {
                          return "Enter the Email";
                        }
                        if (msg.length < 10) {
                          return "not valid";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      onChanged: (val) {
                        password = val;
                      },
                      controller: _password,
                      validator: (msg) {
                        if (msg == null || msg.isEmpty) {
                          return "Enter Password";
                        }
                        if (msg.length < 3) {
                          return "password not valid";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      onChanged: (val) {
                        if (password == val) {
                          password = val;
                        }
                      },
                      controller: _confirmpassword,
                      validator: (msg) {
                        // if (msg == null || msg.isEmpty) {
                        //   return "confirm password";
                        // }
                        if (msg != _password.value.text) {
                          return "Wrong password";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Enter password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  )
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.done),
        onPressed: () async {
          if (_myformkey.currentState!.validate()) {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: email!, password: password!);
            if (newUser != null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VERIFICATIONPAGE()));
            }
          }
        },
      ),
    );
  }
}
