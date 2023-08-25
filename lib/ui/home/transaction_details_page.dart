import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';

class TransactionDetailsPage extends StatefulWidget {
  const TransactionDetailsPage({Key? key}) : super(key: key);

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.transactionDetail,
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
                      borderRadius: BorderRadius.circular(20.0),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.netEarningAmount,
                                style: textBold.copyWith(fontSize: 16.sp),
                              ),
                              Text(
                                "17 Dec 2022, 2:42PM",
                                style: textBold.copyWith(
                                  color: AppColor.black,
                                  fontSize: 11.sp,
                                ),
                              )
                            ],
                          ),
                          6.h.VBox,
                          Text(
                            "₹ 500.0",
                            style: textBold.copyWith(
                              fontSize: 24.sp,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          Text(
                            StringConstant.categoryBooking,
                            style: textRegular.copyWith(
                                color: Colors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          12.h.VBox,
                          Container(
                            height: 35.h,
                            width: 292.w,
                            decoration: BoxDecoration(
                              color: AppColor.darkBlue,
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            child: Center(
                              child: Text(
                                "CRN - 546545612658",
                                style: textBold.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ),
                          46.h.VBox,
                          Text(
                            StringConstant.tripCalculation,
                            style: textBold.copyWith(fontSize: 14.sp),
                          ),
                          15.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.totalTripAmount,
                                style: textRegular.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "₹ 500.0",
                                style: textRegular.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          5.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.companyCharges,
                                style: textRegular.copyWith(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "₹ 500.0",
                                style: textRegular.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          5.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.gst,
                                style: textRegular.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "₹ 500.0",
                                style: textRegular.copyWith(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          5.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.otherCharges,
                                style: textRegular.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "₹ 500.0",
                                style: textRegular.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          10.h.VBox,
                          Container(
                            height: 31.h,
                            padding: EdgeInsets.only(
                              right: 13.w,
                              left: 13.w,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.green,
                              ),
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  StringConstant.netEarningAmount,
                                  style: textBold.copyWith(
                                    color: AppColor.dark,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  "₹ 500.0",
                                  style: textBold.copyWith(
                                    color: AppColor.dark,
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          24.h.VBox,
                          Row(
                            children: [
                              Text(
                                StringConstant.netEarningAmount,
                                style: textBold,
                              ),
                              Text(
                                "₹ 500.0",
                                style: textBold,
                              ),
                            ],
                          ),
                          24.h.VBox,
                          Text(
                            StringConstant.paymentReceivedBy,
                            style: textBold.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          10.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.cashAmount,
                                style: textRegular.copyWith(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "₹ 500.0",
                                style: textRegular.copyWith(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          5.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.onlineAmount,
                                style: textRegular.copyWith(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "₹ 500.0",
                                style: textRegular.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          5.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.earningAmount,
                                style: textRegular.copyWith(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "₹ 500.0",
                                style: textRegular.copyWith(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          15.h.VBox,
                          Container(
                            height: 31.h,
                            padding: EdgeInsets.only(
                              right: 13.w,
                              left: 13.w,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.green,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  StringConstant.finalAmount,
                                  style: textBold.copyWith(
                                      color: AppColor.dark, fontSize: 14.sp),
                                ),
                                Text(
                                  "₹ 500.0",
                                  style: textBold.copyWith(
                                    color: AppColor.dark,
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          20.h.VBox
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
