import 'package:flutter/material.dart';
import 'package:owner/core/navigation/navigation_service.dart';
import 'package:owner/ui/auth/response/assign_vehicle_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../../../core/navigation/routes.dart';
import '../../../values/string_contsant.dart';
import '../../../widgets/custom_info_dialog.dart';
import '../response/remove_vehicle_response.dart';

class RemoveVehicleViewModel {
  Future<List<dynamic>> removeVehicle(
      {required RemoveVehicleRequestModel request,
        required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-$mapReq');

    try {
      await client
          .request(ServiceApi.removeVehicle,
          data: mapReq, isAuthenticated: false)
          .then(
            (response) {
              RemoveVehicleResponseModel obj =
              RemoveVehicleResponseModel.fromJson(response.data);
          print("${obj.message} message........");
          List<dynamic>? loginData = obj.data;
          if (obj.success.toString() == "1") {
            navigator.pushNamedAndRemoveUntil(RouteName.homePage);
          } else {
            showDialog(
              barrierColor: Colors.black26,
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return CustomInfoDialog(
                  title: StringConstant.alert,
                  description: obj.message.toString(),

                );
              },
            );
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
