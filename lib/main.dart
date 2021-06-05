import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:linkone/root.dart';
import 'package:provider/provider.dart';

import 'package:linkone/screens/auth/auth.dart';
import 'package:linkone/screens/routes/home.dart';
import 'package:linkone/models/auth_model.dart';
// import 'package:linkone/screens/tutorial.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Linkone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _LoginCheck(),
      ),
    );
  }
}

class _LoginCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ログイン状態に応じて、画面を切り替える
    //AuthModelで一括管理
    final bool _loggedIn = context.watch<AuthModel>().loggedIn;
    return _loggedIn
        ? RootWidget()
        : AuthScreen();
  }
}