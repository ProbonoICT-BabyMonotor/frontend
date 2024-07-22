import 'package:flutter/material.dart';
import 'package:probono_app/shared/menu_bottom.dart';
import 'package:probono_app/menu.dart';

class One extends StatefulWidget {
  const One({super.key});

  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
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
        SizedBox(
          height: 50,
        ),
        Image.asset(
          'assets/one_guide.png',
          width: 450,
          height: 450,
        )
      ],
    );
  }
}
