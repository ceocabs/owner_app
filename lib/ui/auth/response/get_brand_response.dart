import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/user_info_response.dart';

import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class getBrandResponseModel {
  getBrandResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory getBrandResponseModel.fromJson(Map<String, dynamic> json) =>
      getBrandResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}

class getBrandViewModel {
  Future<List<dynamic>> getBrand(
      {
        required BuildContext context}) async {
    late List<dynamic> responseObj;



    try {
      await client
          .request(ServiceApi.getBrand, data: {}, isAuthenticated: false)
          .then(
            (response) async {
              getBrandResponseModel obj =
              getBrandResponseModel.fromJson(response.data);

          List<dynamic>? userData = obj.data;
          if (userData != null) {
            responseObj = userData;
          }
          if (obj.success.toString() == "1") {
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

