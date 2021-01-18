import 'package:flutter/material.dart';
import 'package:test_app/auth/auth.dart';
import 'package:test_app/screen/config/screen_config.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.safeBlockHorizontal * 80,
              height: SizeConfig.safeBlockVertical * 10,
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 80,
              height: SizeConfig.safeBlockVertical * 10,
              child: TextFormField(
                controller: passwordController,
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            OutlineButton(
              onPressed: () async {
                AuthServices.sigIn(
                    emailController.text, passwordController.text);
              },
              shape: StadiumBorder(),
              textColor: Colors.black,
              child: Text('Sign In'),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            OutlineButton(
              onPressed: () async {
                AuthServices.signUp(
                    emailController.text, passwordController.text);
              },
              shape: StadiumBorder(),
              textColor: Colors.black,
              child: Text('Sign Up'),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            OutlineButton(
              onPressed: () async {
                AuthServices.signInWithGoogle();
              },
              shape: StadiumBorder(),
              textColor: Colors.black,
              child: Text('Sign In with Google'),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
