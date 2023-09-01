import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/resend_otp_response.dart';
import 'package:owner/ui/auth/response/vehicle_details_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../response/online_offline_drivers_response.dart';

class OnlineOfflineDriversViewModel {
  Future<List<dynamic>> onlineOfflineDriver(
      {required OnlineOfflineDriversRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.onlineOfflineOwnerDrivers,
              data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          OnlineOfflineDriversResponseModel obj =
              OnlineOfflineDriversResponseModel.fromJson(response.data);
          print("${obj.message} message........");
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
