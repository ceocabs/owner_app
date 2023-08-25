import 'package:flutter/material.dart';
import 'package:owner/core/navigation/navigation_service.dart';
import 'package:owner/ui/auth/response/verify_otp_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../../../core/navigation/routes.dart';

class VerifyOtpViewModel {
  Future<List<dynamic>> userVerify(
      {required VerifyOtpRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.verifyOTP, data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          VerifyOtpResponseModel obj =
              VerifyOtpResponseModel.fromJson(response.data);
          print(obj.message.toString().toString() + " message........");
          List<dynamic>? loginData = obj.data;
          if (obj.success == "1") {}

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

  Future<List<dynamic>> loginVerify(
      {required VerifyOtpRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.verifyOTP, data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          VerifyOtpResponseModel obj =
              VerifyOtpResponseModel.fromJson(response.data);
          print("enter into method........");
          List<dynamic>? loginData = obj.data;

          if (obj.success.toString() == "1") {


         //   navigator.pushNamedAndRemoveUntil(RouteName.homePage);
          } else {
            /*ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  obj.message.toString(),
                ),
              ),
            );*/
          }
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
