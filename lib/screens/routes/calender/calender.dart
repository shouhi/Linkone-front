import 'package:flutter/material.dart';
import 'package:linkone/screens/routes/calender/weeklyCalender_route.dart';
import 'package:linkone/utils/appBar.dart';
import 'package:linkone/utils/const.dart';
import 'package:linkone/utils/drawer.dart';

import 'monthlyCalender_route.dart';


class Calender extends StatefulWidget {
  Calender({Key key}) : super(key: key);
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  TabController _controller;
  List<Widget> _buildTabs() {
    return [
      Tab(text: '週カレンダー'),
      Tab(text: '月カレンダー'),
    ];
  }

  List<Widget> _buildTabPages() {
    return [
      WeeklyCalender(),
      MonthlyCalender(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: _buildTabs().length,
            child: Scaffold(
              //ここのappbarも後に共通化
              appBar: AppBar(
                centerTitle: true,
                title: Column(
                  children:[
                    Image.asset(
                    'lib/assets/LinkoneIconwithopa.png',
                    height:65,
                    ),
                  ]
                ),
                backgroundColor: Palette.linkone,
                elevation: 0,
                bottom: TabBar(
                  controller: _controller,
                  tabs: _buildTabs(),
                ),
              ),
              drawer: drawerMain(context),
              body: TabBarView(
                controller: _controller,
                children: _buildTabPages(),
              ),
            )));
  }
}
