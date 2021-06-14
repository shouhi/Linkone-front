import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkone/screens/auth/auth.dart';

import '../root.dart';
import 'const.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
Widget drawerMain(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
              color: Palette.linkone,
            ),
            child: Center(
              child: new Text(
                'アプリについて',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            )),
        ListTile(
            leading: Icon(Icons.home),
            title: Text('ホーム'),
            onTap: () {
              String uid = FirebaseAuth.instance.currentUser.uid;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RootWidget()),
                  (_) => false);
            }),
        ListTile(
            leading: Icon(Icons.favorite),
            title: Text('レビュー'),
            onTap: () {
              // 後に関数生成
              // _toreview();
            }),
        ListTile(
            leading: Icon(Icons.settings),
            title: Text('利用契約'),
            onTap: () {
              // _tocontract();
            }),
        ListTile(
            leading: Icon(Icons.pan_tool),
            title: Text('プライバシーポリシー'),
            onTap: () {
              // _topolicy();
            }),
        ListTile(
          leading: Icon(Icons.mail),
          title: Text('お問い合わせ'),
          onTap: () {
            // _tocontact();
          },
        ),
        ListTile(
            leading: Icon(Icons.logout),
            title: Text('ログアウト'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('ログアウトしてもよろしいですか？'),
                      actions: [
                        FlatButton(
                          child: Text('ログアウト'),
                          onPressed: () async {
                            await _auth.signOut();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthScreen()),
                                (_) => false);
                          },
                        ),
                        FlatButton(
                          child: Text('キャンセル'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            })
      ],
    ),
  );
}