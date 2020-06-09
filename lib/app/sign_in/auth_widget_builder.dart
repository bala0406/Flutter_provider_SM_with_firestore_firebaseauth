import 'package:firebase_user_avatar_flutter/app/home/home_page.dart';
import 'package:firebase_user_avatar_flutter/app/sign_in/sign_in_page.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_storage_service.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//This class is used to build user dependant objects accessible by all widgets
class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({Key key, @required this.builder}) : super(key: key);
  final Widget Function(BuildContext context, AsyncSnapshot<User> asyncSnapshot) builder;
  @override
  Widget build(BuildContext context) {
    final authService =
        Provider.of<FirebaseAuthService>(context, listen: false);

    return StreamBuilder<User>(
        stream: authService.onAuthStateChanged,
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user != null) {
            return MultiProvider(providers: [
              Provider<User>.value(value: user),
              Provider<FirebaseStorageService>(
                  create: (context) => FirebaseStorageService(uid: user.uid)),
              Provider<FirestoreService>(
                  create: (context) => FirestoreService(uid: user.uid)),
            ], child: builder(context, snapshot));
          }
          return builder(context, snapshot);
        });
  }
}
