
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

import '../../../core/navigation/navigation_service.dart';
import '../../../res.dart';
import '../../../values/string_contsant.dart';
import '../../../values/style.dart';
import '../../core/navigation/routes.dart';
import '../../values/colors.dart';
import '../../widgets/button_widget.dart';

class ReferPage extends StatefulWidget {
  const ReferPage({Key? key}) : super(key: key);

  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.refer,
          style: textBold.copyWith(fontSize: 20, color: Colors.white),
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
            //  height: 520.h,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 17.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        20.h.VBox,
                        Image.asset(
                          Res.refer,
                          height: 250.h,
                        ),
                        20.h.VBox,
                        Text(
                          "GIVE Rs.50, GET Rs.500",
                          style: textBold,
                        ),
                        5.h.VBox,
                        Text(
                          "You can refer 100 friends and can earn upto Rs 5000 discount.",
                          style: textRegular.copyWith(
                              color: AppColor.darkBlue.withOpacity(0.6),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        20.h.VBox,
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "See how it works",
                            style: textBold.copyWith(color: AppColor.red),
                          ),
                        ),
                        //5.h.VBox,
                        InkWell(
                          onTap: () {
                           // navigator.pushNamed(RouteName.referHistoryPage);
                          },
                          child: Text(
                            "See Your history",
                            style: textBold.copyWith(color: AppColor.green),
                          ),
                        ),
                        20.h.VBox,
                        DottedBorder(
                          dashPattern: const [4, 6],
                          strokeWidth: 2,
                          color: AppColor.darkBlue,
                          padding: const EdgeInsets.all(8),
                          borderPadding: const EdgeInsets.all(4),
                          child: Container(
                            height: 25.h,
                            width: 200.w,
                            color: AppColor.white.withOpacity(0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Your code: CEOMOCC",
                                  style: textBold.copyWith(
                                    fontSize: 16.sp,
                                    color: AppColor.darkBlue,
                                  ),
                                ),
                                10.w.HBox,
                                Image.asset(
                                  Res.copy,
                                  height: 20.h,
                                  width: 20.w,
                                )
                              ],
                            ),
                          ),
                        ),
                        20.h.VBox,
                         AppButton(StringConstant.referNow, () { },height: 41.h),
                        20.h.VBox
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
