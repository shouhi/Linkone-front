import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:linkone/models/auth_model.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  final List<String> _days = [
    '月',
    '火',
    '水',
    '木',
    '金',
  ];
  int _dayIndex;
  int _periodIndex;
  List<Widget> _classList = [];
  List<String> _tableSetClassNames = List(30);
  List<String> _tableSetTeacherNames = List(30);
  List<int> _tableSetColorIds = List(30);

  @override
  void initState() {
    for (var i = 0; i < 30; i++) {
      _tableSetClassNames[i] = '';
      _tableSetTeacherNames[i] = '';
      _tableSetColorIds[i] = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('時間割'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          //月~金の曜日の箇所
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white24,
              padding: EdgeInsets.only(left: 35.0),
              child: GridView.count(
                crossAxisCount: 5,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio:
                    (MediaQuery.of(context).size.width - 50 * 2 - 29) /
                        5 /
                        25, //画面幅に応じて幅可変、高さは25で固定
                children: daySet(),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //1限~6限の箇所
                    constraints: BoxConstraints.expand(width: 35.0),
                    child: GridView.count(
                      crossAxisCount: 1,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: 29.0 / 85.6,
                      children: periodSet(),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints.expand(
                        width: (MediaQuery.of(context).size.width -
                            50 * 2 -
                            29 +
                            92)),
                    child: GridView.count(
                      //授業カラムが入る箇所
                      crossAxisCount: 5,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: (MediaQuery.of(context).size.width -
                              50 * 2 -
                              29 +
                              58) /
                          5 /
                          93.3,
                      children: classSet(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //月~金生成リスト
  List<Widget> daySet() {
    List<Widget> days = [];

    for (var i = 0; i < 5; i++) {
      days.add(
        Container(
          child: Center(
            child: Text(
              _days[i],
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w200,
                // fontFamily: "Roboto",     いい感じのフォントあれば
              ),
            ),
          ),
        ),
      );
    }
    return days;
  }

  //1~6限生成リスト
  List<Widget> periodSet() {
    List<Widget> periods = [];

    for (var i = 1; i <= 6; i++) {
      periods.add(
        Container(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Center(
            child: Text(
              "$i",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto",
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Color.fromARGB(100, 0, 0, 0)),
            ),
            color: Colors.grey[200],
          ),
        ),
      );
    }
    return periods;
  }

  //授業カラム生成リスト
  List<Widget> classSet(BuildContext context) {
    List<Widget> classes = [];

    for (var i = 0; i < 5 * 6; i++) {
      classes.add(
        Container(
          child: FlatButton(
            color: ConstantValues().getColorList(150)[_tableSetColorIds[i]],
            padding: EdgeInsets.all(0.0),
            //詳細に飛んだり追加したりの機能実装していく
            onPressed: () => print(i),
            // tapTable(context, i),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    //Text量によって表示をコントロール（一旦20文字程度）授業名
                    _tableSetClassNames[i].length < 21
                        ? _tableSetClassNames[i]
                        : _tableSetClassNames[i].substring(0, 20),
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                  Text(
                    //Text量によって表示をコントロール（一旦15文字程度）教師名
                    _tableSetTeacherNames[i].length < 15
                        ? _tableSetTeacherNames[i]
                        : _tableSetTeacherNames[i].substring(0, 15),
                    style: TextStyle(
                      fontSize: 9.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Color.fromARGB(100, 0, 0, 0)),
              left: BorderSide(color: Color.fromARGB(100, 0, 0, 0)),
            ),
          ),
        ),
      );
    }
    return classes;
  }
}

class ConstantValues {
  List<Color> tableColors = <Color>[];

  //Color型のリストを取得
  List<Color> getColorList(int opacity) {
    tableColors = [
      Color.fromARGB(opacity, 255, 255, 255), //0 <-デフォルト値（白透明）
      Color.fromARGB(opacity, 245, 176, 144), //1
      Color.fromARGB(opacity, 252, 215, 161), //2
      Color.fromARGB(opacity, 255, 249, 177), //3
      Color.fromARGB(opacity, 215, 231, 175), //4
      Color.fromARGB(opacity, 165, 212, 173), //5
      Color.fromARGB(opacity, 162, 215, 212), //6
      Color.fromARGB(opacity, 159, 217, 246), //7
      Color.fromARGB(opacity, 163, 188, 226), //8
      Color.fromARGB(opacity, 165, 154, 202), //9
      Color.fromARGB(opacity, 207, 167, 205), //10
      Color.fromARGB(opacity, 244, 180, 208), //11
    ];
    return tableColors;
  }
}
