import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:owner/ui/auth/login_screen.dart';
import 'package:owner/ui/auth/response/owner_status_response.dart';
import 'package:owner/ui/auth/viewModel/owner_status_viewModel.dart';
import 'package:owner/ui/auth/response/resend_otp_response.dart';
import 'package:owner/ui/auth/viewModel/resend_otp_viewModel.dart';
import 'package:owner/ui/auth/response/verify_otp_response.dart';
import 'package:owner/ui/auth/viewModel/verify_viewModel.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/passing_parameters.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../util/app_utils.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  late TextEditingController firstFieldController;
  String otp = "";
  String isAdharStatus = "";
  String isPanStatus = "";
  String isLicenseStatus = "";
  String isProfileStatus = "";
  String isApprovalStatus = "";
  String type = "";
  String otpValue = "";
  String mobileNumber = "";
  bool isDocumentRejected = false;
  bool isLoading = false;
  var data;
  ValueNotifier<bool> isTimer = ValueNotifier(false);
  final CountdownController _controller = CountdownController(autoStart: true);

  @override
  void initState() {
    firstFieldController = TextEditingController();
    super.initState();
  }

  otpVerification({
    required BuildContext context,
    required int phoneNumber,
    required int otp,
  }) async {
    final apiHandler = VerifyOtpViewModel();
    Box loginDataBase = await Hive.openBox('database1');
    VerifyOtpRequestModel request = VerifyOtpRequestModel(
      phoneNo: phoneNumber,
      otp: otp,
    );

    try {
      await apiHandler
          .loginVerify(request: request, context: context)
          .then((response) async {
        var code = response;
        Map<String, dynamic> otpValue = code[0];
        token = otpValue['remember_token'].toString();
        userId = otpValue['id'].toString();
        print("$token  token.........");
        print("$userId  userId.........");
        setState(() {});
        //navigator.pushNamedAndRemoveUntil(RouteName.homePage);
        await checkDataApproval(
            context: context, customersId: int.parse(userId));

        loginDataBase.put("isLogin", true);
        loginDataBase.put("isLogin", true);
        loginDataBase.put("userId", userId);
        loginDataBase.put("token", token);

        if (code != null) {
        } else {}
      });
    } catch (e) {}
  }

  checkDataApproval({
    required BuildContext context,
    required int customersId,
  }) async {
    final apiHandler = OwnerStatusViewModel();
    setState(() {
      isLoading = true;
    });
    OwnerStatusRequestModel request =
    OwnerStatusRequestModel(ownerId: customersId);

    try {
      await apiHandler.ownerStatus(request: request, context: context).then(
        (response) {
          var code = response;
          Map<String, dynamic> data = code[0];
          setState(() {
            isLoading = false;
          });
          isAdharStatus = data['aadhar_status'].toString();
          isProfileStatus = data['profile_status'].toString();
          isPanStatus = data['pan_status'].toString();
          //   isLicenseStatus = data['license_status'].toString();
          isApprovalStatus = data['approval_status'].toString();
          print("$isAdharStatus  adahar card status.....");
          print("$isProfileStatus  isProfileStatus  status.....");
          print("$isPanStatus  isPanStatus card status.....");
          print("$isApprovalStatus  isApprovalStatus card status.....");
          if (isApprovalStatus == "Pending" || isApprovalStatus == "Rejected") {
            if (isAdharStatus == "Rejected" ||
                isPanStatus == "Rejected" ||
                isProfileStatus == "Rejected") {
              isDocumentRejected = true;
              navigator
                  .pushNamed(RouteName.uploadRejectedDocumentPage, arguments: {
                PassingParameters.isAdharStatus: isApprovalStatus,
                PassingParameters.isProfileStatus: isProfileStatus,
                PassingParameters.isPanStatus: isPanStatus
              });
            } else if (isApprovalStatus == "Pending") {
              if (isAdharStatus == "New" ||
                  isPanStatus == "New" ||
                  isProfileStatus == "New") {
                isDocumentRejected = false;
                navigator
                    .pushNamedAndRemoveUntil(RouteName.pendingApprovalPage);
              }
            } else {}
            if (code != null) {
            } else {}
          } else {
            navigator.pushNamedAndRemoveUntil(RouteName.homePage);
          }
        },
      );
    } catch (e) {
      print("$e e...........");
    }
  }

  resendOtp({
    required BuildContext context,
    required int phoneNumber,
  }) async {
    final apiHandler = ResendOtpViewModel();

    ResendOtpRequestModel request =
        ResendOtpRequestModel(phone: int.parse(phoneNumber.toString()));

    try {
      await apiHandler
          .resendOtp(request: request, context: context)
          .then((response) {
        var code = response;
        Map<String, dynamic> otpValue = code[0];
        print("${otpValue['otp']} otp value number....");
        setState(() {
          otpValue = otpValue['otp'];
        });
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        type = data[PassingParameters.type].toString();
        otpValue = data[PassingParameters.otp].toString();
        mobileNumber = data[PassingParameters.mobileNumber].toString();
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: AppColor.white,
          child: Stack(
            children: [
              ClipPath(
                clipper: ProsteBezierCurve(
                  position: ClipPosition.bottom,
                  list: [
                    BezierCurveSection(
                      start: const Offset(0, 150),
                      top: Offset(screenWidth / 2, 200),
                      end: Offset(screenWidth, 150),
                    ),
                  ],
                ),
                child: Container(
                  height: 180.h,
                  color: AppColor.darkBlue,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 18.w,
                  right: 18.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.h.VBox,
                    Text(
                      StringConstant.phoneVerification,
                      style: textBold.copyWith(
                        fontSize: 20.sp,
                        color: AppColor.white,
                      ),
                    ),
                    9.h.VBox,
                    Text(
                      StringConstant.enterOtpSubText,
                      style: textRegular.copyWith(
                        fontSize: 14,
                        color: AppColor.white,
                      ),
                    ),
                    14.h.VBox,
                    Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ),
                          ),
                          elevation: 10,
                          shadowColor: Colors.white,
                          child: Container(
                            height: 263.h,
                            width: 315.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                23.h.VBox,
                                Text(
                                  StringConstant.enterOTPCode,
                                  style: textBold.copyWith(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                7.h.VBox,
                                Text(
                                  StringConstant.enterOtpSubText,
                                  style: textBold.copyWith(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                17.h.VBox,
                                PinCodeTextField(
                                  textStyle: textMedium.copyWith(
                                      fontSize: 24.sp,
                                      color: AppColor.darkBlue),
                                  controller: firstFieldController,
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
                                    activeColor:
                                        AppColor.colorHint.withOpacity(0.5),
                                    errorBorderColor: Colors.transparent,
                                    inactiveColor:
                                        AppColor.colorHint.withOpacity(0.5),
                                    disabledColor: Colors.transparent,
                                    selectedColor: AppColor.darkBlue,
                                    fieldOuterPadding:
                                        EdgeInsets.only(right: 5.w),
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
                                5.h.VBox,
                                Align(
                                  alignment: Alignment.topRight,
                                  child: ValueListenableBuilder(
                                    valueListenable: isTimer,
                                    builder: (_, value, child) {
                                      return isTimer.value == false
                                          ? Countdown(
                                              controller: _controller,
                                              seconds: 60,
                                              build: (_, double time) {
                                                int i = time.toInt();
                                                return Text(
                                                  "0:" + i.toString() + "s",
                                                  style: textBold.copyWith(
                                                    fontSize: 16.sp,
                                                    color: AppColor.darkBlue,
                                                  ),
                                                );
                                              },
                                              onFinished: () {
                                                if (isTimer.value == false) {
                                                  isTimer.value = true;
                                                } else {}
                                              },
                                              interval:
                                                  const Duration(seconds: 1),
                                            )
                                          : Align(
                                              alignment: Alignment.topRight,
                                              child: InkWell(
                                                onTap: () async {
                                                  isTimer.value = false;
                                                  await resendOtp(
                                                      phoneNumber: int.parse(
                                                          mobileNumber),
                                                      context: context);
                                                },
                                                child: Text(
                                                  StringConstant.reSendCode,
                                                  style: textBold.copyWith(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            );
                                    },
                                  ),
                                ),
                                11.h.VBox,
                                Center(
                                  child: InkWell(
                                    onTap: () async {
                                      otp = firstFieldController.text.trim();
                                      if (otp.trim() == "" ||
                                          otp.trim().length != 4) {
                                        showSnackBar(context,
                                            StringConstant.enterOtpValidation);
                                      } else if (!RegExp(r'^\d{4}$')
                                          .hasMatch(otp)) {
                                        showSnackBar(context,
                                            StringConstant.validOtpValidation);
                                      } else {
                                        await otpVerification(
                                          context: context,
                                          phoneNumber: int.parse(mobileNumber),
                                          otp: int.parse(otpValue),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 40.h,
                                      width: 286.w,
                                      decoration: BoxDecoration(
                                        color: AppColor.darkBlue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            StringConstant.verify,
                                            style: textBold.copyWith(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
