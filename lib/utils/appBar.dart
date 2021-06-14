import 'package:flutter/material.dart';
import 'const.dart';

Widget appBarMain(BuildContext context) {
    return AppBar(
    centerTitle: true,
    title: Column(
      children:[
        Image.asset(
        'lib/assets/LinkoneIconwithopa.png',
        height:65,
        ),
      ]
    ),
    //アイコン大きくしたいなら、toolbarHeightを指定する
    // toolbarHeight: 80,
    backgroundColor: Palette.linkone,
    elevation: 0,
  );
}