import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/get_vehicle_name_response.dart';
import 'package:owner/ui/auth/response/user_info_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class GetColorRequestModel {

  GetColorRequestModel(

  );

  Map<String, dynamic> toMap() {
    return {

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
  Future<List<dynamic>> getColor({
    required BuildContext context,
    required GetColorRequestModel request,
  }) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();

    try {
      await client
          .request(ServiceApi.getColor, data: mapReq, isAuthenticated: false)
          .then(
        (response) async {
          UserInfoResponseModel obj =
              UserInfoResponseModel.fromJson(response.data);

          List<dynamic>? userData = obj.data;
          if (userData != null) {
            responseObj = userData;
          }

        },
      );
    } catch (e) {
      throw APIException(e.toString(), statusCode: ErrorCode.api.index);
    }
    return responseObj;
  }
}
