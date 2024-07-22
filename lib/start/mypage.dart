import 'package:flutter/material.dart';
import 'package:probono_app/shared/menu_bottom.dart';

const TextStyle commonTextStyle = TextStyle(
  fontFamily: 'GmarketSans',
  fontSize: 20,
  fontWeight: FontWeight.w300,
);

BoxDecoration boxdeco = BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
  boxShadow: const [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 3.0,
      offset: Offset(0, 1),
    ),
  ],
  border: Border.all(
    color: Colors.black26,
    width: 1.0,
  ),
);

Widget textbox(String label, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 0.0, right: 20.0, top: 5.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: commonTextStyle,
            ),
            const SizedBox(height: 3),
          ],
        ),
      ),
      Container(
        width: 350,
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: boxdeco,
        child: Text(
          text,
          style: commonTextStyle,
        ),
      ),
    ],
  );
}

class Mypage extends StatefulWidget {
  Mypage({super.key});

  @override
  _MypageState createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        bottomNavigationBar: MenuBottom(),
        backgroundColor: Colors.white,
        body: Center(
          child: MypageScreen(),
        ),
      ),
    );
  }
}

class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});
  @override
  _MypageScreenState createState() => _MypageScreenState();
}

String id = 'abcde';
String name = '최지훈';
String birth = '19970219';
String number = '01012341234';

class _MypageScreenState extends State<MypageScreen> {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(
            'assets/main.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          '마이페이지',
          style: TextStyle(
              fontFamily: 'GmarketSans',
              fontSize: 30,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 3),
        textbox('아이디', id),
        const SizedBox(height: 7),
        textbox('아기 이름', name),
        const SizedBox(height: 7),
        textbox('생년 월일(8자)', birth),
        const SizedBox(height: 7),
        textbox('전화번호(11자)', number),
      ],
    );
  }
}
