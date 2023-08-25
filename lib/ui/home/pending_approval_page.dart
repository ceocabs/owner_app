import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/style.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';

class PendingAppovalPage extends StatefulWidget {
  const PendingAppovalPage({Key? key}) : super(key: key);

  @override
  State<PendingAppovalPage> createState() => _PendingAppovalPageState();
}

class _PendingAppovalPageState extends State<PendingAppovalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              100.h.VBox,
              Image.asset(
                Res.pendingApproval,
                width: 100.w,
                height: 100.h,
              ),
              20.h.VBox,
              Container(
                width: 250.h,
                child: Text(
                  StringConstant.pendingApprovalTitle,
                  style: textBold.copyWith(
                    color: AppColor.white,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
