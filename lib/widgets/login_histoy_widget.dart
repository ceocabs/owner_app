import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';

import '../values/colors.dart';
import '../values/string_contsant.dart';
import '../values/style.dart';

class LoginHistoryWidget extends StatefulWidget {
  LoginHistoryWidget(
      {Key? key,
      required this.loginTime,
      required this.logoutTime,
      required this.timeDifferance})
      : super(key: key);

  String loginTime;
  String logoutTime;
  String timeDifferance;

  @override
  State<LoginHistoryWidget> createState() => _LoginHistoryWidgetState();
}

class _LoginHistoryWidgetState extends State<LoginHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 290.w,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: AppColor.greyColor.withOpacity(0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstant.login,
                style: textRegular.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: AppColor.dark,
                ),
              ),
              2.h.VBox,
              Text(
                widget.loginTime,
                style: textRegular.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: AppColor.dark,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstant.logout,
                style: textRegular.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: AppColor.dark,
                ),
              ),
              2.h.VBox,
              Text(
                widget.logoutTime,
                style: textRegular.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: AppColor.dark,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.timeDifferance,
                style: textRegular.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: AppColor.dark,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
