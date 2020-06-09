import 'package:firebase_user_avatar_flutter/app/home/home_page.dart';
import 'package:firebase_user_avatar_flutter/app/sign_in/sign_in_page.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_storage_service.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget ({Key key,@required this.snapshot}) : super(key : key);
  final AsyncSnapshot<User> snapshot;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(snapshot.connectionState == ConnectionState.active){
      return snapshot.hasData ? HomePage() : SignInPage();
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
