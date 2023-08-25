import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:owner/ui/auth/response/city_response.dart';
import '../../../Helper/Network Manager/exception/exception.dart';
import '../../../Helper/Network Manager/manager/network_manager.dart';
import '../../../Helper/Network Manager/manager/service_api.dart';
import '../../../core/navigation/routes.dart';
import '../../../values/colors.dart';
import '../../../values/string_contsant.dart';
import '../../../values/style.dart';
import '../../../widgets/custom_info_dialog.dart';
import '../response/assign_driver_owner_response.dart';

class AssignDriverToOwnerViewModel {
  Future<List<dynamic>> assignDriver(
      {required AssignDriverToOwnerRequestModel request,
        required BuildContext context}) async {
    late dynamic responseObj;

    var mapReq = request.toMap();
    print('loginMap-' + mapReq.toString());

    try {
      await client
          .request(ServiceApi.assignDriverToOwner,
          data: mapReq, isAuthenticated: false)
          .then(
            (response) {
              AssignDriverOwnerResponseModel obj =
              AssignDriverOwnerResponseModel.fromJson(response.data);

          dynamic? cityData = obj.data;
          if (obj.success.toString() == "1") {
            showDialog(
              barrierColor: Colors.black26,
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return CustomInfoDialog(
                  title: StringConstant.success,
                  description: obj.message.toString(),
                );
              },
            );
         /*   AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              headerAnimationLoop: true,
              animType: AnimType.topSlide,
              showCloseIcon: false,
              title: StringConstant.connect,
              desc: StringConstant.connectDriverConfirmation,
              descTextStyle: textBold.copyWith(
                fontSize: 20.sp,
                color: AppColor.dark,
              ),
              btnCancelOnPress: () {
                navigator!.pop();
              },
              btnOkOnPress: () {
                navigator!.pushNamedAndRemoveUntil(RouteName.homePage,(route) => true,);
              },
            ).show();*/
          }else{
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