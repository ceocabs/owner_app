import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';

class LoginHistoryDetailsPage extends StatefulWidget {
  const LoginHistoryDetailsPage({Key? key}) : super(key: key);

  @override
  State<LoginHistoryDetailsPage> createState() =>
      _LoginHistoryDetailsPageState();
}

class _LoginHistoryDetailsPageState extends State<LoginHistoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.loginHistory,
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
            Container(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 20.h,
              ),
              child: Container(
                width: 372.w,
                child: SingleChildScrollView(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 17.w),
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 15.h),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 13.h),
                            child: Container(
                              height: 60.h,
                              width: 290.w,
                              padding: EdgeInsets.only(
                                left: 15.w,
                                right: 15.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.w),
                                color: AppColor.greyColor.withOpacity(0.6),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        StringConstant.login,
                                        style: textRegular.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: AppColor.dark,
                                        ),
                                      ),
                                      2.h.VBox,
                                      Text(
                                        "10:00 Pm",
                                        style: textRegular.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: AppColor.dark,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        StringConstant.logout,
                                        style: textRegular.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: AppColor.dark,
                                        ),
                                      ),
                                      2.h.VBox,
                                      Text(
                                        "12:00 Pm",
                                        style: textRegular.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: AppColor.dark,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "2 Hour",
                                        style: textRegular.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: AppColor.dark,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        physics: const ScrollPhysics(),
                        itemCount: 10,
                        shrinkWrap: true,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
