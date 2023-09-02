import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';

import '../values/colors.dart';
import '../values/string_contsant.dart';
import '../values/style.dart';

class ExpandableHistoryWidget extends StatefulWidget {
  String? transactionNo;
  String? amount;
  String? category;
  String? ownerName;
  String? driverName;
  String? vehicleNo;
  String? beforeAmountPrice;
  String? afterAmountPrice;
  String? requestTime;

  ExpandableHistoryWidget(
      {Key? key,
      required this.transactionNo,
      required this.category,
      required this.amount,
      required this.ownerName,
      required this.driverName,
      required this.vehicleNo,
      required this.beforeAmountPrice,
      required this.afterAmountPrice,
      required this.requestTime})
      : super(key: key);

  @override
  State<ExpandableHistoryWidget> createState() =>
      _ExpandableHistoryWidgetState();
}

class _ExpandableHistoryWidgetState extends State<ExpandableHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.transactionNo,
                    style: textRegular.copyWith(fontSize: 11.sp),
                  ),
                  5.h.VBox,
                  Container(
                    width: 90.w,
                    child: Text(
                      widget.transactionNo.toString(),
                      style: textBold.copyWith(
                          color: AppColor.darkBlue, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.amount,
                    style: textRegular.copyWith(fontSize: 11.sp),
                  ),
                  5.h.VBox,
                  Container(
                    width: 90.w,
                    child: Text(
                      widget.amount.toString() + " Rs.",
                      style: textBold.copyWith(
                          color: AppColor.darkBlue, fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.category,
                    style: textRegular.copyWith(fontSize: 11.sp),
                  ),
                  5.h.VBox,
                  Container(
                    width: 90.w,
                    child: Text(
                      widget.category.toString(),
                      style: textBold.copyWith(
                          color: AppColor.darkBlue, fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          10.h.VBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.ownerName,
                    style: textRegular.copyWith(fontSize: 11.sp),
                  ),
                  5.h.VBox,
                  Container(
                    width: 90.w,
                    child: Text(
                      widget.ownerName.toString(),
                      style: textBold.copyWith(
                          color: AppColor.darkBlue, fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.driverName,
                    style: textRegular.copyWith(fontSize: 11.sp),
                  ),
                  5.h.VBox,
                  Container(
                    width: 90.w,
                    child: Text(
                      widget.driverName.toString(),
                      style: textBold.copyWith(
                          color: AppColor.darkBlue, fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.vehicleNo,
                    style: textRegular.copyWith(fontSize: 11.sp),
                  ),
                  5.h.VBox,
                  Container(
                    width: 90.w,
                    child: Text(
                      widget.vehicleNo.toString(),
                      style: textBold.copyWith(
                          color: AppColor.darkBlue, fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          10.h.VBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.beforeAmount,
                    style: textRegular.copyWith(
                      fontSize: 11.sp,
                    ),
                  ),
                  5.h.VBox,
                  Container(
                    width: 80.w,
                    child: Text(
                      "${widget.beforeAmountPrice} Rs",
                      style: textBold.copyWith(
                          color: AppColor.darkBlue, fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.afterAmount,
                    style: textRegular.copyWith(
                      fontSize: 11.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  5.h.VBox,
                  Container(
                    width: 80.w,
                    child: Text(
                      "${widget.beforeAmountPrice} Rs",
                      style: textBold.copyWith(
                          color: AppColor.darkBlue, fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.requestTime,
                    style: textRegular.copyWith(
                      fontSize: 11.sp,
                    ),
                  ),
                  5.h.VBox,
                  Container(
                    width: 120.w,
                    child: Text(
                      widget.requestTime.toString(),
                      style: textBold.copyWith(
                        color: AppColor.darkBlue,
                        fontSize: 12.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          10.h.VBox,
          Container(
            height: 1.w,
            color: AppColor.dark,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                StringConstant.remarksTitle,
                style: textBold.copyWith(fontSize: 14.sp),
              ),
              5.h.VBox,
              Text(
                "Approved",
                style: textRegular.copyWith(
                  color: AppColor.darkBlue,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                StringConstant.utrTitle,
                style: textBold.copyWith(fontSize: 14.sp),
              ),
              5.h.VBox,
              Text(
                "123456987963",
                style: textRegular.copyWith(
                  color: AppColor.darkBlue,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
