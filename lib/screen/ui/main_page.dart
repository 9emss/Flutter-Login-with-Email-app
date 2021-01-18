import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/auth/auth.dart';

class MainPage extends StatelessWidget {
  final User user;
  MainPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: GestureDetector(
              onTap: () {
                AuthServices.signOut();
              },
              child: Icon(Icons.logout),
            ),
          )
        ],
        title: Text('Main Page'),
      ),
      body: Center(
        child: Text('UID : ' + user.uid),
      ),
    );
  }
}
