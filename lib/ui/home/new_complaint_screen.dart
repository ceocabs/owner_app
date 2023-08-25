import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../values/validations.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_form_filed.dart';

class NewComplaintScreen extends StatefulWidget {
  const NewComplaintScreen({Key? key}) : super(key: key);

  @override
  State<NewComplaintScreen> createState() => _NewComplaintScreenState();
}

class _NewComplaintScreenState extends State<NewComplaintScreen> {
  TextEditingController tokenNumberController = TextEditingController();
  TextEditingController utrNumberController = TextEditingController();
  TextEditingController dateAndTimeController = TextEditingController();
  TextEditingController relatedIssueController = TextEditingController();
  TextEditingController complaintMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.newComplaint,
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
                        left: 12.w,
                        right: 12.w,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.h.VBox,
                          Text(
                            StringConstant.tokenNo,
                            style: textRegular.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.tokenNo,
                            hint: StringConstant.tokenNo,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.number,
                            keyboardAction: TextInputAction.next,
                            controller: tokenNumberController,
                            maxLength: 20,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.relatedIssue,
                            style: textRegular.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.relatedIssue,
                            hint: StringConstant.relatedIssue,
                            controller: relatedIssueController,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardAction: TextInputAction.next,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.dateAndTime,
                            style: textRegular.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.dateAndTime,
                            hint: StringConstant.dateAndTime,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            controller: dateAndTimeController,
                            keyboardAction: TextInputAction.next,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.enterCrnNo,
                            style: textRegular.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.enterCrnNo,
                            hint: StringConstant.enterCrnNo,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.number,
                            keyboardAction: TextInputAction.next,
                            controller: utrNumberController,
                            maxLength: 20,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.complaintMessage,
                            style: textRegular.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.writeYourMessage,
                            hint: StringConstant.writeYourMessage,
                            controller: complaintMessageController,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardAction: TextInputAction.next,
                          ),
                          15.h.VBox,
                          AppButton(
                            StringConstant.submit,
                            () {},
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
