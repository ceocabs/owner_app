import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/get_vehicle_status_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class GetVehicleByStatusViewModel {
  Future<List<dynamic>> getVehicleByStatus(
      {required GetVehicleStatusRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();

    try {
      await client
          .request(ServiceApi.getVehicleByStatus,
              data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          GetVehicleStatusResponseModel obj =
              GetVehicleStatusResponseModel.fromJson(response.data);
          print("${obj.message} message........");
          List<dynamic>? loginData = obj.data;
          if (obj.success == "1") {
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
