import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:owner/ui/auth/response/logout_response.dart';
import 'package:owner/ui/auth/viewModel/logout_viewModel.dart';
import 'package:owner/ui/auth/otp_verification_page.dart';
import 'package:owner/ui/home/home_page.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/passing_parameters.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../auth/login_screen.dart';
import '../auth/model/owner_profile_model.dart';
import '../auth/response/owner_profile_response.dart';
import '../auth/viewModel/owner_profile_viewModel.dart';

class MenuOptionsScreen extends StatefulWidget {
  const MenuOptionsScreen({Key? key}) : super(key: key);

  @override
  State<MenuOptionsScreen> createState() => _MenuOptionsScreenState();
}

class _MenuOptionsScreenState extends State<MenuOptionsScreen> {
  logout({
    required BuildContext context,
    required int customersId,
  }) async {
    final apiHandler = LogoutViewModel();

    LogoutRequestModel request =
        LogoutRequestModel(userId: customersId, token: token);

    try {
      await apiHandler
          .userLogin(request: request, context: context)
          .then((response) async {
        var code = response;
        Map<String, dynamic> otpValue = code[0];
        //  navigator!.pushNamedAndRemoveUntil(RouteName.login,);
        Box loginDataBase = await Hive.openBox('database1');
        loginDataBase.put("isLogin", "");
        token = "";
        navigator.pushNamedAndRemoveUntil(RouteName.login);

        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20.w),
          insetPadding: EdgeInsets.all(30.w),
          actionsPadding: EdgeInsets.all(20.w),
          titlePadding: EdgeInsets.all(20.w),
          buttonPadding: EdgeInsets.all(30.w),
          title: Text(
            StringConstant.logoutConfirmation,
            style: textBold.copyWith(
              color: AppColor.darkBlue,
            ),
          ),
          actions: [
            InkWell(
              onTap: () async {
                navigator.pop();
                await logout(
                  context: context,
                  customersId: int.parse(userId),
                );
              },
              child: Text(
                StringConstant.yes,
                style: textBold.copyWith(
                  fontSize: 16.sp,
                  color: AppColor.redColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                navigator.pop();
              },
              child: Text(
                StringConstant.no,
                style: textBold.copyWith(
                  fontSize: 16.sp,
                  color: AppColor.dark,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<OwnerProfileModel> ownerProfileModelList = [];

  getOwnerInfo({
    required BuildContext context,
    required String userId,
  }) async {
    final apiHandler = ownerProfileViewModel();
    OwnerProfileRequestModel request = OwnerProfileRequestModel(
      ownerId: userId,
    );

    try {
      await apiHandler
          .ownerProfile(request: request, context: context)
          .then((response) {
        var code = response;
        ownerProfileModelList =
            response.map((i) => OwnerProfileModel.fromJson(i)).toList();
        print("${ownerProfileModelList.length}  length.........");
        name =
            "${ownerProfileModelList[0].firstName} ${ownerProfileModelList[0].lastName}";
        mobileNo = ownerProfileModelList[0].mobileNo.toString();
        profileImage = ownerProfileModelList[0].profileImage.toString();
        email = ownerProfileModelList[0].emailId.toString();
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  List<String> imageList = [
    Res.myProfile,
    Res.trackVehicle,
    Res.driverList,
    Res.vehicleDetails,
    Res.bankDetails,
    Res.transactionHistory,
    Res.withdrawHistory,
    Res.totalEarning,
    // Res.management,
    Res.privacy,
    Res.termsAndConditions,
    Res.logout,
  ];

  List<String> menuOptionList = [
    StringConstant.myProfile,
    StringConstant.trackAllVehicle,
    StringConstant.driverList,
    StringConstant.vehicleList,
    StringConstant.bankDetails,
    StringConstant.transactionHistory,
    StringConstant.withdrawHistory,
    StringConstant.totalEarning,
    // StringConstant.vehicleAndDriverManagement,
    StringConstant.privacyPolicy,
    StringConstant.termsAndConditions,
    StringConstant.logout,
  ];

  @override
  Future<void> didChangeDependencies() async {
    await getOwnerInfo(context: context, userId: userId);

    super.didChangeDependencies();
  }

  Future<void> navigationFun(int index) async {
    if (index == 0) {
      navigator.pushNamed(RouteName.ownerProfilePage);
    } else if (index == 1) {
    } else if (index == 2) {
      navigator.pushNamed(RouteName.ownerDriverList);
    } else if (index == 3) {
      navigator.pushNamed(RouteName.vehicleStatusPage);
    } else if (index == 4) {
      navigator.pushNamed(RouteName.ownerBankDetails);
    } else if (index == 5) {
      navigator.pushNamed(RouteName.chooseSpecifcDriverScreen,
          arguments: {PassingParameters.categoryType: "transactionHistory"});
    } else if (index == 6) {
      navigator.pushNamed(RouteName.chooseSpecifcDriverScreen,
          arguments: {PassingParameters.categoryType: "withdrawHistory"});
    } else if (index == 7) {
      navigator.pushNamed(RouteName.chooseSpecifcDriverScreen,
          arguments: {PassingParameters.categoryType: "totalEarning"});
    } else if (index == 8) {
      navigator.pushNamed(RouteName.privacyPolicyPage);
    } else if (index == 9) {
      navigator.pushNamed(RouteName.termsAndConditionPage);
    } else if (index == 10) {
      showLogoutDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: InkWell(
              onTap: () {
                navigator.pop();
              },
              child: const Icon(Icons.close),
            ),
          )
        ],
        leading: Container(),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300.w,
              height: 150.h,
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
                top: 10.h,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: AppColor.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70.w,
                        height: 60.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.accentColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.w),
                          child: Image.network(
                            profileImage,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                "assets/images/user.png",
                                width: 70.w,
                                height: 70.h,
                                fit: BoxFit.contain,
                              );
                            },
                            width: 150.w,
                            height: 120.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      20.w.HBox,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: textBold.copyWith(
                                fontSize: 18.sp, color: AppColor.green),
                          ),
                          //5.h.VBox,
                          Text(
                            mobileNo,
                            style: textBold.copyWith(
                                fontSize: 14.sp, color: AppColor.dark),
                          ),
                          Text(
                            email,
                            style: textBold.copyWith(
                              fontSize: 14.sp,
                              color: AppColor.dark,
                            ),
                          ),
                        ],
                      ),
                      10.h.VBox,
                    ],
                  ),
                  20.h.VBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          navigator.pushNamed(RouteName.searchDriverPage);
                        },
                        child: Container(
                          width: 100.w,
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: AppColor.darkBlue,
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          child: Center(
                            child: Text(
                              StringConstant.addDriver,
                              style: textRegular.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          navigator.pushNamed(
                            RouteName.vehicleRegistrationFirstPage,
                            arguments: {
                              PassingParameters.isEdit: "false",
                              PassingParameters.vehicleId: "",
                              PassingParameters.vehicleNumber: ""
                            },
                          );
                        },
                        child: Container(
                          width: 100.w,
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: AppColor.darkBlue,
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          child: Center(
                            child: Text(
                              StringConstant.addVehicle,
                              style: textRegular.copyWith(
                                fontSize: 12.sp,
                                color: AppColor.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            20.h.VBox,
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: menuOptionList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 6.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        navigationFun(index);
                      },
                      child: Container(
                        height: 110.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.w),
                              child: Container(
                                height: 50.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.w),
                                  color: AppColor.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      imageList[index],
                                      width: 30.w,
                                      height: 30.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            5.h.VBox,
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 70.w,
                                child: Text(
                                  menuOptionList[index],
                                  style: textBold.copyWith(
                                    color: AppColor.white,
                                    fontSize: 10.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


