import 'package:flutter/material.dart';
import 'package:foodie/login_page.dart';
import 'package:foodie/sign_up.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(height: 50),
            Expanded(
              flex: 2,
                child: Container(
              color: Colors.black,
              child: Center(
                child: Image.asset('lib/assets/images/logo.jpg'),
              ),
            )),
            SizedBox(height: 50),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    "Welcome to Food Stuff",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "Order food from your favourite restaurant and",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Make reservation in real- time",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: 
            Column(children: [
              RaisedButton(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              onPressed: () {
                LoginPage();
              },
              child: Text("Login",
              style: TextStyle(color: Colors.white),),
              padding: EdgeInsets.only(top: 10,bottom: 10,left: 100,right: 100,),
              ),
              SizedBox(height: 10),
              RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              onPressed: () {
                SignUp();
              },
              child: Text("Sign Up",
              style: TextStyle(color: Colors.green),),
              padding: EdgeInsets.only(top: 10,bottom: 10,left: 100,right: 100,),
              ),
              SizedBox(height: 20),

            ],)
            
            )
          ],
        ),
      ),
    );
  }
}
