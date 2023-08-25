import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/insurance_company_response.dart';

import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class InsuranceCompanyViewModel {
  Future<List<dynamic>> insuranceCompanyList(
      {required InsuranceCompanyRequestModel request,
        required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();
    print('loginMap-$mapReq');

    try {
      await client
          .request(ServiceApi.insuranceCompanies,
          data: mapReq, isAuthenticated: false)
          .then(
            (response) {
              InsuranceCompanyResponseModel obj =
              InsuranceCompanyResponseModel.fromJson(response.data);

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
