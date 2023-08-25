import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/city_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class CityViewModel {
  Future<List<dynamic>> cityList(
      {required CityRequestModel request,
        required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.getCity,
          data: mapReq, isAuthenticated: false)
          .then(
            (response) {
          CityResponseModel obj =
          CityResponseModel.fromJson(response.data);

          List<dynamic>? cityData = obj.data;
          if (obj.success.toString() == "1") {}

          if (cityData != null) {
            responseObj = cityData;
          }
        },
      );
    } catch (e) {
      throw APIException(e.toString(), statusCode: ErrorCode.api.index);
    }
    return responseObj;
  }
}