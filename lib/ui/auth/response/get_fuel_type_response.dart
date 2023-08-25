import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/user_info_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class getFuelTypeResponseModel {
  getFuelTypeResponseModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  dynamic data;

  factory getFuelTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      getFuelTypeResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}

class getFuelTypeViewModel {
  Future<List<dynamic>> getFuelTypeName({required BuildContext context}) async {
    late List<dynamic> responseObj;

    try {
      await client
          .request(ServiceApi.getFuelType, data: {}, isAuthenticated: false)
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

          }
        },
      );
    } catch (e) {
      throw APIException(e.toString(), statusCode: ErrorCode.api.index);
    }
    return responseObj;
  }
}
