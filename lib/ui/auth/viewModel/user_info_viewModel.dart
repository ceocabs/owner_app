import 'package:flutter/material.dart';
import 'package:owner/ui/auth/model/user_data_model.dart';
import 'package:owner/ui/auth/response/user_info_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class UserInfoViewModel {
  Future<List<dynamic>> getUserInfo(
      {required UserInfoRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.getUserinfo, data: mapReq, isAuthenticated: false)
          .then(
        (response) async {
          UserInfoResponseModel obj =
              UserInfoResponseModel.fromJson(response.data);

          List<dynamic>? userData = obj.data;
          if (userData != null) {
            responseObj = userData;
          }
          if (obj.success == "1") {
            userDataModel = userData?.cast<UserDataModel>();
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

List<UserDataModel>? userDataModel = [];
