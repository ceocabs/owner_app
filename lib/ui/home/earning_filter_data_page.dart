import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:proste_bezier_curve/utils/type/index.dart';

import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../auth/model/earning_filter_data_model.dart';

class EarningFilterDataPage extends StatefulWidget {
  const EarningFilterDataPage({Key? key}) : super(key: key);

  @override
  _EarningFilterDataPageState createState() => _EarningFilterDataPageState();
}

class _EarningFilterDataPageState extends State<EarningFilterDataPage> {
  bool isLoading = false;
  String selectedFilter = "Day";
  List<EarningFilterDataModel> earningFilterDataModelList = [];

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
                width: MediaQuery.of(context).size.width,
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
                      bottom: 10.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        20.h.VBox,
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () async {},
                                child: Container(
                                  width: 80.w,
                                  child: Center(
                                    child: Text(
                                      "Day",
                                      style: textSemiBold.copyWith(
                                          color: selectedFilter == "Day"
                                              ? AppColor.green
                                              : AppColor.black),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {},
                                child: Container(
                                  width: 80.w,
                                  child: Center(
                                    child: Text(
                                      "Week",
                                      style: textSemiBold.copyWith(
                                          color: selectedFilter == "Week"
                                              ? AppColor.green
                                              : AppColor.black),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {},
                                child: Container(
                                  width: 80.w,
                                  child: Center(
                                    child: Text(
                                      "Month",
                                      style: textSemiBold.copyWith(
                                          color: selectedFilter == "Month"
                                              ? AppColor.green
                                              : AppColor.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.h.VBox,
                        isLoading
                            ? Container(
                                height: 480.h,
                              )
                            : Container(
                                height: 480.h,
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 10.w),
                                      child: Container(
                                        padding: EdgeInsets.all(10.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColor.grey.withOpacity(0.3),
                                        ),
                                        height: 155.h,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Date : ",
                                                  style: textSemiBold.copyWith(
                                                    color: AppColor.darkBlue,
                                                  ),
                                                ),
                                                Text(
                                                  "Date",
                                                  style: textSemiBold.copyWith(
                                                    color: AppColor.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  StringConstant
                                                      .onlineHoursTitle,
                                                  style: textSemiBold.copyWith(
                                                    color: AppColor.darkBlue,
                                                  ),
                                                ),
                                                Text(
                                                  "10 Hours",
                                                  style: textSemiBold.copyWith(
                                                    color: AppColor.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  StringConstant.kmTitle,
                                                  style: textSemiBold.copyWith(
                                                    color: AppColor.darkBlue,
                                                  ),
                                                ),
                                                Text(
                                                  "25 Km",
                                                  style: textSemiBold.copyWith(
                                                    color: AppColor.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  StringConstant
                                                      .totalTripsTitle,
                                                  style: textSemiBold.copyWith(
                                                    color: AppColor.darkBlue,
                                                  ),
                                                ),
                                                Text(
                                                 "1",
                                                  style: textSemiBold.copyWith(
                                                    color: AppColor.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  StringConstant
                                                      .netEarningTitle,
                                                  style: textSemiBold.copyWith(
                                                      color: AppColor.darkBlue),
                                                ),
                                                Text(
                                                  "100.00 Rs",
                                                  style: textSemiBold.copyWith(
                                                      color: AppColor.green),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  StringConstant.ceoChargesTitle,
                                                  style: textSemiBold.copyWith(
                                                      color: AppColor.darkBlue),
                                                ),
                                                Text(
                                                  "25.00 Rs",
                                                  style: textSemiBold.copyWith(
                                                      color: AppColor.green),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  StringConstant.gstChargeTitle,
                                                  style: textSemiBold.copyWith(
                                                      color: AppColor.darkBlue),
                                                ),
                                                Text(
                                                  "10.00 Rs",
                                                  style: textSemiBold.copyWith(
                                                      color: AppColor.green),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  StringConstant.tripAmountTitle,
                                                  style: textSemiBold.copyWith(
                                                    color: AppColor.darkBlue,
                                                  ),
                                                ),
                                                Text(
                                                  "220.00 Rs",
                                                  style: textSemiBold.copyWith(
                                                    color: AppColor.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 10,
                                ),
                              ),
                      ],
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
