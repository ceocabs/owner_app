import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/resend_otp_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class AssignDriverRequestModel {
  late int? ownerId;
  late int? driverId;

  AssignDriverRequestModel({
    required this.ownerId,
    required this.driverId,
  });

  Map<String, dynamic> toMap() {
    return {
      'owner_id': ownerId,
      'driver_id': driverId,
    };
  }
}

class AssignDriverResponseModel {
  AssignDriverResponseModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  dynamic data;

  factory AssignDriverResponseModel.fromJson(Map<String, dynamic> json) =>
      AssignDriverResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}

class AssignDriverViewModel {
  Future<List<dynamic>> vehicleDetails(
      {required AssignDriverRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-$mapReq');

    try {
      await client
          .request(ServiceApi.assignDriver,
              data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          ResendOtpResponseModel obj =
              ResendOtpResponseModel.fromJson(response.data);
          print("${obj.message} message........");
          List<dynamic>? loginData = obj.data;
          if (obj.success == "1") {
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
