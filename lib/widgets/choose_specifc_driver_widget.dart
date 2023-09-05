import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/string_contsant.dart';
import '../res.dart';
import '../values/colors.dart';
import '../values/style.dart';

class ChooseSpecifcDriverWidget extends StatefulWidget {
  String driverName;
  String number;
  String profileImage;
  String approvalStatus;
  String balance;
  VoidCallback onTap;

  ChooseSpecifcDriverWidget(
      {Key? key,
      required this.driverName,
      required this.number,
      required this.profileImage,
      required this.approvalStatus,
      required this.onTap,
      required this.balance})
      : super(key: key);

  @override
  State<ChooseSpecifcDriverWidget> createState() =>
      _ChooseSpecifcDriverWidgetState();
}

class _ChooseSpecifcDriverWidgetState extends State<ChooseSpecifcDriverWidget> {
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
                  Image.network(
                    widget.profileImage,
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
                  10.w.HBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.driverName,
                        style: textBold.copyWith(
                          color: AppColor.darkBlue,
                        ),
                      ),
                      Text(
                        "Number : +91 ${widget.number}",
                        style: textBold.copyWith(
                          color: AppColor.darkBlue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                        widget.approvalStatus,
                        style: textBold.copyWith(color: AppColor.green),
                      ),
                    ],
                  ),
                  10.w.HBox,
                  Row(
                    children: [
                      Text(
                        StringConstant.balanceTitle,
                        style: textBold,
                      ),
                      Text(
                        "${widget.balance} Rs.",
                        style: textBold.copyWith(
                          color: AppColor.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              10.h.VBox,
              InkWell(
                onTap: widget.onTap,
                child: Container(
                  height: 35.h,
                  width: 300.w,
                  decoration: const BoxDecoration(
                    color: AppColor.green,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringConstant.view,
                        style: textMedium.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.h.VBox,
            ],
          ),
        ),
      ),
    );
  }
}
