import 'package:flutter/material.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../response/driver_profile_response.dart';

class DriverProfileViewModel {
  Future<List<dynamic>> driverProfile(
      {required DriverProfileRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    // print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.getdriverinfo,
              data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          DriverProfileResponseModel obj =
              DriverProfileResponseModel.fromJson(response.data);
          print(obj.message.toString().toString() + " message........");
          List<dynamic>? loginData = obj.data;
          if (obj.success.toString() == "1") {
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
