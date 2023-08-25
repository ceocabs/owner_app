import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../res.dart';
import '../../../values/colors.dart';
import '../../../values/string_contsant.dart';
import '../../../values/style.dart';

class ProtocolOPage extends StatefulWidget {
  const ProtocolOPage({Key? key}) : super(key: key);

  @override
  State<ProtocolOPage> createState() => _ProtocolOPageState();
}

class _ProtocolOPageState extends State<ProtocolOPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.instructions,
          style: textBold.copyWith(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
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
        color: Colors.white,
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
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  elevation: 2,
                  child: Container(
                    width: 320.w,
                    padding: EdgeInsets.only(left: 14.w, right: 14.w),
                    color: AppColor.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        28.h.VBox,
                        Image.asset(
                          Res.protocol,
                          height: 229.h,
                          width: 288.w,
                        ),
                        20.h.VBox,
                        Text(
                          StringConstant.covid19Precausion,
                          style: textBold.copyWith(
                            fontSize: 16.sp,
                            color: AppColor.black,
                          ),
                        ),
                        19.h.VBox,
                        Container(
                          padding: EdgeInsets.only(
                              top: 11.h, bottom: 11.h, left: 10.w),
                          decoration: BoxDecoration(
                            color: AppColor.lightGray,
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        Res.points,
                                        width: 10.w,
                                        height: 10.w,
                                      ),
                                      5.w.HBox,
                                      Text(
                                        StringConstant.customerVaccination,
                                        style:
                                            textBold.copyWith(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Opacity(
                                        opacity: 0,
                                        child: Image.asset(
                                          Res.points,
                                          width: 10.w,
                                          height: 10.w,
                                        ),
                                      ),
                                      5.w.HBox,
                                      Text(
                                        StringConstant
                                            .customerVaccinationSubText,
                                        style: textRegular.copyWith(
                                            fontSize: 11.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              40.w.HBox,
                              const Icon(
                                Icons.check_circle_rounded,
                                color: AppColor.green,
                              ),
                            ],
                          ),
                        ),
                        11.h.VBox,
                        Container(
                          padding: EdgeInsets.only(
                            top: 11.h,
                            bottom: 11.h,
                            left: 10.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.lightGray,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        Res.points,
                                        width: 10.w,
                                        height: 10.w,
                                      ),
                                      5.w.HBox,
                                      Text(
                                        StringConstant.customerSanitization,
                                        style:
                                            textBold.copyWith(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Opacity(
                                        opacity: 0,
                                        child: Image.asset(
                                          Res.points,
                                          width: 10.w,
                                          height: 10.w,
                                        ),
                                      ),
                                      5.w.HBox,
                                      Text(
                                        StringConstant
                                            .customerSanitizationSubText,
                                        style: textRegular.copyWith(
                                            fontSize: 11.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              40.w.HBox,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
