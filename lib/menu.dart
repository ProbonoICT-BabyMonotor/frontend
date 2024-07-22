import 'package:flutter/material.dart';
import 'package:probono_app/shared/menu_bottom.dart';
import 'cam/cam.dart';
import 'under3/chart.dart';
import 'under3/injection.dart';
import 'one/one1.dart';

ButtonStyle outlinedeco = OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    backgroundColor: Colors.white,
    side: const BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    shadowColor: Colors.black.withOpacity(1.0), // 그림자 색상 설정
    elevation: 3);

const TextStyle textdeco = TextStyle(
    fontFamily: 'GmarketSans',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black);

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: MenuBottom(),
        backgroundColor: Colors.white,
        body: Center(
          child: MenuScreen(),
        ),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 150),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => One()));
              },
              style: outlinedeco,
              child: Column(
                children: [
                  Image.asset(
                    'assets/one.png',
                    width: 105,
                    height: 60,
                  ),
                  const SizedBox(height: 5),
                  const Text('역류 방지', style: textdeco),
                ],
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Chart())); //여기 수정해야함
              },
              style: outlinedeco,
              child: Column(
                children: [
                  Image.asset(
                    'assets/two.png',
                    width: 105,
                    height: 60,
                  ),
                  const SizedBox(height: 5),
                  const Text('트름 유도', style: textdeco),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Inject()));
              },
              style: outlinedeco,
              child: Column(
                children: [
                  Image.asset(
                    'assets/three.png',
                    width: 105,
                    height: 60,
                  ),
                  const SizedBox(height: 5),
                  const Text('침대 스윙', style: textdeco),
                ],
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Chart())); //여기 수정해야함
              },
              style: outlinedeco,
              child: Column(
                children: [
                  Image.asset(
                    'assets/four.png',
                    width: 105,
                    height: 60,
                  ),
                  const SizedBox(height: 5),
                  const Text('뒤집기', style: textdeco),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cam()));
              },
              style: outlinedeco,
              child: Column(
                children: [
                  Image.asset(
                    'assets/camera.png',
                    width: 105,
                    height: 60,
                  ),
                  const SizedBox(height: 5),
                  const Text('아이 보기', style: textdeco),
                ],
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Chart()));
              },
              style: outlinedeco,
              child: Column(
                children: [
                  Image.asset(
                    'assets/five.png',
                    width: 105,
                    height: 60,
                  ),
                  const SizedBox(height: 5),
                  const Text('침대 고정', style: textdeco),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Inject()));
              },
              style: outlinedeco,
              child: Column(
                children: [
                  Image.asset(
                    'assets/injection.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 5),
                  const Text('예방 접종', style: textdeco),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Chart()));
              },
              style: outlinedeco,
              child: Column(
                children: [
                  Image.asset(
                    'assets/chart.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 5),
                  const Text('의료 차트', style: textdeco)
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Chart())); //여기 수정해야함
              },
              style: outlinedeco,
              child: Column(
                children: [
                  Image.asset(
                    'assets/note.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 5),
                  const Text('취침 이력', style: textdeco)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
