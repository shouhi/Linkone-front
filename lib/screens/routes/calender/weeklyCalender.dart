import 'package:flutter/material.dart';

class WeeklyCalender extends StatefulWidget {
  @override
  _WeeklyCalenderState createState() => _WeeklyCalenderState();
}

class _WeeklyCalenderState extends State<WeeklyCalender> {
  @override
  void initState() {
    super.initState();
  }

  Column calculateDaymonth(int index) {
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    int weekday = DateTime.now().weekday;
    int resultDay = DateTime.now().day + index;
    int error = 0;
    const Map<int, String> weekdayMap = {
      1: "月",
      2: "火",
      3: "水",
      4: "木",
      5: "金",
      6: "土",
      7: "日",
    };

    //月に30日までの時
    if (month == 4 || month == 6 || month == 9 || month == 11) {
      if (resultDay >= 31) {
        resultDay = resultDay - 30;
        error = 1;
      }
    }
    //月31日までの時
    else {
      if (resultDay >= 32) {
        resultDay = resultDay - 31;
        error = 1;
      }
    }

    //2月の時(閏年∴29日)
    if (month == 2 && year % 4 == 0) {
      if (resultDay >= 30) {
        resultDay = resultDay - 29;
        error = 1;
      }
    }
    //2月の時(閏年∴29日)
    if (month == 2 && year % 4 != 0) {
      if (resultDay >= 29) {
        resultDay = resultDay - 28;
        error = 1;
      }
    }
    int resultMonth = month + error == 13 ? 1 : month + error;

    int culWeekdayvalue =
        weekday + index >= 8 ? weekday + index - 7 : weekday + index;

    String resultWeekday = weekdayMap[culWeekdayvalue];

    Color colors = Colors.grey[700];
    if (resultWeekday == "土") {
      colors = Colors.blue;
    }
    if (resultWeekday == "日") {
      colors = Colors.red;
    }

    return Column(
      children: [
        Row(
          children: [
            Text(
              "$resultMonth/$resultDay",
              style: TextStyle(
                fontSize: 21,
                fontFamily: "mediumfont",
              ),
            ),
          ],
        ),
        Text(
          "$resultWeekday",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "mediumfont",
            color: colors,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('一週間カレンダー'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: List.generate(7, (index) {
          return InkWell(
            onTap: () {
              print(index); //課題詳細画面への遷移処理入れる
            },
            child: Card(
              color: Colors.amber[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                height: deviceHeight * 0.1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                          child: calculateDaymonth(index),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: VerticalDivider(
                        width: 5,
                        thickness: 0.5,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                color: Colors.white,
                              )
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
