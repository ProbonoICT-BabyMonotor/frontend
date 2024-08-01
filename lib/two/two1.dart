import 'package:flutter/material.dart';
import 'package:probono_app/shared/menu_bottom.dart';
import 'package:probono_app/menu.dart';
import 'package:probono_app/two/two2.dart';

class Two extends StatefulWidget {
  const Two({super.key});

  @override
  _TwoState createState() => _TwoState();
}

class _TwoState extends State<Two> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
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
          'assets/stage1.png',
          width: 700,
          height: 150,
        ),
        Container(
          height: 1,
          color: Color.fromARGB(255, 137, 137, 137), // 구분선 색상 설정
        ),
        SizedBox(
          height: 150,
        ),
        Container(
          height: 1,
          color: Color.fromARGB(255, 137, 137, 137), // 구분선 색상 설정
        ),
        Image.asset(
          'assets/two_guide.png',
          width: 700,
          height: 600,
        ),
        SizedBox(
          width: 350, // 너비 설정
          height: 100, // 높이 설정
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Two2()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9B95ED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.black.withOpacity(1.0), // 그림자 색상 설정
              elevation: 5, // 그림자 높이 설정
            ),
            child: const Text(
              '동작하기',
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
