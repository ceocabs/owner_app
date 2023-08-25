import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/widgets/button_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../core/navigation/navigation_service.dart';
import '../core/navigation/routes.dart';
import '../res.dart';
import '../values/colors.dart';
import '../values/string_contsant.dart';
import '../values/style.dart';
import 'auth/model/driver_info_approval_model.dart';
import 'auth/response/verify_driver_otp_response.dart';
import 'auth/viewModel/verify_driver_otp_viewModel.dart';

class DriverOtpVerificationPage extends StatefulWidget {
  const DriverOtpVerificationPage({Key? key}) : super(key: key);

  @override
  _DriverOtpVerificationPageState createState() =>
      _DriverOtpVerificationPageState();
}

class _DriverOtpVerificationPageState extends State<DriverOtpVerificationPage> {
  TextEditingController otpController = TextEditingController();
  String mobileNumber = "";
  List<DriverInfoApprovalModel> driverInfoApprovalModelList = [];

  driverOTPVerification({
    required BuildContext context,
    required String phoneNumber,
    required String otp,
  }) async {
    final apiHandler = VerifyDriverOTPViewModel();

    VerifyDriverOTPRequestModel request = VerifyDriverOTPRequestModel(
      mobileNo: phoneNumber,
      otp: otp,
    );

    try {
      await apiHandler
          .verifyDriver(request: request, context: context)
          .then((response) {
        var code = response;

        print("$response response............");
        List<dynamic> driverData = response;

        driverInfoApprovalModelList =
            driverData.map((i) => DriverInfoApprovalModel.fromJson(i)).toList();
        print(
            "${driverInfoApprovalModelList.length} driver info model length.....");
        // print("${driverInfoApprovalModelList[0].name} driver name....");
        navigator.pushNamed(RouteName.driverConfirmationPage, arguments: {
          "driverName": driverInfoApprovalModelList[0].name,
          "driverId": driverInfoApprovalModelList[0].id.toString(),
          "profileImage": driverInfoApprovalModelList[0].profileImage,
          "mobileNo": driverInfoApprovalModelList[0].mobileNo,
          "whatsappNumber": driverInfoApprovalModelList[0].whatsappNumber
        });

        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  var data;

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        mobileNumber = data["mobileNumber"].toString();
        print("$mobileNumber   mobile number.....");
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.verifyDriver,
          style: textBold.copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                navigator.pop();
              },
              child: Image.asset(
                Res.leftArrow,
                height: 39.h,
                width: 34.w,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: AppColor.white,
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
        ),
        child: Column(
          children: [
            40.h.VBox,
            Text(
              StringConstant.driverOtpVerifyTitle,
              style: textBold.copyWith(
                fontSize: 14.sp,
                color: AppColor.red,
              ),
            ),
            20.h.VBox,
            PinCodeTextField(
              textStyle: textMedium.copyWith(
                  fontSize: 24.sp, color: AppColor.darkBlue),
              controller: otpController,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp('[ ]'),
                ),
              ],
              appContext: context,
              animationType: AnimationType.none,
              length: 4,
              onChanged: (value) {
                if (value == "") {}
              },
              enableActiveFill: true,
              pinTheme: PinTheme(
                fieldHeight: 51.h,
                fieldWidth: 51.w,
                borderRadius: BorderRadius.circular(12.r),
                inactiveFillColor: AppColor.white,
                activeFillColor: AppColor.white,
                selectedFillColor: AppColor.white,
                shape: PinCodeFieldShape.box,
                borderWidth: 1.w,
                activeColor: AppColor.colorHint.withOpacity(0.5),
                errorBorderColor: Colors.transparent,
                inactiveColor: AppColor.colorHint.withOpacity(0.5),
                disabledColor: Colors.transparent,
                selectedColor: AppColor.darkBlue,
                fieldOuterPadding: EdgeInsets.only(right: 5.w),
              ),
              obscureText: true,
              cursorHeight: 20.h,
              cursorColor: AppColor.darkBlue,
              obscuringWidget: Container(
                width: 7.w,
                height: 7.h,
                decoration: const BoxDecoration(
                  color: AppColor.colorHint,
                  shape: BoxShape.circle,
                ),
              ),
              keyboardType: TextInputType.number,
              blinkWhenObscuring: true,
            ),
            20.h.VBox,
            AppButton(StringConstant.submit, () async {
              await driverOTPVerification(
                context: context,
                otp: otpController.text,
                phoneNumber: mobileNumber,
              );
              // navigator.pushNamed(RouteName.driverConfirmationPage);
            }, height: 40.h),
          ],
        ),
      ),
    );
  }
}
