import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner/ui/auth/response/register_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../../../core/navigation/routes.dart';

class RegisterViewModel {
  Future<List<dynamic>> userRegister(
      {required RegisterRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;
    var phone = request.mobileNO ?? "";

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.signUp, data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          RegisterResponseModel obj =
              RegisterResponseModel.fromJson(response.data);
          print(obj.message.toString().toString() + " message........");
          List<dynamic> loginData = obj.data;
          if (obj.success.toString() == "1") {
            print("this api response get successfully....");
            navigator!.pushNamedAndRemoveUntil(RouteName.pendingApprovalPage, (route) => false);
          } else {

          }
          if (loginData != null) {
            responseObj = loginData;
          }
        },
      );
    } catch (e) {
      throw APIException(e.toString(), statusCode: ErrorCode.api.index);
    }
    //   }
    return responseObj;
  }
}
