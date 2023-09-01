import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:owner/fcm/PushNotificationsManager.dart';
import 'package:owner/ui/auth/response/check_documents_response.dart';
import 'package:owner/ui/auth/viewModel/check_documents_viewModel.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../core/navigation/navigation_service.dart';
import '../core/navigation/routes.dart';
import '../res.dart';
import '../util/app_utils.dart';
import '../values/colors.dart';
import '../values/string_contsant.dart';
import '../values/style.dart';
import 'auth/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    PushNotificationsManager().init();

    checkLogin();
    if (Platform.isAndroid) {
      isAndroid = true;
    } else if (Platform.isIOS) {
      isAndroid = false;
    }
    Timer(
      const Duration(seconds: 2),
      () => isLogin
          ? isApprovalStatus == "Pending"
              ? isDocumentRejected
                  ? navigator.pushNamed(RouteName.uploadRejectedDocumentPage,
                      arguments: {
                          "isAdharStatus": isAdharStatus,
                          "isProfileStatus": isProfileStatus,
                          "isPanStatus": isPanStatus,
                        })
                  : navigator.pushNamed(
                      RouteName.pendingApprovalPage,
                    )
              : navigator.pushNamed(
                  RouteName.homePage,
                )
          : navigator.pushNamedAndRemoveUntil(RouteName.login,
              navigatorRoute: false),
    );
  }

  String isAdharStatus = "";
  String isPanStatus = "";
  String isProfileStatus = "";
  String isApprovalStatus = "";
  bool isDocumentRejected = false;

  checkDataApproval({
    required BuildContext context,
    required int customersId,
  }) async {
    final apiHandler = CheckDocumentsViewModel();

    CheckDocumentRequestModel request =
        CheckDocumentRequestModel(userId: customersId);

    try {
      await apiHandler.userLogin(request: request, context: context).then(
        (response) {
          var code = response;
          Map<String, dynamic> data = code[0];
          isAdharStatus = data['aadhar_status'].toString();
          isProfileStatus = data['profile_status'].toString();
          isPanStatus = data['pan_status'].toString();
          //isLicenseStatus =  data['license_status'].toString();
          isApprovalStatus = data['approval_status'].toString();
          print("$isAdharStatus  adahar card status.....");
          print("$isProfileStatus  isProfileStatus  status.....");
          print("$isPanStatus  isPanStatus card status.....");
          print("$isApprovalStatus  isApprovalStatus card status.....");
          if (isApprovalStatus == "Pending" || isApprovalStatus == "Rejected") {
            print("profile is not approved..........");
            if (isAdharStatus == "Rejected" ||
                isPanStatus == "Rejected" ||
                //  isLicenseStatus == "Rejected" ||
                isProfileStatus == "Rejected") {
              isDocumentRejected = true;
              setState(() {
                print("some documents is rejected..........");
              });
              //  navigator.pushNamedAndRemoveUntil(RouteName.pendingApprovalPage);
            } else if (isApprovalStatus == "Pending") {
              if (isAdharStatus == "New" ||
                  isPanStatus == "New" ||
                  isProfileStatus == "New") {
                isDocumentRejected = false;
                navigator
                    .pushNamedAndRemoveUntil(RouteName.pendingApprovalPage);
                setState(() {});
              }
            }
            if (code != null) {
            } else {}
          } else {
            //  navigator.pushNamedAndRemoveUntil(RouteName.homePage);
          }
        },
      );
    } catch (e) {
      print("$e e...........");
    }
  }

  bool isLogin = false;

  checkLogin() async {
    Box loginDataBase = await Hive.openBox('database1');
    if (loginDataBase.get("isLogin").toString() == "true") {
      isLogin = true;

      userId = loginDataBase.get("userId");
      token = loginDataBase.get("token");
      print(token.toString() + " token..........");
      print("$userId userId........");
      checkDataApproval(customersId: int.parse(userId), context: context);
      print("user is login....");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColor.darkBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.h.VBox,
            Image.asset(
              Res.logo,
              height: 136.h,
              width: 136.w,
            ),
            10.h.VBox,
            Column(
              children: [
                Text(
                  StringConstant.ceoCabs,
                  style: textRegular46,
                ),
                6.h.VBox,
                Text(
                  StringConstant.welcomeSubText,
                  style: textRegular46.copyWith(fontSize: 24),
                ),
                //   20.h.VBox,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
