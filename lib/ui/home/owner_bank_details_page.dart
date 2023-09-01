import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';

import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';

class OwnerBankDetails extends StatefulWidget {
  const OwnerBankDetails({Key? key}) : super(key: key);

  @override
  State<OwnerBankDetails> createState() => _OwnerBankDetailsState();
}

class _OwnerBankDetailsState extends State<OwnerBankDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.bankDetails,
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
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColor.white,
        child: Column(
          children: [
            20.h.VBox,
            Container(
              width: 450.w,
              height: 250.h,
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                elevation: 10,
                child: Padding(
                  padding:  EdgeInsets.only(left: 10.w,right: 10.w,top: 20.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Owner Name : ",
                            style: textBold,
                          ),
                          Text(
                            " Test User",
                            style: textBold.copyWith(color: AppColor.darkBlue),
                          ),
                        ],
                      ),
                      10.h.VBox,
                      Row(
                        children: [
                          Text(
                            "Owner Mobile No : ",
                            style: textBold,
                          ),
                          Text(
                            "+91 8888888888",
                            style: textBold.copyWith(color: AppColor.darkBlue),
                          ),
                        ],
                      ),
                      10.h.VBox,
                      Row(
                        children: [
                          Text(
                            "Bank Holder Name : ",
                            style: textBold,
                          ),
                          Text(
                            "SANDEEP SINGH",
                            style: textBold.copyWith(color: AppColor.darkBlue),
                          ),
                        ],
                      ),
                      10.h.VBox,
                      Row(
                        children: [
                          Text(
                            "Bank Holder Mobile No : ",
                            style: textBold,
                          ),
                          Text(
                            "+91 8765434563",
                            style: textBold.copyWith(color: AppColor.darkBlue),
                          ),
                        ],
                      ),
                      10.h.VBox,
                      Row(
                        children: [
                          Text(
                            "Account No : ",
                            style: textBold,
                          ),
                          Text(
                            "87654345678765432345",
                            style: textBold.copyWith(color: AppColor.darkBlue),
                          ),
                        ],
                      ),
                      10.h.VBox,
                      Row(
                        children: [
                          Text(
                            "IFSC Code : ",
                            style: textBold,
                          ),
                          Text(
                            "SVCB0000464",
                            style: textBold.copyWith(color: AppColor.darkBlue),
                          ),
                        ],
                      ),
                      10.h.VBox,
                      Row(
                        children: [
                          Text(
                            "Account Type : ",
                            style: textBold,
                          ),
                          Text(
                            "Saving",
                            style: textBold.copyWith(color: AppColor.darkBlue),
                          ),
                        ],
                      ),
                      10.h.VBox,
                    ],
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
