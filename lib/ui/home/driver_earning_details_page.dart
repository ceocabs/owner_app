import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/button_widget.dart';

class DriverEarningDetailsPage extends StatefulWidget {
  const DriverEarningDetailsPage({Key? key}) : super(key: key);

  @override
  _DriverEarningDetailsPageState createState() =>
      _DriverEarningDetailsPageState();
}

class _DriverEarningDetailsPageState extends State<DriverEarningDetailsPage> {


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.earningDetails,
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
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 17.w,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.h.VBox,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.w),
                            child: Image.asset(
                              Res.earningAd,
                              height: 250.h,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Text(
                            StringConstant.earningDetails,
                            style: textBold.copyWith(
                                fontSize: 20.sp,
                                color: AppColor.darkBlue),
                          ),
                          4.h.VBox,
                          Row(
                            children: [
                              Text(
                                "",
                                style: textBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColor.black),
                              ),
                            ],
                          ),
                          28.h.VBox,
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.netEarning,
                                style: textBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColor.darkBlue),
                              ),
                              Text(
                                "₹ 200",
                                style: textBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColor.darkBlue),
                              ),
                            ],
                          ),
                          11.h.VBox,
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "CEOCABS Charges",
                                style: textRegular.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "₹ 100",
                                style: textRegular.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          8.h.VBox,
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.gstChargeTitle,
                                style: textRegular.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "₹ 25",
                                style: textRegular.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          26.h.VBox,
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.totalTripAmount,
                                style: textBold.copyWith(
                                  color: AppColor.darkBlue,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "₹ 20",
                                style: textBold.copyWith(
                                  color: AppColor.darkBlue,
                                  fontSize: 14.sp,
                                ),
                              )
                            ],
                          ),
                          20.h.VBox,
                          AppButton(
                            StringConstant.view,
                                () {
                              navigator.pushNamed(
                                  RouteName.earningFilterDataPage);
                            },
                            height: 41.h,
                          ),
                          20.h.VBox,
                        ],
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
