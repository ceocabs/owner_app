import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/login_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class LoginViewModel {
  Future<List<dynamic>> userLogin(
      {required LoginRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-$mapReq');

    try {
      await client
          .request(ServiceApi.login, data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          LoginResponseModel obj = LoginResponseModel.fromJson(response.data);
          print(obj.message.toString().toString() + " message........");
          List<dynamic>? loginData = obj.data;
          if (obj.success == "1") {
          } else {}

          if (loginData != null) {
            responseObj = loginData;
          }
        },
      );
    } catch (e) {
      throw APIException(e.toString(), statusCode: ErrorCode.api.index);
    }
    return responseObj;
  }
}
