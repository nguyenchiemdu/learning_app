import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/models/google_sign_in.dart';
import './register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  final user = TextEditingController();
  final password = TextEditingController();
  void changeRoute(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterForm()),
    );
  }

  void signIn(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              // email: user.text,
              // password: password.text
              email: 'admin@gmail.com',
              password: 'admin123');
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text('Signed in!'),
      // ));
    } on FirebaseAuthException catch (e) {
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text(e.code),
      // ));
      print(e.code);
    }
  }

  void signInGoogle(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
        // padding: EdgeInsets.only(left: 24),
        margin: EdgeInsets.only(top: 276),
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center ,
          children: [
            Container(
              margin: EdgeInsets.only(right: 160),
              child: Text("Hello, nice to meet you!",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff303030),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(right: 29),
              padding: EdgeInsets.only(top: 3, bottom: 22),
              child: Text("Sign in with ABCXYZ APP",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff303030),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 15),
                width: 312,
                height: 53,
                padding: EdgeInsets.only(left: 20),
                decoration: new BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x26454545),
                        offset: Offset(0, 5),
                        blurRadius: 15,
                        spreadRadius: 0)
                  ],
                ),
                child: TextField(
                    controller: user,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: Color(0xff303030),
                      ),
                      hintText: 'Email',
                      contentPadding:
                          EdgeInsets.only(left: 14, top: 18, bottom: 18),
                      hintStyle: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff303030),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ))),
            Container(
                width: 312,
                height: 53,
                padding: EdgeInsets.only(left: 20),
                decoration: new BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x26454545),
                        offset: Offset(0, 5),
                        blurRadius: 15,
                        spreadRadius: 0)
                  ],
                ),
                child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xff303030),
                      ),
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.only(left: 14, top: 18, bottom: 18),
                      hintStyle: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff303030),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ))),
            Container(
              margin: EdgeInsets.only(top: 16, bottom: 18),
              child: Text("Forgot you password?",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Container(
                width: 312,
                height: 48,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: RaisedButton(
                    onPressed: () {
                      signIn(context);
                    },
                    color: Color(0xffffbf2f),
                    child: Text("Login",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xffffffff),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )))),
            Container(
              margin:
                  EdgeInsets.only(top: 21, left: 136, right: 136, bottom: 13),
              child: Text("or continue with",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 79,
                      height: 49,
                      margin: EdgeInsets.only(right: 10),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x0f000000),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                      ),
                      child: FractionallySizedBox(
                          widthFactor: 0.5,
                          heightFactor: 0.5,
                          child: Image.asset(
                            "assets/images/loginfacebook.png",
                            width: 12,
                            height: 23,
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      signInGoogle(context);
                    },
                    child: Container(
                      width: 79,
                      height: 49,
                      margin: EdgeInsets.only(left: 10),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x0f000000),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                      ),
                      child: FractionallySizedBox(
                          widthFactor: 0.5,
                          heightFactor: 0.5,
                          child: Image.asset(
                            "assets/images/logingoogle.png",
                          )),
                    ),
                  ),
                ],
              ),
            ),
            RichText(
                text: new TextSpan(children: [
              new TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.normal,
                  )),
              new TextSpan(
                  text: "Sign up",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      changeRoute(context);
                    }),
            ]))
          ],
        ),
      ))),
    );
  }
}