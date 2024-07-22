import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:probono_app/shared/global.dart';

final GetStorage _storage = GetStorage();

// 회원 관련된 통신을 담당하는 클래스
class InoculationConnect extends GetConnect {
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

  Future receiveinfo() async {
    int memberNumber = _storage.read('memberNumber');
    Response response =
        await get('/inoculation/list?memberNumber=${memberNumber}');
    Map<String, dynamic> body = response.body; //응답받음
    print(body);
    return body;
  }
}
