import 'package:flutter/material.dart';
import 'package:probono_app/shared/menu_bottom.dart';

class Chart extends StatefulWidget {
  Chart({super.key});

  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: MenuBottom(),
        backgroundColor: Colors.white,
        body: Center(
          child: ChartScreen(),
        ),
      ),
    );
  }
}

class ChartScreen extends StatefulWidget {
  ChartScreen({super.key});

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
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
          '의료 차트 조회',
          style: TextStyle(
              fontFamily: 'GmarketSans',
              fontSize: 30,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
