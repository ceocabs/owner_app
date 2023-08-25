import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/core/navigation/routes.dart';
import 'package:owner/res.dart';
import 'package:owner/values/colors.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/style.dart';
import 'package:owner/widgets/button_widget.dart';

import 'core/navigation/navigation_service.dart';

class DriverListDetailsPage extends StatefulWidget {
  const DriverListDetailsPage({Key? key}) : super(key: key);

  @override
  _DriverListDetailsPageState createState() => _DriverListDetailsPageState();
}

class _DriverListDetailsPageState extends State<DriverListDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          "Select Driver",
          style: textBold.copyWith(fontSize: 20, color: Colors.white),
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
        color: AppColor.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 20.h,
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    top: 15.h,
                    bottom: 15.h,
                    right: 20.w
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColor.white,
                    border: Border.all(
                      color: AppColor.greyColor,
                    ),
                  ),
                  width: 350.w,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Res.user,
                            height: 30.w,
                            width: 40.w,
                            fit: BoxFit.contain,
                          ),
                          20.w.HBox,
                          Text(
                            "Test User",
                            style: textBold,
                          ),
                        ],
                      ),
                      15.h.VBox,
                      AppButton(
                        "View",
                        () {
                          navigator.pushNamed(RouteName.driverEarningDetailsPage);
                        },
                        height: 35.h,
                        buttonColor: AppColor.green,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: 10,
        ),
      ),
    );
  }
}
