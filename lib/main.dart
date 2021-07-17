import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splinz/google_sign_in.dart';
import 'package:splinz/login_screen.dart';
import 'constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Splinz Technologies',
        home: FirstScreen(),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [
            Container(
            height: MediaQuery.of(context).size.height*0.45,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/first_screen.png',
              fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(
                text: TextSpan(
              text: 'Accept ',
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.black,
                  fontSize: 38,
                  fontWeight: FontWeight.w500
                ),
                children: <TextSpan> [
                  TextSpan(
                      text: 'incoming',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 28,
                  )
                  )
                ]
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Multiple Source',
              style: TextStyle(
                letterSpacing: 1,
                fontWeight: FontWeight.normal,
                fontSize: 28,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Recommened features for the assignment of orders to trucks and drivers available nearby',
                style: TextStyle(
                  letterSpacing: 1,
                  fontWeight: FontWeight.w200,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: kIconColor,
                      child: Icon(
                        Icons.arrow_right_alt,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


