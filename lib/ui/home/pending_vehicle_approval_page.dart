import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/colors.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../../res.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';

class PendingVehicleApprovalPage extends StatefulWidget {
  const PendingVehicleApprovalPage({Key? key}) : super(key: key);

  @override
  State<PendingVehicleApprovalPage> createState() =>
      _PendingVehicleApprovalPageState();
}

class _PendingVehicleApprovalPageState
    extends State<PendingVehicleApprovalPage> {
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
                  StringConstant.pendingVehicleApprovalTitle,
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
