import 'package:firebase_user_avatar_flutter/app/sign_in/auth_widget.dart';
import 'package:firebase_user_avatar_flutter/app/sign_in/auth_widget_builder.dart';
import 'package:firebase_user_avatar_flutter/app/sign_in/sign_in_page.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_storage_service.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_service.dart';
import 'package:firebase_user_avatar_flutter/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
            create: (context) => FirebaseAuthService()),
        Provider<ImagePickerService>(create: (context) => ImagePickerService()),
      ],
      child: AuthWidgetBuilder(
        builder: (context, snapshot) {
          return MaterialApp(
              theme: ThemeData(primarySwatch: Colors.indigo),
              home: AuthWidget(snapshot: snapshot));
        },
      ),
    );
  }
}
