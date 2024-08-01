import 'package:flutter/material.dart';
import 'package:probono_app/shared/menu_bottom.dart';
import 'package:probono_app/menu.dart';
import 'package:probono_app/two/two1.dart';
import 'package:probono_app/two/two3.dart';

class Two2 extends StatefulWidget {
  const Two2({super.key});

  @override
  _TwoState createState() => _TwoState();
}

class _TwoState extends State<Two2> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Two()));
              },
              icon: const Icon(Icons.keyboard_backspace)),
          title: const Text(
            '트름 유도 기능 수행',
            style: TextStyle(
                fontFamily: 'GmarketSans',
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        bottomNavigationBar: MenuBottom(),
        backgroundColor: Colors.white,
        body: Center(
          child: TwoScreen(),
        ),
      ),
    );
  }
}

class TwoScreen extends StatefulWidget {
  const TwoScreen({super.key});
  @override
  _TwoScreenState createState() => _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Color.fromARGB(255, 137, 137, 137), // 구분선 색상 설정
        ),
        Image.asset(
          'assets/stage2.png',
          width: 700,
          height: 148,
        ),
        Container(
          height: 1,
          color: Color.fromARGB(255, 137, 137, 137), // 구분선 색상 설정
        ),
        Image.asset(
          'assets/two_guide2.png',
          width: 700,
          height: 751,
        ),
        SizedBox(
          width: 350, // 너비 설정
          height: 100, // 높이 설정
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Two3()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 168, 168, 168),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.black.withOpacity(1.0), // 그림자 색상 설정
              elevation: 5, // 그림자 높이 설정
            ),
            child: const Text(
              '동작 요청 중',
              style: TextStyle(
                fontFamily: 'GmarketSans', // 버튼 텍스트 폰트 적용
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
