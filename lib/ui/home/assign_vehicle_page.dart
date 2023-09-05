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

class AssignVehiclePage extends StatefulWidget {
  const AssignVehiclePage({Key? key}) : super(key: key);

  @override
  State<AssignVehiclePage> createState() => _AssignVehiclePageState();
}

class _AssignVehiclePageState extends State<AssignVehiclePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.assignVehicle,
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
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 130.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.h.VBox,
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Text(
                                StringConstant.alreadyAssignVehicle,
                                style: textBold.copyWith(
                                  color: AppColor.redColor,
                                ),
                              ),
                            ),
                            Container(
                              height: 90.h,
                              child: ListView.builder(
                                padding: EdgeInsets.only(
                                    left: 16.w,
                                    right: 16.w,
                                    bottom: 10.h,
                                    top: 10.h),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.all(8.w),
                                    child: Container(
                                      height: 50.h,
                                      width: 250.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.w),
                                        border: Border.all(
                                          color: AppColor.greyColor,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                Res.car1,
                                                width: 60.w,
                                                height: 60.h,
                                              ),
                                              10.w.HBox,
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "MH 12 XW-1282",
                                                    style: textBold.copyWith(
                                                        color:
                                                            AppColor.darkBlue,
                                                        fontSize: 14.sp),
                                                  ),
                                                  Text(
                                                    "Maruti Sadan  |  Mini",
                                                    style: textBold.copyWith(
                                                        color:
                                                            AppColor.darkBlue,
                                                        fontSize: 12.sp),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child: Text(
                                              "Remove",
                                              style: textBold.copyWith(
                                                  color: AppColor.redColor,
                                                  fontSize: 12.sp),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                                itemCount: 5,
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //  5.h.VBox,
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                        ),
                        child: Container(
                          height: 1.h,
                          color: AppColor.greyColor,
                        ),
                      ),
                      10.h.VBox,

                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          StringConstant.assignNewVehicle,
                          style: textBold.copyWith(color: AppColor.green),
                        ),
                      ),
                      Container(
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                top: 10.h,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 250.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.w),
                                    border: Border.all(
                                      color: selectedIndex == index
                                          ? AppColor.green
                                          : AppColor.greyColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              Res.car1,
                                              width: 60.w,
                                              height: 60.h,
                                            ),
                                            10.w.HBox,
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "MH 12 XW-1282",
                                                  style: textBold.copyWith(
                                                      color: AppColor.darkBlue,
                                                      fontSize: 14.sp),
                                                ),
                                                Text(
                                                  "Maruti Sadan  |  Mini",
                                                  style: textBold.copyWith(
                                                      color: AppColor.darkBlue,
                                                      fontSize: 12.sp),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: Text(
                                            StringConstant.assign,
                                            style: textBold.copyWith(
                                              color: AppColor.green,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                        ),
                      )
                    ],
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
