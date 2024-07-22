import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:probono_app/connect/inoculation_connect.dart';
import 'package:probono_app/shared/menu_bottom.dart';

const TextStyle textdeco = TextStyle(
    fontFamily: 'GmarketSans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black);

const TextStyle textdeco1 = TextStyle(
    fontFamily: 'GmarketSans',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black);

class Inject extends StatefulWidget {
  Inject({super.key});

  _InjectState createState() => _InjectState();
}

class _InjectState extends State<Inject> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: MenuBottom(),
        backgroundColor: Colors.white,
        body: Center(
          child: InjectScreen(),
        ),
      ),
    );
  }
}

class InjectScreen extends StatefulWidget {
  InjectScreen({super.key});

  @override
  _InjectScreenState createState() => _InjectScreenState();
}

class _InjectScreenState extends State<InjectScreen> {
  final inoculationConnect = Get.put(InoculationConnect());
  List<Widget> _listItems = new List.empty();
  List<bool> bool_list = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () async {
      // 로그인 통신 로직
      Map<String, dynamic> result = await inoculationConnect.receiveinfo();
      return result;
    }).then((value) {
      if (value['code'] == 200) {
        // 데이터들 불러오기
        List<dynamic> InoculationList = value['data'];

        for (int i = 0; i < InoculationList.length; i++) {
          _listItems.add(buildListItem(i, InoculationList[i]['inoculationDate'],
              InoculationList[i]['inoculationName'], '시흥보건소'));
          bool_list.add(false);
        }
        setState(() {
          _listItems = _listItems;
        });
        print(_listItems);
      } else {}
    });
  }

  Widget build(BuildContext context) {
    var nowDate = DateTime.now();
    String newDate = DateFormat('yy-MM-dd').format(nowDate);

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
          '예방 접종 조회',
          style: TextStyle(
              fontFamily: 'GmarketSans',
              fontSize: 30,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.event,
              size: 22,
              color: Color(0xFF9B95ED),
            ),
            Text(
              ' 다음 예방 접종 ( 오늘 : $newDate )',
              style: const TextStyle(
                  fontFamily: 'GmarketSans',
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        const Text(
          '20일 이내 뇌수막염 1차 접종 필요           ',
          style: TextStyle(
              fontFamily: 'GmarketSans',
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          color: const Color.fromARGB(255, 199, 199, 199), // 구분선 색상 설정
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
          child: Row(
            children: [
              Text(
                '  접종 일시   ',
                style: textdeco1,
              ),
              Text(
                '접종 내역     ',
                style: textdeco1,
              ),
              Text(
                '   접종 장소     ',
                style: textdeco1,
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: const Color.fromARGB(255, 199, 199, 199), // 구분선 색상 설정
        ),
        SizedBox(
          height: 300,
          width: 450,
          child: ListView(
            children: _listItems,
          ),
        ),
        Container(
          height: 1,
          color: const Color.fromARGB(255, 199, 199, 199), // 구분선 색상 설정
        ),
      ],
    );
  }

  Widget buildListItem(int index, String date, String name, String place) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  date,
                  style: textdeco,
                ),
              ),
              SizedBox(
                width: 130,
                child: Text(
                  name,
                  style: textdeco,
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(
                  place,
                  style: textdeco,
                ),
              ),
              Checkbox(
                value: bool_list[index],
                onChanged: (bool? value) {
                  setState(() {
                    bool_list[index] = value!;
                  });
                },
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: const Color.fromARGB(255, 199, 199, 199), // 구분선 색상 설정
        ),
      ],
    );
  }
}
