import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';

import '../core/navigation/navigation_service.dart';
import '../res.dart';
import '../values/colors.dart';
import '../values/string_contsant.dart';
import '../values/style.dart';

class OwnerDriverInfoWidget extends StatefulWidget {
  String? imageUrl;
  String? driverName;
  String? driverMobileNumber;
  String? status;
  String? balance;
  VoidCallback onTapView;
  VoidCallback onTapRemove;
  VoidCallback onTapAssignVehicle;

  OwnerDriverInfoWidget({
    Key? key,
    required this.imageUrl,
    required this.driverName,
    required this.driverMobileNumber,
    required this.status,
    required this.balance,
    required this.onTapAssignVehicle,
    required this.onTapRemove,
    required this.onTapView
  }) : super(key: key);

  @override
  State<OwnerDriverInfoWidget> createState() => _OwnerDriverInfoWidgetState();
}

class _OwnerDriverInfoWidgetState extends State<OwnerDriverInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            children: [
              10.h.VBox,
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.w),
                    child: Image.network(
                      widget.imageUrl.toString(),
                      width: 40.h,
                      height: 40.h,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          Res.user,
                          width: 40.h,
                          height: 40.h,
                        );
                      },
                    ),
                  ),
                  10.w.HBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.driverName.toString(),
                        style: textBold.copyWith(
                          color: AppColor.darkBlue,
                        ),
                      ),
                      Text(
                        "Number : +91 ${widget.driverMobileNumber}",
                        style: textBold.copyWith(
                          color: AppColor.darkBlue,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        StringConstant.statusTitle,
                        style: textBold,
                      ),
                      Text(
                        widget.status.toString(),
                        style: textBold.copyWith(color: AppColor.green),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstant.balanceTitle,
                        style: textBold,
                      ),
                      Text(
                        " Rs.",
                        style: textBold.copyWith(color: AppColor.green),
                      ),
                    ],
                  )
                ],
              ),
              10.h.VBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: widget.onTapView,
                    child: Container(
                      width: 80.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColor.darkBlue,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: Center(
                        child: Text(
                          StringConstant.view,
                          style: textBold.copyWith(color: AppColor.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: widget.onTapRemove,
                    child: Container(
                      width: 80.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColor.redColor,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: Center(
                        child: Text(
                          StringConstant.remove,
                          style: textBold.copyWith(color: AppColor.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: widget.onTapAssignVehicle,
                    child: Container(
                      width: 110.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColor.green,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: Center(
                        child: Text(
                          StringConstant.assignVehicle,
                          style: textBold.copyWith(color: AppColor.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              10.h.VBox,
            ],
          ),
        ),
      ),
    );
  }
}
