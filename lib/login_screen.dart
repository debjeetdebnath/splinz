import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splinz/google_sign_in.dart';
import 'constant.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'signed_in_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Text(
                          'Login Account',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Hello,welcome back to your account',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 20
                        )
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 15,
                    child:Image.asset('assets/usa.png',),
                  ),
                  Icon(
                    Icons.arrow_drop_down
                  )
                ],
              ),
              SizedBox(
                height: 55,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Email'),
                    Container(
                      child: Center(
                        child: Text(
                          'Phone Number',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(55),
                      ),
                      height: 45,
                      width: 150,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: kContainerColor,
                  borderRadius: BorderRadius.circular(55),
                ),
                height: 75,
                width: 350,
              ),
              SizedBox(
                height: 55,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  Text('Phone Number'),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                        border: Border.all(
                          color: Colors.black
                        )
                    ),
                    height: 75,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: CountryCodePicker(
                            onChanged: print,
                            alignLeft: true,
                            hideSearch: false,
                            showDropDownButton: true,
                            initialSelection: 'IN',
                            favorite: ['+91','IN'],
                          ),
                        ),
                        Expanded(
                            child: Text('8103593658')
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                child: Center(
                  child: Text(
                    'Request OTP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                height: 75,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                  color: kIconColor,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Text(' or Sign in with Google '),
              SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () async{
                  final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                  provider.googleLogin();
                  await Navigator.push(context, MaterialPageRoute(builder: (context) => SignedIn()));
                },
                child: Container(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget> [
                         Image.asset('assets/google.png',
                         scale: 15,
                         ),
                         Text(
                           '   Google',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontSize: 20,
                             color: Colors.black,
                           ),
                          ),
                       ],
                     ),
                  height: 75,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    color: kContainerColor,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RichText(
                  text:TextSpan(
                    text:  'Not Registered yet?',
                    style: TextStyle(
                      color: Colors.black
                    ),
                    children: <TextSpan> [
                      TextSpan(
                        text: ' Create An Account',
                        style: TextStyle(
                          color: Colors.red
                        )
                      )
                    ]
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


