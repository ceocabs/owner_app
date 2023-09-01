import 'package:flutter/material.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../response/owner_bank_details_response.dart';

class OwnerBankDetailsViewModel {
  Future<List<dynamic>> ownerBankDetails(
      {required OwnerBankDetailsRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();

    try {
      await client
          .request(ServiceApi.ownerBankDetailsById,
              data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          OwnerBankDetailsResponseModel obj =
              OwnerBankDetailsResponseModel.fromJson(response.data);
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
