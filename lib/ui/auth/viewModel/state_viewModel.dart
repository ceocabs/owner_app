import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/state_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class StateViewModel {
  Future<List<dynamic>> stateList(
      {required StateRequestModel request,
        required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.getState,
          data: mapReq, isAuthenticated: false)
          .then(
            (response) {
          StateResponseModel obj =
          StateResponseModel.fromJson(response.data);

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
