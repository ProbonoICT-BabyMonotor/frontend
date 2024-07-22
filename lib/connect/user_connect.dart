import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:probono_app/shared/global.dart';

final GetStorage _storage = GetStorage();

// 회원 관련된 통신을 담당하는 클래스
class UserConnect extends GetConnect {
  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.apiRoot;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  // 회원가입 통신
  Future sendRegister(
      String memberName,
      String memberId,
      String memberPhone,
      String memberPassword,
      String memberBirth,
      String memberGender,
      String babyName,
      String babyBirth,
      double babyWeight) async {
    Response response = await post('/signup', {
      'memberName': memberName,
      'memberId': memberId,
      'memberPhone': memberPhone,
      'memberPassword': memberPassword,
      'memberBirth': memberBirth,
      'memberGender': memberGender,
      'babyName': babyName,
      'babyBirth': babyBirth,
      'babyWeight': babyWeight,
    });
    Map<String, dynamic> body = response.body;
    print(body);

    if (body['code'] == 201) {
      return body; // 토큰 반환
    } else if (body['code'] == 403) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text('전화번호가 중복되었습니다.'),
        ),
      );
    } else {
      throw Exception(body['code']);
    }
  }

  // 로그인 통신
  Future sendLogin(String memberId, String memberPassword) async {
    Response response = await post('/login',
        {'memberId': memberId, 'memberPassword': memberPassword}); //요청
    Map<String, dynamic> body = response.body; //응답받음
    //print(body);
    if (body['code'] != 200) {
      throw Exception(body['code']);
    } else {
      _storage.write('memberNumber', body['data']['memberNumber']);
      print(_storage.read('memberNumber'));
      return body; // 토큰 반환
    }
  }
}
