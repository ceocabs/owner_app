import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';

class DriverTransactionHistoryPage extends StatefulWidget {
  const DriverTransactionHistoryPage({Key? key}) : super(key: key);

  @override
  State<DriverTransactionHistoryPage> createState() =>
      _DriverTransactionHistoryPageState();
}

class _DriverTransactionHistoryPageState
    extends State<DriverTransactionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.transactionHistory,
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

      ),
    );
  }
}
