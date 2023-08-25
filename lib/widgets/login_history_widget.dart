import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../values/colors.dart';
import '../values/string_contsant.dart';
import '../values/style.dart';

class LoginHistoryWidget extends StatefulWidget {
  String carNumber;
  String date;
  String runningKm;
  String loginHour;
  String totalTrip;
  String totalEarning;

  LoginHistoryWidget(
      {Key? key,
      required this.carNumber,
      required this.date,
      required this.runningKm,
      required this.loginHour,
      required this.totalTrip,
      required this.totalEarning})
      : super(key: key);

  @override
  State<LoginHistoryWidget> createState() => _LoginHistoryWidgetState();
}

class _LoginHistoryWidgetState extends State<LoginHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.transparent,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Container(
          height: 120.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 12.w,
                  right: 12.w,
                  top: 11.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.carNumber,
                      style: textBold.copyWith(
                        color: AppColor.darkBlue,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      widget.date,
                      style: textBold.copyWith(
                        fontSize: 11.sp,
                        color: AppColor.greyColor,
                      ),
                    )
                  ],
                ),
              ),
              11.h.VBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        StringConstant.runningKm,
                        style: textRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColor.greyColor,
                        ),
                      ),
                      5.h.VBox,
                      Text(
                        "${widget.runningKm} Kms",
                        style: textBold.copyWith(
                          fontSize: 14.sp,
                          color: AppColor.dark,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        StringConstant.totalLoginHr,
                        style: textRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColor.greyColor,
                        ),
                      ),
                      5.h.VBox,
                      Text(
                        "${widget.loginHour} Hours",
                        style: textBold.copyWith(
                          fontSize: 14.sp,
                          color: AppColor.dark,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        StringConstant.totalTrips,
                        style: textRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColor.greyColor,
                        ),
                      ),
                      5.h.VBox,
                      Text(
                        "${widget.totalTrip}",
                        style: textBold.copyWith(
                          fontSize: 14.sp,
                          color: AppColor.dark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              12.h.VBox,
              Container(
                height: 39.5.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColor.green,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Text(
                      "Trips Amount  ₹ ${widget.totalEarning}",
                      style: textBold.copyWith(
                        fontSize: 12.sp,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
