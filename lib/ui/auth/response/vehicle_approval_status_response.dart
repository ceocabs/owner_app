import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/get_vehicle_name_response.dart';
import 'package:owner/ui/auth/response/user_info_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';


class VehicleApprovalStatusRequestModel {
  late int? id;

  VehicleApprovalStatusRequestModel({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }
}


class getColorResponseModel {
  getColorResponseModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  dynamic data;

  factory getColorResponseModel.fromJson(Map<String, dynamic> json) =>
      getColorResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}

class getColorViewModel {
  Future<List<dynamic>> getVehicleApprovalStatus({required BuildContext context,
    required VehicleApprovalStatusRequestModel request,

  }) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();


    try {
      await client
          .request(ServiceApi.checkVehicleDocStatus, data: mapReq, isAuthenticated: false)
          .then(
            (response) async {
          UserInfoResponseModel obj =
          UserInfoResponseModel.fromJson(response.data);

          List<dynamic>? userData = obj.data;
          if (userData != null) {
            responseObj = userData;
          }
          if (obj.success == "1") {
            //userDataModel = userData?.cast<UserDataModel>();
          } else {
           /* ScaffoldMessenger.of(context).showSnackBar(
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
