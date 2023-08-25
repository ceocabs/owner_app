import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/driver_list_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class DriverListViewModel {
  Future<List<dynamic>> driverList(
      {required DriverListRequestModel request,
        required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    // print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.getDriverList,
          data: mapReq, isAuthenticated: false)
          .then(
            (response) {
          DriverListResponseModel obj =
          DriverListResponseModel.fromJson(response.data);
          print(obj.message.toString().toString() + " message........");
          List<dynamic>? loginData = obj.data;
          if (obj.success == "1") {
          } else {
          /*  ScaffoldMessenger.of(context).showSnackBar(
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
