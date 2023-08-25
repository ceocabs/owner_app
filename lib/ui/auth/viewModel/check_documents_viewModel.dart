import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/check_documents_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class CheckDocumentsViewModel {
  Future<List<dynamic>> userLogin(
      {required CheckDocumentRequestModel request,
      required BuildContext context}) async {
    late List<dynamic> responseObj;

    var mapReq = request.toMap();

    try {
      await client
          .request(ServiceApi.checkDocumentStatus,
              data: mapReq, isAuthenticated: false)
          .then(
        (response) {
          CheckDocumentResponseModel obj =
              CheckDocumentResponseModel.fromJson(response.data);
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
