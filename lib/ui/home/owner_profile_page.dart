import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/ui/auth/login_screen.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../auth/model/owner_profile_model.dart';
import '../auth/response/owner_profile_response.dart';
import '../auth/viewModel/owner_profile_viewModel.dart';

class OwnerProfilePage extends StatefulWidget {
  const OwnerProfilePage({Key? key}) : super(key: key);

  @override
  State<OwnerProfilePage> createState() => _OwnerProfilePageState();
}

class _OwnerProfilePageState extends State<OwnerProfilePage> {
  bool isLoading = false;

  List<OwnerProfileModel> ownerProfileModelList = [];

  @override
  Future<void> didChangeDependencies() async {
    await getOwnerInfo(context: context, userId: userId);
    super.didChangeDependencies();
  }

  getOwnerInfo({
    required BuildContext context,
    required String userId,
  }) async {
    final apiHandler = ownerProfileViewModel();
    OwnerProfileRequestModel request = OwnerProfileRequestModel(
      ownerId: userId,
    );

    setState(() {
      isLoading = true;
    });

    try {
      await apiHandler
          .ownerProfile(request: request, context: context)
          .then((response) {
        var code = response;
        ownerProfileModelList =
            response.map((i) => OwnerProfileModel.fromJson(i)).toList();
        print("${ownerProfileModelList.length}  length.........");
        setState(() {
          isLoading = false;
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.profile,
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
                setState(() {
                  navigator.pop();
                });
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
      body: isLoading
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RippleAnimation(
                    color: Colors.white,
                    delay: const Duration(milliseconds: 300),
                    repeat: true,
                    minRadius: 100,
                    ripplesCount: 6,
                    duration: const Duration(milliseconds: 6 * 300),
                    child: Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(Res.logo),
                    ),
                  )
                ],
              ))
          : Container(
              color: AppColor.white,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: ProsteBezierCurve(
                      position: ClipPosition.bottom,
                      list: [
                        BezierCurveSection(
                          start: Offset(0, 150),
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
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 20.h,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.h.VBox,
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                              top: 10.h,
                            ),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10.h, bottom: 10.h, left: 10.w),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    15.h.VBox,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Container(
                                                //width: 250.w,
                                                child: Text(
                                                  "${ownerProfileModelList[0].firstName} ${ownerProfileModelList[0].lastName}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: textBold.copyWith(
                                                    fontSize: 18.sp,
                                                    color: AppColor.green,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        10.h.VBox,
                                        Row(
                                          children: [
                                            Container(
                                              width: 20.w,
                                              child: const Icon(Icons.call,
                                                  size: 16),
                                            ),
                                            Text(
                                              "  +91 " +
                                                  "${ownerProfileModelList[0].mobileNo.toString()}",
                                              style: textBold.copyWith(
                                                  fontSize: 14.sp),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 20.w,
                                              child: Image.asset(
                                                Res.whatsAppImage,
                                                width: 17.w,
                                                height: 20.h,
                                                fit: BoxFit.contain,
                                              ),
                                            ),

                                            //  2.h.VBox,
                                            Text(
                                              "  +91 " +
                                                  "${ownerProfileModelList[0].mobileNo.toString()}",
                                              style: textBold.copyWith(
                                                  color: AppColor.darkBlue,
                                                  fontSize: 14.sp),
                                            ),
                                          ],
                                        ),
                                        2.h.VBox,
                                        Row(
                                          children: [
                                            Text(
                                              "${StringConstant.email} : ",
                                              style: textBold.copyWith(
                                                  color: AppColor.dark),
                                            ),
                                            2.h.VBox,
                                            Container(
                                              width: 180.w,
                                              child: Text(
                                                "${ownerProfileModelList[0].emailId.toString()}",
                                                style: textBold.copyWith(
                                                    color: AppColor.darkBlue),
                                                overflow:
                                                    TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        5.h.VBox,
                                        Row(
                                          children: [
                                            Text(
                                              "Total Vehicle : ",
                                              style: textBold.copyWith(
                                                  color: AppColor.dark),
                                            ),
                                            2.h.VBox,
                                            Container(
                                              width: 120.w,
                                              child: Text(
                                                "${ownerProfileModelList[0].totalVehicleCount.toString()}",
                                                style: textBold.copyWith(
                                                    color: AppColor.darkBlue),
                                                overflow:
                                                    TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        20.h.VBox,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.w),
                                                  child: Image.network(
                                                    ownerProfileModelList[0]
                                                        .aadharCardFrontImageUrl
                                                        .toString(),
                                                    fit: BoxFit.fill,
                                                    width: 80.w,
                                                    height: 70.h,
                                                    errorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                                stackTrace) {
                                                      return Image.asset(
                                                        Res.user,
                                                        width: 80.w,
                                                        height: 70.h,
                                                        fit: BoxFit.fill,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                5.h.VBox,
                                                Container(
                                                  width: 100.w,
                                                  child: Text(
                                                    "Aadhar Card Front Image",
                                                    style: textBold.copyWith(
                                                        fontSize: 14.sp
                                                    ),
                                                    textAlign:
                                                        TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.w),
                                                  child: Image.network(
                                                    ownerProfileModelList[0]
                                                        .aadharCardBackImageUrl
                                                        .toString(),
                                                    fit: BoxFit.fill,
                                                    width: 80.w,
                                                    height: 70.h,
                                                    errorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                                stackTrace) {
                                                      return Image.asset(
                                                        Res.user,
                                                        width: 80.w,
                                                        height: 70.h,
                                                        fit: BoxFit.fill,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                5.h.VBox,
                                                Container(
                                                  width: 100.w,
                                                  child: Text(
                                                    "Aadhar Card Front Image",
                                                    style: textBold.copyWith(
                                                      fontSize: 14.sp
                                                    ),

                                                    textAlign:
                                                        TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        20.h.VBox,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.w),
                                                  child: Image.network(
                                                    ownerProfileModelList[0]
                                                        .panCardFrontImageUrl
                                                        .toString(),
                                                    fit: BoxFit.fill,
                                                    width: 80.w,
                                                    height: 70.h,
                                                    errorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                                stackTrace) {
                                                      return Image.asset(
                                                        Res.user,
                                                        width: 80.w,
                                                        height: 70.h,
                                                        fit: BoxFit.fill,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                5.h.VBox,
                                                Container(
                                                  width: 100.w,
                                                  child: Text(
                                                    "Pan Card Image",
                                                    style: textBold.copyWith(
                                                        fontSize: 14.sp
                                                    ),
                                                    textAlign:
                                                        TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ownerProfileModelList[0]
                                                                .profileImage
                                                                .toString() !=
                                                            "" ||
                                                        // ignore: unnecessary_null_comparison
                                                        "" != null
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.w),
                                                        child: Image.network(
                                                          ownerProfileModelList[
                                                                  0]
                                                              .profileImage
                                                              .toString(),
                                                          fit: BoxFit.fill,
                                                          width: 80.w,
                                                          height: 70.h,
                                                          errorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  Object
                                                                      exception,
                                                                  StackTrace?
                                                                      stackTrace) {
                                                            return Image
                                                                .asset(
                                                              Res.user,
                                                              width: 80.w,
                                                              height: 70.h,
                                                              fit:
                                                                  BoxFit.fill,
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : Image.asset(
                                                        Res.user,
                                                        width: 60.w,
                                                        height: 50.h,
                                                        fit: BoxFit.fill,
                                                      ),
                                                5.h.VBox,
                                                Container(
                                                  width: 100.w,
                                                  child: Text(
                                                    "Profile Image",
                                                    style: textBold.copyWith(
                                                        fontSize: 14.sp
                                                    ),
                                                    textAlign:
                                                        TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          10.h.VBox,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
