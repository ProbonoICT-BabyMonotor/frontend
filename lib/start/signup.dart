import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probono_app/connect/user_connect.dart';
import 'package:probono_app/start/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, // 화면 배경색을 흰색으로 설정
        body: Center(
          child: SignupScreen(),
        ),
      ),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

const TextStyle commonTextStyle = TextStyle(
  fontFamily: 'GmarketSans',
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

const BoxDecoration boxdeco = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 3.0,
      offset: Offset(0, 1),
    ),
  ],
);

const InputDecoration indeco = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
);

class _SignupScreenState extends State<SignupScreen> {
  final userConnect = Get.put(UserConnect());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _babynameController = TextEditingController();
  final TextEditingController _babybirthController = TextEditingController();
  final TextEditingController _babyweightController = TextEditingController();

  _submitForm() async {
    if (_formkey.currentState!.validate()) {
      final String memberId = _idController.text;
      final String memberPassword = _pwController.text;
      final String memberPhone = _phoneController.text;
      final String memberName = _nameController.text;
      final String memberBirth = _birthController.text;
      final String memberGender = _genderController.text;
      final String babyName = _babynameController.text;
      final String babyBirth = _babybirthController.text;
      final double babyWeight = double.parse(_babyweightController.text);

      Future.delayed(Duration(milliseconds: 1000), () async {
        // 회원가입 통신 로직
        Map<String, dynamic> result = await userConnect.sendRegister(
            memberName,
            memberId,
            memberPhone,
            memberPassword,
            memberBirth,
            memberGender,
            babyName,
            babyBirth,
            babyWeight);
        return result;
      }).then((value) {
        if (value['code'] == 201) {
          // 회원가입 성공 시 Tabbar 페이지로 이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        } else {}
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(
              'assets/main.png',
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            '회원 가입 하기',
            style: TextStyle(
                fontFamily: 'GmarketSans',
                fontSize: 40,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: screenWidth * 0.83, top: 5.0, bottom: 0.0),
            child: const Text('이름', style: commonTextStyle),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              height: 35.0,
              decoration: boxdeco,
              child: TextFormField(
                  controller: _nameController, decoration: indeco),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: screenWidth * 0.81, top: 5.0, bottom: 0.0),
            child: Text('아이디', style: commonTextStyle),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              height: 35.0,
              decoration: boxdeco,
              child:
                  TextFormField(controller: _idController, decoration: indeco),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: screenWidth * 0.79, top: 5.0, bottom: 0.0),
            child: Text('전화번호', style: commonTextStyle),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              height: 35.0,
              decoration: boxdeco,
              child: TextFormField(
                  controller: _phoneController, decoration: indeco),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: screenWidth * 0.79, top: 5.0, bottom: 0.0),
            child: Text('비밀번호', style: commonTextStyle),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              height: 35.0,
              decoration: boxdeco,
              child:
                  TextFormField(controller: _pwController, decoration: indeco),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: screenWidth * 0.83, top: 5.0, bottom: 0.0),
            child: Text('생일', style: commonTextStyle),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              height: 35.0,
              decoration: boxdeco,
              child: TextFormField(
                  controller: _birthController, decoration: indeco),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: screenWidth * 0.7, top: 5.0, bottom: 0.0),
            child: Text('성별 ( F or M )', style: commonTextStyle),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              height: 35.0,
              decoration: boxdeco,
              child: TextFormField(
                  controller: _genderController, decoration: indeco),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: screenWidth * 0.77, top: 5.0, bottom: 0.0),
            child: Text('아기 이름', style: commonTextStyle),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              height: 35.0,
              decoration: boxdeco,
              child: TextFormField(
                  controller: _babynameController, decoration: indeco),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: screenWidth * 0.77, top: 5.0, bottom: 0.0),
            child: Text('아기 생일', style: commonTextStyle),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              height: 35.0,
              decoration: boxdeco,
              child: TextFormField(
                  controller: _babybirthController, decoration: indeco),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0.0, right: screenWidth * 0.74, top: 5.0, bottom: 0.0),
            child: Text('아기 몸무게', style: commonTextStyle),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: Container(
              height: 35.0,
              decoration: boxdeco,
              child: TextFormField(
                  controller: _babyweightController,
                  keyboardType: TextInputType.number,
                  decoration: indeco),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 270, // 너비 설정
            height: 70, // 높이 설정
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9B95ED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black.withOpacity(1.0), // 그림자 색상 설정
                elevation: 5, // 그림자 높이 설정
              ),
              child: const Text(
                '등록하기',
                style: TextStyle(
                  fontFamily: 'GmarketSans', // 버튼 텍스트 폰트 적용
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
