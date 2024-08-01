import 'package:flutter/material.dart';
import 'package:probono_app/one/one1.dart';
import 'package:probono_app/one/one3.dart';
import 'package:probono_app/shared/menu_bottom.dart';
import 'package:probono_app/menu.dart';

class One2 extends StatefulWidget {
  const One2({super.key});

  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One2> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => One()));
              },
              icon: const Icon(Icons.keyboard_backspace)),
          title: const Text(
            '역류 방지 기능 수행',
            style: TextStyle(
                fontFamily: 'GmarketSans',
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        bottomNavigationBar: MenuBottom(),
        backgroundColor: Colors.white,
        body: Center(
          child: OneScreen(),
        ),
      ),
    );
  }
}

class OneScreen extends StatefulWidget {
  const OneScreen({super.key});
  @override
  _OneScreenState createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
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
          'assets/one_guide2.png',
          width: 700,
          height: 751,
        ),
        SizedBox(
          width: 350, // 너비 설정
          height: 100, // 높이 설정
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => One3()));
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
