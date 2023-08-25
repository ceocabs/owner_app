import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/string_contsant.dart';
import '../res.dart';
import '../values/colors.dart';
import '../values/style.dart';
import 'button_widget.dart';

class DriverListDetailsWidget extends StatefulWidget {
  String imageUrl;
  String driverName;

  DriverListDetailsWidget(
      {Key? key, required this.imageUrl, required this.driverName})
      : super(key: key);

  @override
  _DriverListDetailsWidgetState createState() =>
      _DriverListDetailsWidgetState();
}

class _DriverListDetailsWidgetState extends State<DriverListDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: 20.w,
          top: 15.h,
          bottom: 15.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: AppColor.white,
          border: Border.all(
            color: AppColor.greyColor,
          ),
        ),
        width: 350.w,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Res.user,
                  height: 30.w,
                  width: 40.w,
                  fit: BoxFit.contain,
                ),
                20.w.HBox,
                Text(
                  widget.driverName,
                  style: textBold,
                ),
              ],
            ),
            15.h.VBox,
            AppButton(
              StringConstant.view,
              () {},
              height: 35.h,
              buttonColor: AppColor.green,
            )
          ],
        ),
      ),
    );
  }
}
