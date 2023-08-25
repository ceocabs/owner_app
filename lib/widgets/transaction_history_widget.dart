import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../values/colors.dart';
import '../values/style.dart';


class TransactionHistoryWidget extends StatefulWidget {
  String cnrNumber;
  String carNo;
  String dateTime;
  String rideAmount;
  String availableBalance;

  TransactionHistoryWidget(
      {Key? key,
      required this.cnrNumber,
      required this.carNo,
      required this.dateTime,
      required this.rideAmount,
      required this.availableBalance})
      : super(key: key);

  @override
  State<TransactionHistoryWidget> createState() =>
      _TransactionHistoryWidgetState();
}

class _TransactionHistoryWidgetState extends State<TransactionHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 10.h,
      width: 295.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.greyColor.withOpacity(0.2),
      ),
      padding: EdgeInsets.only(
        left: 10.w,
        right: 5.w,
        bottom: 10.h,
        top: 10.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.add_circle,
                    color: AppColor.green,
                  ),
                  10.w.HBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CNR - ${widget.cnrNumber}",
                        style: textBold.copyWith(
                          fontSize: 14.sp,
                          color: AppColor.darkBlue,
                        ),
                      ),
                      2.h.VBox,
                      Text(
                        "${widget.carNo}",
                        style: textBold.copyWith(
                          fontSize: 12.sp,
                          color: AppColor.grey,
                        ),
                      ),
                      2.h.VBox,
                      Text(
                        "${widget.dateTime}",
                        style: textBold.copyWith(
                          fontSize: 12.sp,
                          color: AppColor.grey,
                        ),
                      ),
                      2.h.VBox,
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${widget.rideAmount}",
                        style: textBold.copyWith(
                          color: AppColor.green,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          10.h.VBox,
          Container(
            height: 1.w,
            color: AppColor.dark,
          ),
          10.h.VBox,
          Text(
            "Updated Balance ${widget.availableBalance}",
            style: textBold.copyWith(
              color: AppColor.green,
              fontSize: 15.sp,
            ),
          )
        ],
      ),
    );
  }
}
