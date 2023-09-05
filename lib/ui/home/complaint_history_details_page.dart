import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/complaint_history_widget.dart';

class ComplaintHistoryDetailsPage extends StatefulWidget {
  const ComplaintHistoryDetailsPage({Key? key}) : super(key: key);

  @override
  State<ComplaintHistoryDetailsPage> createState() =>
      _ComplaintHistoryDetailsPageState();
}

class _ComplaintHistoryDetailsPageState
    extends State<ComplaintHistoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.complaintHistory,
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
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 17.w),
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            elevation: 5,
                            child: ComplaintHistoryWidget(
                              callback: () {
                                navigator.pushNamed(RouteName.messageScreen);
                              },
                              crnNumber: "546547",
                              dateAndTime: "12/08/2023 06:50 PM",
                              repliedDate: "23 Dec 2023",
                              status: "Open",
                              id: "CEO42",
                              tokenNo: "4569",
                            ),
                          ),
                        );
                      },
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
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
