import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/core/navigation/navigation_service.dart';
import 'package:owner/ui/auth/response/login_response.dart';
import 'package:owner/ui/auth/viewModel/login_viewModel.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/passing_parameters.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/routes.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../values/validations.dart';
import '../../values/validator.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_form_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String countryCode = "+91";
  bool? isAgree = false;

  TextEditingController mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic responseObj;

  var deviceInfo = DeviceInfoPlugin();

  Future<String?> _getId() async {
    if (Platform.isIOS) {
      setState(() {
        isPlatform = "IOS";
      });
      var iosDeviceInfo = await deviceInfo.iosInfo;
      useDeviceModelName = iosDeviceInfo.model.toString();
      useDeviceName = iosDeviceInfo.name.toString();
      return iosDeviceInfo.identifierForVendor;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      setState(() {
        isPlatform = "Android";
      });
      // useDeviceModelName = androidDeviceInfo.device.toString();
      useDeviceName = androidDeviceInfo.device.toString();
      useDeviceModelName = androidDeviceInfo.model.toString();
      deviceId = androidDeviceInfo.id.toString();
      manufacture = androidDeviceInfo.manufacturer.toString();

      print("$useDeviceName userdevice name.....");
      print("$manufacture manufacture....");
      print("$processor model name....");
      print("$deviceId android id....");
      print("$useDeviceModelName useDeviceModelName name.....");
      return androidDeviceInfo.id;
    }
  }

  validateDetailsAndSendOTP(
      {required BuildContext context,
      required String phoneNumber,
      required String deviceId,
      required String deviceType,
      required String ram,
      required String processor,
      required String deviceOs,
      required String deviceModel,
      required String customersId,
      required String manufacturer}) async {
    final apiHandler = LoginViewModel();

    LoginRequestModel request = LoginRequestModel(
      phoneNo: phoneNumber,
      customersId: customersId,
      deviceId: deviceId,
      deviceModel: deviceModel,
      deviceOs: deviceOs,
      deviceType: deviceType,
      manufacturer: manufacturer,
      processor: processor,
      ram: ram,
    );

    try {
      await apiHandler
          .userLogin(request: request, context: context)
          .then((response) {
        var code = response;
        Map<String, dynamic> otpValue = code[0];
        print("${otpValue['otp']} otp value number....");
        navigator.pushNamed(RouteName.otpVerificationPage, arguments: {
          PassingParameters.type: "Login",
          PassingParameters.otp: otpValue['otp'].toString(),
          PassingParameters.mobileNumber: mobileController.text
        });
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
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
                Positioned(
                  bottom: 80.h,
                  child: SizedBox(
                    width: screenWidth,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 17.w,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringConstant.welcomeBack,
                                  style: textBold.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                9.h.VBox,
                                Text(
                                  StringConstant.continueLogin,
                                  style: textRegular.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        19.h.VBox,
                        Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(
                              20.w,
                            ),
                          ),
                          elevation: 10,
                          shadowColor: Colors.white,
                          child: Container(
                            width: 320.w,
                            //  height: 401.h,
                            padding: EdgeInsets.only(
                              left: 16.w,
                              right: 17.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                26.h.VBox,
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    StringConstant.enterYourPhone,
                                    style: textBold,
                                  ),
                                ),
                                10.h.VBox,
                                AppTextField(

                                  prefixIcon: SizedBox(
                                    child: CountryCodePicker(
                                      padding: const EdgeInsets.all(0),
                                      showFlag: true,
                                      flagWidth: 20.w,
                                      showFlagMain: true,
                                      enabled: false,

                                      onChanged: (code) {
                                        setState(() {
                                          countryCode = code.toString();
                                        });
                                      },
                                      textOverflow: TextOverflow.ellipsis,
                                      textStyle: textMedium,
                                      initialSelection: "+91",
                                    ),
                                  ),
                                  controller: mobileController,
                                  validators: mobileValidator,
                                  keyboardType: TextInputType.number,
                                  label: StringConstant.enterYourPhone,
                                  maxLength: 10,
                                  inputFormatters: [
                                    NoLeadingSpaceFormatter(),
                                    FilteringTextInputFormatter.deny(
                                        RegExp('[\\.|\\,|\\-\\ ]')),
                                  ],
                                  keyboardAction: TextInputAction.done,
                                  hint: StringConstant.enterYourPhone,
                                ),
                                9.h.VBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                      height: 16.h,
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        value: isAgree,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isAgree = value;
                                          });
                                        },
                                      ),
                                    ),
                                    10.w.HBox,
                                    SizedBox(
                                      width: 200.w,
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          text: StringConstant.iAgreeWith,
                                          style: textRegular.copyWith(
                                              fontSize: 12.sp,
                                              color: AppColor.grey),
                                          children: [
                                            TextSpan(
                                              text: StringConstant
                                                  .termsAndCondition,
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  navigator.pushNamed(RouteName
                                                      .termsAndConditionPage);
                                                },
                                              style: textRegular.copyWith(
                                                color: AppColor.darkBlue,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                13.h.VBox,
                                AppButton(
                                  StringConstant.login,
                                  () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (isAgree == true) {
                                        await validateDetailsAndSendOTP(
                                          context: context,
                                          phoneNumber: mobileController.text,
                                          ram: "2gb",
                                          processor: "mediatek",
                                          manufacturer: "manufacture",
                                          deviceType: /*isPlatform*/ "Android",
                                          deviceOs: "8.1.0",
                                          deviceModel: "useDeviceModelName",
                                          deviceId: /*deviceId*/
                                              "49c25710-702f-4816-adb7-311fb777c4a8",
                                          customersId: "0",
                                        );
                                      } else {
                                        if (isAgree != true) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            headerAnimationLoop: true,
                                            animType: AnimType.topSlide,
                                            showCloseIcon: false,
                                            title: StringConstant.warning,
                                            desc: StringConstant
                                                .termsAndConditionValidation,
                                            descTextStyle: textBold.copyWith(
                                                fontSize: 20.sp,
                                                color: AppColor.dark),
                                            btnCancelOnPress: () {},
                                            onDismissCallback: (type) {},
                                            btnOkOnPress: () {},
                                          ).show();
                                        }
                                      }
                                    }
                                  },
                                  height: 40.h,
                                ),
                                12.h.VBox,
                                13.h.VBox,
                                Center(
                                  child: SizedBox(
                                    width: 266.w,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: StringConstant.notHaveAccount,
                                        style: textRegular.copyWith(
                                            fontSize: 11.sp,
                                            color: AppColor.dark),
                                        children: [
                                          TextSpan(
                                            text: StringConstant.registerNow,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pushNamed(
                                                    context, RouteName.signUp);
                                              },
                                            style: textBold.copyWith(
                                              color: Colors.blue,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                5.h.VBox,
                                Text(
                                  StringConstant.noteForOwnerApp,
                                  style: textBold.copyWith(
                                      color: AppColor.redColor,
                                      fontSize: 14.sp),
                                ),
                                20.h.VBox,
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String isPlatform = "";
String useDeviceName = "";
String useDeviceModelName = "";
String deviceId = "";
String ram = "";
String processor = "";
String deviceOs = "";
String manufacture = "";
String userId = "";
String token = "";
