import 'package:flutter/material.dart';
import 'package:probono_app/start/mypage.dart';
import 'package:probono_app/menu.dart';

class MenuBottom extends StatefulWidget {
  const MenuBottom({
    super.key,
  });

  @override
  _MenuBottomState createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFF9B95ED),
            blurRadius: 3,
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: '메인 메뉴'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: '마이페이지')
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Menu()));
              break;
            case 1:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Mypage()));
              break;
          }
        },
        selectedItemColor: const Color(0xFF9B95ED),
        unselectedItemColor: Color(0xFF9B95ED),
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontFamily: 'GmarketSans',
          fontWeight: FontWeight.w700,
          color: Color(0xFF9B95ED),
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontFamily: 'GmarketSans',
          fontWeight: FontWeight.w700,
          color: Color(0xFF9B95ED),
        ),
        iconSize: 30,
      ),
    );
  }
}
