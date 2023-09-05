import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';

import '../values/colors.dart';
import '../values/string_contsant.dart';
import '../values/style.dart';

class ComplaintHistoryWidget extends StatefulWidget {
  VoidCallback callback;
  String tokenNo;
  String crnNumber;
  String dateAndTime;
  String repliedDate;
  String status;
  String id;

  ComplaintHistoryWidget(
      {Key? key,
      required this.callback,
      required this.tokenNo,
      required this.dateAndTime,
      required this.crnNumber,
      required this.repliedDate,
      required this.status,
      required this.id})
      : super(key: key);

  @override
  State<ComplaintHistoryWidget> createState() => _ComplaintHistoryWidgetState();
}

class _ComplaintHistoryWidgetState extends State<ComplaintHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
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
                  "Token No : ${widget.tokenNo}",
                  style: textBold.copyWith(
                    color: AppColor.darkBlue,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  widget.dateAndTime,
                  style: textBold.copyWith(
                    fontSize: 11.sp,
                    color: AppColor.dark,
                  ),
                )
              ],
            ),
          ),
          3.h.VBox,
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                right: 12.w,
              ),
              child: Text(
                "CRN NO : ${widget.crnNumber}",
                style: textRegular.copyWith(
                  color: AppColor.dark,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
          15.h.VBox,
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                right: 12.w,
              ),
              child: Text(
                StringConstant.bookingReleatedIssues,
                style: textRegular.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    StringConstant.repliedOn,
                    style: textRegular.copyWith(
                        fontSize: 12.sp, color: AppColor.dark),
                  ),
                  5.h.VBox,
                  Text(
                    widget.repliedDate,
                    style: textBold.copyWith(
                        fontSize: 14.sp, color: AppColor.dark),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.statusTitle1,
                    style: textRegular.copyWith(
                        fontSize: 12.sp, color: AppColor.dark),
                  ),
                  5.h.VBox,
                  Text(
                    widget.status,
                    style: textBold.copyWith(
                        fontSize: 14.sp, color: AppColor.dark),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.contactId,
                    style: textRegular.copyWith(
                        fontSize: 12.sp, color: AppColor.dark),
                  ),
                  5.h.VBox,
                  Text(
                    widget.id,
                    style: textBold.copyWith(
                        fontSize: 14.sp, color: AppColor.dark),
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
                child: InkWell(
                  onTap: widget.callback,
                  child: Text(
                    "See Progress",
                    style: textBold.copyWith(
                      fontSize: 12.sp,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
