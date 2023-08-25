import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';

class WithDrawHistoryPage extends StatefulWidget {
  const WithDrawHistoryPage({Key? key}) : super(key: key);

  @override
  State<WithDrawHistoryPage> createState() => _WithDrawHistoryPageState();
}

class _WithDrawHistoryPageState extends State<WithDrawHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.withdrawHistory,
          style: textBold.copyWith(fontSize: 20, color: Colors.white),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.h.VBox,
            Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: ExpandedTileList.builder(
                itemCount: 3,
                maxOpened: 1,
                reverse: true,
                itemBuilder: (context, index, controller) {
                  return ExpandedTile(
                    theme: const ExpandedTileThemeData(
                      headerColor: AppColor.greyColor,
                      headerSplashColor: Colors.grey,
                      contentBackgroundColor: Colors.white,
                      contentRadius: 10,
                    ),
                    controller: index == 2
                        ? controller.copyWith(isExpanded: true)
                        : controller,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Request Id - 12345678",
                          style: textRegular.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.dark),
                        ),
                        Text(
                          "8 Dec 2022 | ₹ 5200/-",
                          style: textBold.copyWith(
                              color: AppColor.darkBlue, fontSize: 12.sp),
                        ),
                        10.h.VBox,
                        Container(
                          height: 1.h,
                          color: AppColor.darkBlue,
                        ),
                        10.h.VBox,
                        Row(
                          children: [
                            Text(
                              StringConstant.statusTitle,
                              style: textBold,
                            ),
                            Text(
                              "Pending",
                              style: textBold.copyWith(color: AppColor.green),
                            ),
                          ],
                        )
                      ],
                    ),
                    content: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstant.transactionNo,
                                    style:
                                        textRegular.copyWith(fontSize: 11.sp),
                                  ),
                                  5.h.VBox,
                                  Text(
                                    "12368746",
                                    style: textRegular.copyWith(
                                        color: AppColor.darkBlue),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Amount",
                                    style:
                                        textRegular.copyWith(fontSize: 11.sp),
                                  ),
                                  5.h.VBox,
                                  Text(
                                    "12368746",
                                    style: textRegular.copyWith(
                                        color: AppColor.darkBlue),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstant.category,
                                    style:
                                        textRegular.copyWith(fontSize: 11.sp),
                                  ),
                                  5.h.VBox,
                                  Text(
                                    "12368746",
                                    style: textRegular.copyWith(
                                        color: AppColor.darkBlue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          10.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstant.ownerName,
                                    style:
                                        textRegular.copyWith(fontSize: 11.sp),
                                  ),
                                  5.h.VBox,
                                  Text(
                                    "Deep",
                                    style: textRegular.copyWith(
                                        color: AppColor.darkBlue),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstant.driverName,
                                    style:
                                        textRegular.copyWith(fontSize: 11.sp),
                                  ),
                                  5.h.VBox,
                                  Text(
                                    "Rajesh",
                                    style: textRegular.copyWith(
                                        color: AppColor.darkBlue),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstant.vehicleNo,
                                    style:
                                        textRegular.copyWith(fontSize: 11.sp),
                                  ),
                                  5.h.VBox,
                                  Text(
                                    "12368746",
                                    style: textRegular.copyWith(
                                        color: AppColor.darkBlue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          10.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstant.beforeAmounts,
                                    style:
                                        textRegular.copyWith(fontSize: 11.sp),
                                  ),
                                  5.h.VBox,
                                  Text(
                                    "100.00 Rs",
                                    style: textRegular.copyWith(
                                        color: AppColor.darkBlue),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstant.afterAmounts,
                                    style:
                                        textRegular.copyWith(fontSize: 11.sp),
                                  ),
                                  5.h.VBox,
                                  Text(
                                    "300.00 Rs",
                                    style: textRegular.copyWith(
                                        color: AppColor.darkBlue),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstant.requestTime,
                                    style:
                                        textRegular.copyWith(fontSize: 11.sp),
                                  ),
                                  5.h.VBox,
                                  Text(
                                    "12:10 Pm",
                                    style: textRegular.copyWith(
                                        color: AppColor.darkBlue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          10.h.VBox,
                          Container(
                            height: 1.w,
                            color: AppColor.dark,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                StringConstant.remarksTitle,
                                style: textBold.copyWith(fontSize: 14.sp),
                              ),
                              5.h.VBox,
                              Text(
                                "Pending",
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue, fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                    onLongTap: () {
                      debugPrint("looooooooooong tapped!!");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
