import 'package:flutter/material.dart';
import 'package:linkone/utils/const.dart';
class todoview extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(// 左側のアイコン
          leading: Icon(Icons.arrow_back_ios ),
          // タイトルテキスト
          title: Text('キリスト教学A', 
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold
                        )
                      ),
          backgroundColor: Palette.linkone,
        ),
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
                              ),),
                    )
                  ),

                  //ここから要素
                  Container(
                    margin: EdgeInsets.only(right: 13, left: 13, top: 6.5, bottom: 6.5),
                    decoration: BoxDecoration(
                      //角丸
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,

                    ),
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.all(13),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 7, left: 4, bottom: 9),
                              child: Text("ヤハウェのレポート",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Palette.nearBlack,
                              ),
                            ),),
                            Container(
                              margin: EdgeInsets.only(right: 1, top: 8),
                              child: 
                              Text("締め切り6月23日（火）",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Palette.nearRed,
                                  ),
                                )
                              ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: const Border(
                            bottom: const BorderSide(
                              color: Palette.underBarOffWhite,
                              width: 3,
                              
                            )
                          )
                        ),
                        
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 13, left: 13, bottom: 20),
                        child: Text("要件：wordファイルにヤハウェに関するレポートを3000字以上で書きなさい")
                      )
                    ],),
                  ),



Container(
                    margin: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      //角丸
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,

                    ),
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.all(13),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 7, left: 4, bottom: 9),
                              child: Text("ヤハウェのレポート",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Palette.nearBlack,
                              ),
                            ),),
                            Container(
                              margin: EdgeInsets.only(right: 1, top: 8),
                              child: 
                              Text("締め切り6月23日（火）",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Palette.nearRed,
                                  ),
                                )
                              ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: const Border(
                            bottom: const BorderSide(
                              color: Palette.underBarOffWhite,
                              width: 3,
                              
                            )
                          )
                        ),
                        
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 13, left: 13, bottom: 20),
                        child: Text("要件：wordファイルにヤハウェに関するレポートを3000字以上で書きなさい")
                      )
                    ],),
                  ),








              ],
            ),
          )
        ),
      )
    );
  }
}
