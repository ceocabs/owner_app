import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_form_filed.dart';

class WithdrawalRequestPage extends StatefulWidget {
  const WithdrawalRequestPage({Key? key}) : super(key: key);

  @override
  State<WithdrawalRequestPage> createState() => _WithdrawalRequestPageState();
}

class _WithdrawalRequestPageState extends State<WithdrawalRequestPage> {
  bool? isAcceptTerms = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.registration,
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
              height: 520.h,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.h.VBox,
                          Center(
                            child: Container(
                              width: 57.w,
                              height: 57.h,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(Res.user),
                            ),
                          ),
                          Text(
                            "Aman Patil",
                            style: textBold.copyWith(
                                fontSize: 14.sp, color: AppColor.darkBlue),
                          ),
                          12.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Driver : Amol Patil",
                                style: textRegular.copyWith(
                                  fontSize: 11.sp,
                                ),
                              ),
                              Text(
                                "Owner : Rohan Kadam",
                                style: textRegular.copyWith(
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                          5.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Driver Id : 56464",
                                style: textRegular.copyWith(
                                  fontSize: 11.sp,
                                ),
                              ),
                              Text(
                                "Owner Id : 96854",
                                style: textRegular.copyWith(
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                          5.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "+91 9874563210",
                                style: textRegular.copyWith(
                                  fontSize: 11.sp,
                                ),
                              ),
                              Text(
                                "+91 9123456789",
                                style: textRegular.copyWith(
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                          12.h.VBox,
                          Container(
                            height: 33.h,
                            width: 291.w,
                            decoration: BoxDecoration(
                                color: AppColor.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Available Balance : ₹15025.00",
                                style: textBold.copyWith(
                                    fontSize: 12.sp, color: AppColor.white),
                              ),
                            ),
                          ),
                          14.h.VBox,
                          Container(
                            height: 33.h,
                            width: 291.w,
                            decoration: BoxDecoration(
                              color: AppColor.greyColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            child: Center(
                              child: Text(
                                StringConstant.enterRequestedAmount,
                                style: textBold.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColor.dark,
                                ),
                              ),
                            ),
                          ),
                          3.h.VBox,
                          Text(
                            StringConstant.depositNote,
                            style: textRegular.copyWith(
                              fontSize: 9.sp,
                              color: AppColor.red,
                            ),
                          ),
                          13.h.VBox,
                          Text(
                            StringConstant.accountHolderName,
                            style: textRegular.copyWith(
                              fontSize: 12.sp,
                              color: AppColor.dark,
                            ),
                          ),
                          6.h.VBox,
                          AppTextField(
                            label: StringConstant.accountHolderName,
                            hint: StringConstant.accountHolderName,
                          ),
                          14.h.VBox,
                          Text(
                            StringConstant.accountNo,
                            style: textRegular.copyWith(
                              fontSize: 12.sp,
                              color: AppColor.dark,
                            ),
                          ),
                          6.h.VBox,
                          AppTextField(
                              label: StringConstant.accountNo,
                              hint: StringConstant.accountNo),
                          14.h.VBox,
                          Text(
                            StringConstant.ifscCode,
                            style: textRegular.copyWith(
                                fontSize: 12.sp, color: AppColor.dark),
                          ),
                          6.h.VBox,
                          AppTextField(
                            label: StringConstant.ifscCode,
                            hint: StringConstant.ifscCode,
                          ),
                          14.h.VBox,
                          Text(
                            StringConstant.accountType,
                            style: textRegular.copyWith(
                              fontSize: 12.sp,
                              color: AppColor.dark,
                            ),
                          ),
                          6.h.VBox,
                          AppTextField(
                            label: StringConstant.accountType,
                            hint: StringConstant.accountType,
                          ),
                          15.h.VBox,
                          Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                                height: 16.h,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.blue,
                                  value: this.isAcceptTerms,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.isAcceptTerms = value;
                                    });
                                  },
                                ),
                              ),
                              10.w.HBox,
                              Container(
                                width: 200.w,
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text: StringConstant.iAgree,
                                    style: textRegular.copyWith(
                                        fontSize: 12.sp, color: AppColor.grey),
                                    children: [
                                      TextSpan(
                                        text: StringConstant.termsAndCondition,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                        style: textRegular.copyWith(
                                          color: AppColor.darkBlue,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          10.h.VBox,
                          AppButton(
                            StringConstant.requestForWithdrawal,
                            () {},
                            height: 41.h,
                            buttonColor: AppColor.darkBlue,
                            labelColor: AppColor.white,
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
