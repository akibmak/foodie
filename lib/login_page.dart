import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:foodie/widget/my_text_field2.dart';

class LoginPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading=false;
  RegExp regExp = RegExp(LoginPage.pattern);
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  UserCredential userCredential;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  Widget button(
      {@required String buttonName,
      @required Color color,
      @required Function ontap}) {
    return Center(
      child: RaisedButton(
          color: color,
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 70,
            right: 70,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: ontap),
    );
  }
  
  Future loginAuth()async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
        setState(() {
          loading=false;
        });
      }
      setState(() {
          loading=false;
        });
    }
  }

  void validation() {
    if (email.text.trim().isEmpty ||email.text.trim() == null && password.text.trim().isEmpty ||
        password.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('All fields are Empty.')));
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('Email is Empty.')));
      return;
    }else if (!regExp.hasMatch(email.text)) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Please enter valid email address!",
          ),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('Password is Empty.')));
      return;
    } 
     else {
      setState(() {
        loading = true;
      });
      loginAuth();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      body:  SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.only(top: 100, bottom: 10, left: 50, right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        MyTextField2(
                          controller: email,
                          hintText: "Email",
                          obscureText: false,
                          icon: Icons.person_outline,
                        ),
                        SizedBox(height: 10),
                        MyTextField2(
                          controller: password,
                          hintText: "Password",
                          obscureText: true,
                          icon: Icons.lock_outline,
                        ),
                      ],
                    ),
                  ),
                ),
                loading? CircularProgressIndicator():
                 Expanded(

                  child: button(
                    buttonName: "Log In",
                    color: Colors.red,
                    ontap: () {
                      validation();
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New User?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        FlatButton(
                          child: Text(
                            "Register now.",
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
      ),
      )
    ;
  }
}
