import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/user_info_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class GetVehicleNameRequestModel {
  late String? brandId;

  GetVehicleNameRequestModel({
    required this.brandId,
  });

  Map<String, dynamic> toMap() {
    return {
      'brand_id': brandId,
    };
  }
}

class getVehicleNameResponseModel {
  getVehicleNameResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory getVehicleNameResponseModel.fromJson(Map<String, dynamic> json) =>
      getVehicleNameResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}

class getVehicleNameViewModel {
  Future<List<dynamic>> getVehicleName({required BuildContext context,required GetVehicleNameRequestModel request}) async {
    late List<dynamic> responseObj;
    var mapReq = request.toMap();

    try {
      await client
          .request(ServiceApi.getVehicleName, data: mapReq, isAuthenticated: false)
          .then(
        (response) async {
          getVehicleNameResponseModel obj =
              getVehicleNameResponseModel.fromJson(response.data);

          List<dynamic>? userData = obj.data;
          if (userData != null) {
            responseObj = userData;
          }
          if (obj.success == "1") {
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  obj.message.toString(),
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      throw APIException(e.toString(), statusCode: ErrorCode.api.index);
    }
    return responseObj;
  }
}
