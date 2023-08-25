import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/export.dart';
import 'package:owner/values/style.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../../res.dart';
import '../../values/colors.dart';

class SuccessfullyRegisterPage extends StatefulWidget {
  const SuccessfullyRegisterPage({Key? key}) : super(key: key);

  @override
  _SuccessfullyRegisterPageState createState() =>
      _SuccessfullyRegisterPageState();
}

class _SuccessfullyRegisterPageState extends State<SuccessfullyRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.darkBlue,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.h.VBox,
            Image.asset(
              Res.accountSuccessfully,
              width: 100.w,
              height: 100.h,
            ),
            20.h.VBox,
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              child: Text(
                "Your Documents And Profile Details Has Been Submitted Successfully. \n Please Wait for Admin Approval.\n If You have Any Query Call on Toll Free Number,",
                style: textBold.copyWith(
                  color: AppColor.white,
                  fontSize: 20.sp,
                ),
              ),
            ),
            10.h.VBox,
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              child: InkWell(
                onTap: () {
                  UrlLauncher.launch("tel://9039030010");
                },
                child: Text(
                  "+91 903 903 0010",
                  style: textBold.copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: 20.sp,
                    color: AppColor.white,
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
