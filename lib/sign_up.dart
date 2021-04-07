import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/widget/my_text_field.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading=false;
  UserCredential userCredential;
  RegExp regExp = RegExp(SignUp.pattern);
  TextEditingController name = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user.uid)
          .set({
        'name': name.text.trim(),
        'userName': userName.text.trim(),
        'userid': userCredential.user.uid,
        'email': email.text.trim(),
        'password': password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        globalKey.currentState.showSnackBar(
            SnackBar(content: Text('The password provided is too weak.')));
      } else if (e.code == 'email-already-in-use') {
        globalKey.currentState.showSnackBar(SnackBar(
            content: Text('The account already exists for that email.')));
      }
    } catch (e) {
      globalKey.currentState.showSnackBar(SnackBar(content: Text(e)));
      setState(() {
        loading=false;
      });
    }
    setState(() {
        loading=false;
      }); 
  }

  void validate() {
    if (name.text.trim().isEmpty || name.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "You haven't entered your name yet",
          ),
        ),
      );
      return;
    }
    if (userName.text.trim().isEmpty || userName.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "You have to have to have a user name for yourself",
          ),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "You haven't entered password name yet",
          ),
        ),
      );
      return;
    }

    if (confirmPassword.text.trim().isEmpty ||
        confirmPassword.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "You haven't entered confirm Password yet",
          ),
        ),
      );
      return;
    }
    if (password.text.trim() != confirmPassword.text.trim()) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "your password doesn't match with confirm password",
          ),
        ),
      );
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "You haven't entered your email yet",
          ),
        ),
      );
      return;
    } else if (!regExp.hasMatch(email.text)) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Please enter valid email address!",
          ),
        ),
      );
      return;
    } else {
      setState(() {
        loading=true;
      });
      sendData();
    }
  }

  Widget button(
      {@required String buttonName,
      @required Color color,
      @required Function ontap}) {
    return RaisedButton(
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
          left: 30,
          right: 30,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: ontap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  MyTextField(
                    controller: name,
                    hintText: "Name",
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: userName,
                    hintText: "UserName",
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: password,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: confirmPassword,
                    hintText: "confirm Password",
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: email,
                    hintText: "Email",
                    obscureText: false,
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              loading?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  CircularProgressIndicator(),
                ]
              )

              
              : Row(
                children: [
                  button(
                    ontap: () {},
                    buttonName: "Cancel",
                    color: Colors.red,
                  ),
                  Spacer(),
                  button(
                      ontap: () {
                        validate();
                      },
                      buttonName: "Register",
                      color: Colors.green)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
