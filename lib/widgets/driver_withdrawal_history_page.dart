import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/widgets/expandable_history_widget.dart';
import '../core/navigation/navigation_service.dart';
import '../res.dart';
import '../values/colors.dart';
import '../values/string_contsant.dart';
import '../values/style.dart';

class DriverWithdrawalHistoryPage extends StatefulWidget {
  const DriverWithdrawalHistoryPage({Key? key}) : super(key: key);

  @override
  State<DriverWithdrawalHistoryPage> createState() =>
      _DriverWithdrawalHistoryPageState();
}

class _DriverWithdrawalHistoryPageState
    extends State<DriverWithdrawalHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.withdrawHistory,
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
        color: AppColor.white,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.88,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 10.h,
                    ),
                    child: ExpandedTileList.builder(
                      itemCount: 10,
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
                                "Request Id - 0123456789",
                                style: textRegular.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.dark),
                              ),
                              Text(
                                "25/03/2023 | ₹ 250/-",
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
                                    "Approved",
                                    style: textBold.copyWith(
                                        color: AppColor.green),
                                  ),
                                ],
                              )
                            ],
                          ),
                          content: ExpandableHistoryWidget(
                            transactionNo: "1234567890",
                            amount: "20.00",
                            category: "Withdrawal",
                            ownerName: "Test User",
                            driverName: "Driver Name",
                            vehicleNo: "MH 02 RT 7852",
                            beforeAmountPrice: "500.00",
                            afterAmountPrice: "300.00",
                            requestTime: "23/08/2023",
                          ),
                          onTap: () {},
                          onLongTap: () {},
                        );
                      },
                    ),
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

/*Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstant.transactionNo,
                                          style: textRegular.copyWith(
                                              fontSize: 11.sp),
                                        ),
                                        5.h.VBox,
                                        Container(
                                          width: 90.w,
                                          child: Text(
                                            "1234569877",
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue,
                                                fontSize: 12.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstant.amount,
                                          style: textRegular.copyWith(
                                              fontSize: 11.sp),
                                        ),
                                        5.h.VBox,
                                        Container(
                                          width: 90.w,
                                          child: Text(
                                            "20.00" + " Rs.",
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue,
                                                fontSize: 12.sp),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstant.category,
                                          style: textRegular.copyWith(
                                              fontSize: 11.sp),
                                        ),
                                        5.h.VBox,
                                        Container(
                                          width: 90.w,
                                          child: Text(
                                            "Withdrawal",
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue,
                                                fontSize: 12.sp),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                10.h.VBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstant.ownerName,
                                          style: textRegular.copyWith(
                                              fontSize: 11.sp),
                                        ),
                                        5.h.VBox,
                                        Container(
                                          width: 90.w,
                                          child: Text(
                                            "Test User",
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue,
                                                fontSize: 12.sp),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstant.driverName,
                                          style: textRegular.copyWith(
                                              fontSize: 11.sp),
                                        ),
                                        5.h.VBox,
                                        Container(
                                          width: 90.w,
                                          child: Text(
                                            "Driver",
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue,
                                                fontSize: 12.sp),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstant.vehicleNo,
                                          style: textRegular.copyWith(
                                              fontSize: 11.sp),
                                        ),
                                        5.h.VBox,
                                        Container(
                                          width: 90.w,
                                          child: Text(
                                            "MH 02 RT 7896",
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue,
                                                fontSize: 12.sp),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                10.h.VBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstant.beforeAmount,
                                          style: textRegular.copyWith(
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                        5.h.VBox,
                                        Container(
                                          width: 80.w,
                                          child: Text(
                                            "500 Rs",
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue,
                                                fontSize: 12.sp),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstant.afterAmount,
                                          style: textRegular.copyWith(
                                            fontSize: 11.sp,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        5.h.VBox,
                                        Container(
                                          width: 80.w,
                                          child: Text(
                                            "560 Rs",
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue,
                                                fontSize: 12.sp),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstant.requestTime,
                                          style: textRegular.copyWith(
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                        5.h.VBox,
                                        Container(
                                          width: 120.w,
                                          child: Text(
                                            "23/05/2023",
                                            style: textBold.copyWith(
                                              color: AppColor.darkBlue,
                                              fontSize: 12.sp,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                                      "Approved",
                                      style: textRegular.copyWith(
                                        color: AppColor.darkBlue,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      StringConstant.utrTitle,
                                      style: textBold.copyWith(fontSize: 14.sp),
                                    ),
                                    5.h.VBox,
                                    Text(
                                      "123456987963",
                                      style: textRegular.copyWith(
                                        color: AppColor.darkBlue,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),*/
