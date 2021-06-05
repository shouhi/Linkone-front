// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// class TutorialPage extends StatefulWidget {
//   @override
//   _TutorialPageState createState() => _TutorialPageState();
// }

// class _TutorialPageState extends State<TutorialPage> {
//   final introKey = GlobalKey<IntroductionScreenState>();

//   void _onIntroEnd(context) {
//     // Navigator.of(context).push(
//     //   MaterialPageRoute(builder: (_) => SignUp()),
//     // );
//   }

//   Widget _buildImage(String assetName) {
//     return Container(
//       margin: EdgeInsets.only(top: 50),
//       child: Align(
//         child: Image.asset(
//           'assets/tutorial/$assetName.png',
//           width: 400,
//           height: 400,
//         ),
//         alignment: Alignment.bottomCenter,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     const bodyStyle = TextStyle(fontSize: 19.0);
//     const pageDecoration = const PageDecoration(
//       titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
//       bodyTextStyle: bodyStyle,
//       descriptionPadding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
//       pageColor: Colors.white,
//     );

//     return IntroductionScreen(
//       key: introKey,
//       pages: [
//         PageViewModel(
//           title: "大学課題管理アプリ",
//           body:
//               "welcome",
//           image: Align(
//             child: Image.asset('images/protask.PNG', height: 250.0),
//             alignment: Alignment.bottomCenter,
//           ),
//           decoration: PageDecoration(
//             // titleTextStyle: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700, color: Const.utilColor["white"]),
//             // bodyTextStyle: TextStyle(fontSize: 23.0, color: Const.utilColor["white"]),
//             // pageColor: Const.utilColor["protask"],
//           ),
//         ),
//         PageViewModel(
//           title: "一週間カレンダー",
//           body:
//               "直近一週間のカレンダーに締め切りの課題を表示しています。",
//           image: _buildImage('calender'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "課題詳細画面",
//           body:
//               "カレンダーの課題をタップするとその日にある課題の詳細を見ることができます。",
//           image: _buildImage('task'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "課題一覧",
//           body:
//               "課題の一覧を表示しています。課題が終わったらチェックボックスに✔をつけよう！",
//           image: _buildImage('tasklist'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "タスク追加",
//           body: "自分でタスクを追加することも可能です！タスク管理に使いましょう！",
//           image: _buildImage('addtask'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "注意点",
//           body:
//               "このアプリは関西学院大学公認のアプリではございません。また、ProTaskアプリを使用するには、学生メールアドレス・システム利用ID及びパスワードによる会員登録が必要になります。",
//           image: Align(
//             child: Image.asset('assets/tutorial/ojigi_animal_kuma.png', height: 250.0),
//             alignment: Alignment.bottomCenter,
//           ),
//           decoration: PageDecoration(
//             titleTextStyle: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700, color: Colors.white),
//             bodyTextStyle: TextStyle(fontSize: 23.0, color: Colors.white),
//             // pageColor: Const.utilColor["protask"],
//           ),
//         ),
//       ],
//       onDone: () => _onIntroEnd(context),
//       onSkip: () => _onIntroEnd(context),
//       showSkipButton: true,
//       skipFlex: 0,
//       nextFlex: 0,
//       skip: const Text('Skip'),
//       next: const Icon(Icons.arrow_forward),
//       done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
//       dotsDecorator: const DotsDecorator(
//         size: Size(10.0, 10.0),
//         color: Color(0xFFBDBDBD),
//         activeSize: Size(22.0, 10.0),
//         activeShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//         ),
//       ),
//     );
//   }
// }
