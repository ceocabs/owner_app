import 'package:flutter/material.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../../../values/string_contsant.dart';
import '../../../widgets/custom_info_dialog.dart';
import '../response/verify_driver_otp_response.dart';

class VerifyDriverOTPViewModel {
  Future<dynamic> verifyDriver(
      {required VerifyDriverOTPRequestModel request,
      required BuildContext context}) async {
    late dynamic responseObj;

    var mapReq = request.toMap();
    print('Request-$mapReq');

    try {
      await client
          .request(
        ServiceApi.verifyDriverOTP,
        data: mapReq,
        isAuthenticated: false,
      )
          .then(
        (response) {
          VerifyDriverOTPResponseModel obj =
          VerifyDriverOTPResponseModel.fromJson(response.data);

          dynamic uploadImageData = obj.data;
          if (obj.success.toString() == "1") {
            print("${obj.message} message........");
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
