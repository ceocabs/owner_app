import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:owner/ui/auth/response/logout_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../core/navigation/routes.dart';
import '../login_screen.dart';

class LogoutViewModel {
  Future<List<dynamic>> userLogin(
      {required LogoutRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.logout, data: mapReq, isAuthenticated: false)
          .then(
        (response) async {
          LogoutResponseModel obj = LogoutResponseModel.fromJson(response.data);
          print("${obj.message} message........");
          List<dynamic>? loginData = obj.data;

          if (obj.success.toString() == "1") {
            navigator.pushNamedAndRemoveUntil(
              RouteName.login,
            );
            Box loginDataBase = await Hive.openBox('database1');
            loginDataBase.put("isLogin", "");
            token = "";
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
