import 'package:flutter/material.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class getVehicleTypeResponseModel {
  getVehicleTypeResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory getVehicleTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      getVehicleTypeResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}

class getVehicleTypeViewModel {
  Future<List<dynamic>> getVehicleType({required BuildContext context}) async {
    late List<dynamic> responseObj;

    try {
      await client
          .request(ServiceApi.getVehicleType, data: {}, isAuthenticated: false)
          .then(
        (response) async {
          getVehicleTypeResponseModel obj =
              getVehicleTypeResponseModel.fromJson(response.data);

          List<dynamic>? userData = obj.data;
          if (userData != null) {
            responseObj = userData;
          }
          if (obj.success == "1") {
            //userDataModel = userData?.cast<UserDataModel>();
          } else {
        /*    ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  obj.message.toString(),
                ),
              ),
            );*/
          }
        },
      );
    } catch (e) {
      throw APIException(e.toString(), statusCode: ErrorCode.api.index);
    }
    return responseObj;
  }
}
