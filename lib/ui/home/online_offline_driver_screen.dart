import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';

class OnlineOfflineDriverScreen extends StatefulWidget {
  const OnlineOfflineDriverScreen({Key? key}) : super(key: key);

  @override
  State<OnlineOfflineDriverScreen> createState() =>
      _OnlineOfflineDriverScreenState();
}

class _OnlineOfflineDriverScreenState extends State<OnlineOfflineDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.topUp,
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
            GestureDetector(
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColor.white,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                bottom: 10.h,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.w),
                child: Card(
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      bottom: 10.h,
                      top: 10.h,
                      right: 20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          Res.user,
                          width: 50.w,
                          height: 50.h,
                        ),
                        20.w.HBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.h.VBox,
                            Text(
                              "ABC XYZ",
                              style: textBold.copyWith(color: AppColor.red),
                            ),
                            Text(
                              "MH 17 FG 7895",
                              style: textMedium.copyWith(fontSize: 14.sp),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Vehic"
                                  "le Type : Mini",
                                  style: textMedium.copyWith(fontSize: 14.sp),
                                ),
                              ],
                            ),
                            5.h.VBox,
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
        ),
      ),
    );
  }
}
