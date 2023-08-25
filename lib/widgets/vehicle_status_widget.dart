import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';
import '../values/style.dart';

class VehicleStatusWidget extends StatefulWidget {
  String vehicleNo;
  String status;
  VoidCallback onPressed;

  VehicleStatusWidget(
      {Key? key,
      required this.vehicleNo,
      required this.status,
      required this.onPressed})
      : super(key: key);

  @override
  State<VehicleStatusWidget> createState() => _VehicleStatusWidgetState();
}

class _VehicleStatusWidgetState extends State<VehicleStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColor.accentColor,
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.vehicleNo,
              style: textBold.copyWith(
                color: AppColor.black,
              ),
            ),
            Text(
              widget.status,
              style: textBold.copyWith(
                color: AppColor.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
