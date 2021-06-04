import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Utils {  
  static void showErrorDialog(dynamic err, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          AlertDialog(
            title: Text("エラーが発生しました\n" + err.toString()),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
    );
  }

  static String emailValidator(String value) {
    Pattern pattern =
        r'^\w[\w.-]*@kwansei\.ac\.jp$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return '関西学院大学のメールアドレスを使用して下さい';
    } else {
      return null;
    }
  } 

  static String pwdValidator(String value) {
    if (value.length < 8) {
      return 'パスワードは8文字以上で入力してください';
    } else {
      return null;
    }
  } 

}