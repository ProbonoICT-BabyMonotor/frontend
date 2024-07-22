import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probono_app/connect/user_connect.dart';
import '../menu.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, // 화면 배경색을 흰색으로 설정
        body: Center(
          child: LoginScreen(),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userConnect = Get.put(UserConnect());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

// 로그인 완료 버튼을 누를 때 동작할 함수
  _submitForm() async {
    if (_formkey.currentState!.validate()) {
      // hi
      final String memberId = _idController.text;
      final String memberPassword = _pwController.text;

      Future.delayed(Duration(milliseconds: 1000), () async {
        // 로그인 통신 로직
        Map<String, dynamic> result =
            await userConnect.sendLogin(memberId, memberPassword);
        return result;
      }).then((value) {
        if (value['code'] == 200) {
          // 로그인 성공 시 Tabbar 페이지로 이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Menu(),
            ),
          );
        } else {}
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          SizedBox(
              width: 100, // 이미지의 너비를 제한
              height: 100, // 이미지의 높이를 제한
              child: Image.asset(
                'assets/main.png', // 이미지 파일의 경로를 올바르게 설정하세요
                fit: BoxFit.cover, // 이미지가 공간을 채우도록 설정
              )),
          const SizedBox(height: 5),
          const Text(
            '베이비  모니터',
            style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.bold,
                fontFamily: 'GmarketSans'),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: 270.0, top: 10.0, bottom: 0.0),
            child: Text(
              '아이디',
              textAlign: TextAlign.left, // 텍스트를 좌측으로 정렬합니다
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'GmarketSans'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: TextFormField(
                controller: _idController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: '아이디를 입력하세요',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: 250.0, top: 10.0, bottom: 0.0),
            child: Text(
              '비밀번호',
              textAlign: TextAlign.left, // 텍스트를 좌측으로 정렬합니다
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'GmarketSans'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: TextFormField(
                controller: _pwController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: '비밀번호를 입력하세요',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 0.0, right: 0.0, top: 10.0, bottom: 10.0),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  '비밀번호 찾기',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'GmarketSans',
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 23, 23, 23),
                  ),
                ),
              )),
          ElevatedButton(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9B95ED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.black.withOpacity(1.0), // 그림자 색상 설정
              elevation: 5, // 그림자 높이 설정
              minimumSize: const Size(200, 50),
            ),
            child: const Text(
              '로그인',
              style: TextStyle(
                fontFamily: 'GmarketSans', // 버튼 텍스트 폰트 적용
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 0.0, top: 20.0, bottom: 0.0),
                child: Text(
                  '계정이 없으신가요?',
                  textAlign: TextAlign.left, // 텍스트를 좌측으로 정렬합니다
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'GmarketSans'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 20.0, bottom: 0.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GmarketSans',
                      color: Color(0xFF9B95ED),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
