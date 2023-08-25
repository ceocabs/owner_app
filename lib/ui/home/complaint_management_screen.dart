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

class ComplaintManagementScreen extends StatefulWidget {
  const ComplaintManagementScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintManagementScreen> createState() =>
      _ComplaintManagementScreenState();
}

class _ComplaintManagementScreenState extends State<ComplaintManagementScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.complaintManagement,
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
              height: 520.h,
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
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 10,
                  child: Column(
                    children: [
                      25.h.VBox,
                      Image.asset(
                        Res.complaintFrontImage,
                        height: 215.h,
                        width: 320.h,
                      ),
                      33.h.VBox,
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                        ),
                        child: AppButton(
                          StringConstant.newComplaint,
                          () {
                            navigator.pushNamed(RouteName.newComplaintScreen);
                          },
                          height: 41.h,
                          labelColor: AppColor.white,
                          buttonColor: AppColor.green,
                        ),
                      ),
                      14.h.VBox,
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                        ),
                        child: AppButton(
                          StringConstant.complaintHistory,
                          () {
                            navigator.pushNamed(
                                RouteName.complaintHistoryDetailsPage);
                          },
                          buttonColor: AppColor.darkBlue,
                          labelColor: AppColor.white,
                          height: 41.h,
                        ),
                      ),
                      30.h.VBox
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
