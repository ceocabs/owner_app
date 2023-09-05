import 'package:flutter/material.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../response/set_driver_assigned_vehicle_response.dart';

class SetDriverAssignVehicleViewModel {
  Future<List<dynamic>> setDriverAssignVehicle(
      {required SetDriverAssignVehicleRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.setDriverCurrentAssignedVehicle,
              data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          SetDriverAssignVehicleResponseModel obj =
              SetDriverAssignVehicleResponseModel.fromJson(response.data);

          List<dynamic>? loginData = obj.data;
          if (obj.success.toString() == "1") {}

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
