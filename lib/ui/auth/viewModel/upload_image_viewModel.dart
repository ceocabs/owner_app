
import 'package:flutter/material.dart';
import 'package:owner/ui/auth/response/driver_image_upload_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';

class uploadImageViewModel {
  Future<dynamic> driverImageUpload(
      {required DriverImageUploadRequestModel request,
        required BuildContext context}) async {
    late dynamic responseObj;

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.uploadImage,
          data: mapReq, isAuthenticated: false,)
          .then(
            (response) {
              DriverImageUploadResponseModel obj =
              DriverImageUploadResponseModel.fromJson(response.data);
          print(obj.message.toString().toString() + " message........");
          dynamic uploadImageData = obj.data;
          if (obj.success.toString() == "1") {

          } else {
           /* ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  obj.message.toString(),
                ),
              ),
            );*/
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
