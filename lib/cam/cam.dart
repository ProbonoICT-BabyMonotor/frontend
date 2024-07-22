import 'package:flutter/material.dart';
import 'package:probono_app/shared/menu_bottom.dart';

class Cam extends StatefulWidget {
  Cam({super.key});

  _CamState createState() => _CamState();
}

class _CamState extends State<Cam> {
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        bottomNavigationBar: MenuBottom(),
        backgroundColor: Colors.white,
        body: Center(
          child: CamScreen(),
        ),
      ),
    );
  }
}

class CamScreen extends StatefulWidget {
  const CamScreen({super.key});
  @override
  _CamScreenState createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
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
          'OOO의 화면',
          style: TextStyle(
              fontFamily: 'GmarketSans',
              fontSize: 30,
              fontWeight: FontWeight.w500),
        ),
        Container(), //캠 크기에 맞춰 조절하기
      ],
    );
  }
}
