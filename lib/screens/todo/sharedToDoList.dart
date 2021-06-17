import 'package:flutter/material.dart';
import 'package:linkone/utils/const.dart';
import 'package:linkone/screens/auth/widgets/task_column.dart';
class todoview extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(// 左側のアイコン
          leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
  Navigator.pop(context);
},),
          // タイトルテキスト
          title: Text('キリスト教学A', 
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold
                        )
                      ),
          backgroundColor: Palette.linkone,
        );
    return MaterialApp(
      home: Scaffold(
        appBar: appBar,
        backgroundColor: Palette.darkOrange,
        body: Container(
          //背景色のグラデーション
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  const Color(0xffD6F1FF),
                  const Color(0xffFFE5F5),
                ],
                stops: const [
                  0.0,
                  1.0,
                ],
              ),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //角丸
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(top: 12, right: 13, left: 13, bottom: 6.5),
                    padding: EdgeInsets.only(top: 11, bottom: 11),
                    child:Center(
                      child:Text("共有された課題", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color(0xFF797979),
                              ),
                      ),
                    )
                  ),
                    //ここから要素
                  Container(
                    height: MediaQuery.of(context).size.height - appBar.preferredSize.height - 115,
                    child: Scrollbar(
                      isAlwaysShown: false,
                      child: SingleChildScrollView(
                        
                        child: Column(
                        children: [
                          decorate_todo_column("サンプルコードサンプルさードサンプルさ", "6月19日(木)", "サンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードさ"),
                          decorate_todo_column("なんかあの課題", "6月19日(木)", "wordファイルにどーたらこ"),
                          decorate_todo_column("なんかあの課題", "6月19日(木)", "サンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコード"),
                          decorate_todo_column("サンプルコードサンプルさードサンプルさ", "6月19日(木)", "サンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードさ"),
                          decorate_todo_column("なんかあの課題", "6月19日(木)", "wordファイルにどーたらこ"),
                          decorate_todo_column("なんかあの課題", "6月19日(木)", "サンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコード"),
                          decorate_todo_column("サンプルコードサンプルさードサンプルさ", "6月19日(木)", "サンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードさ"),
                          decorate_todo_column("なんかあの課題", "6月19日(木)", "wordファイルにどーたらこ"),
                          decorate_todo_column("なんかあの課題", "6月19日(木)", "サンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコードサンプルコード"),
                          ],
                        )
                      )
                    )
                  )
                ],
              ),
            )
          ),
        )
    );
  }
}
