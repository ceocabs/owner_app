import 'package:flutter/material.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../core/navigation/routes.dart';
import '../../../values/string_contsant.dart';
import '../../../widgets/custom_info_dialog.dart';
import '../response/search_driver_response.dart';

class SearchDriverViewModel {
  Future<dynamic> searchDriver(
      {required SearchDriverRequestModel request,
      required BuildContext context}) async {
    late dynamic responseObj;

    var mapReq = request.toMap();
    print('Request-$mapReq');

    try {
      await client
          .request(
        ServiceApi.searchDriver,
        data: mapReq,
        isAuthenticated: false,
      )
          .then(
        (response) {
          SearchDriverResponseModel obj =
          SearchDriverResponseModel.fromJson(response.data);
          print("${obj.message} message........");
          dynamic uploadImageData = obj.success;
          if (obj.success.toString() == "1") {


          } else {
            showDialog(
              barrierColor: Colors.black26,
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return CustomInfoDialog(
                  title: StringConstant.alert,
                  description: obj.message.toString(),

                );
              },
            );
          }

          if (uploadImageData != null) {
            responseObj = uploadImageData;
          }
        },
      );
    } catch (e) {
      throw APIException(e.toString(), statusCode: ErrorCode.api.index);
    }
    return responseObj;
  }
}
