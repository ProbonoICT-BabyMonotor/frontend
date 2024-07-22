import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'start/login.dart';

void main() {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, // 화면 배경색을 흰색으로 설정
        body: Center(
          child: BabyMonitorScreen(),
        ),
      ),
    );
  }
}

class BabyMonitorScreen extends StatelessWidget {
  const BabyMonitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 제목
        const SizedBox(height: 50),
        const Text(
          '베이비  모니터',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'GmarketSans'),
        ),
        const SizedBox(height: 50), // 제목과 이미지 사이의 공간
        // 이미지
        SizedBox(
            width: 250, // 이미지의 너비를 제한
            height: 250, // 이미지의 높이를 제한
            child: Image.asset(
              'assets/main.png', // 이미지 파일의 경로를 올바르게 설정하세요
              fit: BoxFit.cover, // 이미지가 공간을 채우도록 설정
            )),
        const SizedBox(height: 50), // 이미지와 버튼 사이의 공간
        // 버튼
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            ); // 버튼이 눌렸을 때 실행할 동작 정의
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF9B95ED), // 버튼 배경 색상 설정
            padding: const EdgeInsets.symmetric(
                horizontal: 110, vertical: 10), // 버튼 패딩 조정
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // 각진 모서리 설정
            ),
            shadowColor: Colors.black.withOpacity(1.0), // 그림자 색상 설정
            elevation: 5, // 그림자 높이 설정
            minimumSize: const Size(200, 50), // 버튼 최소 크기 설정
          ),
          child: const Text(
            '시작하기',
            style: TextStyle(
              fontFamily: 'GmarketSans', // 버튼 텍스트 폰트 적용
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
