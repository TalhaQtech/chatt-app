import 'package:chat_app/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var firebaseUser;
  var userModel;
   HomePage({Key? key,  this. firebaseUser,  this. userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
