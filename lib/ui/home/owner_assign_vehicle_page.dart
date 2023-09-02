import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/widgets/button_widget.dart';

import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';

class OwnerAssignVehiclePage extends StatefulWidget {
  const OwnerAssignVehiclePage({Key? key}) : super(key: key);

  @override
  State<OwnerAssignVehiclePage> createState() => _OwnerAssignVehiclePageState();
}

class _OwnerAssignVehiclePageState extends State<OwnerAssignVehiclePage> {
  bool isAssignVehicle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
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
        centerTitle: true,
        title: Text(
          StringConstant.vehicleAssignTitle,
          style: textBold.copyWith(
            color: AppColor.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        color: AppColor.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    /*  isApproved = true;
                    vehicleStatus(
                        status: "approved", ownerId: userId, context: context);
                    setState(() {});*/
                    isAssignVehicle = true;
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    padding: EdgeInsets.all(10.w),
                    child: Center(
                      child: Text(
                        StringConstant.assignVehicleTitle,
                        style: isAssignVehicle
                            ? textBold.copyWith(color: AppColor.red)
                            : textBold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    /* isApproved = false;
                    vehicleStatus(
                        status: "rejected", ownerId: userId, context: context);*/
                    isAssignVehicle = false;
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    padding: EdgeInsets.all(10.w),
                    child: Center(
                      child: Text(
                        StringConstant.unAssignVehicleTitle,
                        style: isAssignVehicle == false
                            ? textBold.copyWith(color: AppColor.red)
                            : textBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1.h,
              color: AppColor.darkBlue.withOpacity(0.6),
            ),
            Expanded(
              child: /*vehicleStatusModelList.length == 0
                  ? Container(
                child: Center(
                  child: Text(
                    StringConstant.dataNotFound,
                    style: textBold,
                  ),
                ),
              )
                  :*/
                  ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.w),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: 130.h,
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, top: 10.h),
                          decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50.w),
                                    child: Container(
                                      child: Image.asset(
                                        Res.car1,
                                        height: 50.h,
                                        width: 60.w,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  20.w.HBox,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "MH 01 FG 7896",
                                        style: textBold.copyWith(
                                          color: AppColor.red,
                                        ),
                                      ),
                                      Text(
                                        "Brand Name : TATA",
                                        style: textMedium.copyWith(
                                          color: AppColor.black,
                                        ),
                                      ),
                                      Text(
                                        "Car Type : MINI",
                                        style: textMedium.copyWith(
                                          color: AppColor.black,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              15.h.VBox,
                              AppButton(
                                isAssignVehicle
                                    ? StringConstant.remove
                                    : StringConstant.assign,
                                () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    headerAnimationLoop: true,
                                    animType: AnimType.topSlide,
                                    showCloseIcon: false,
                                    title: isAssignVehicle
                                        ? StringConstant.remove
                                        : StringConstant.assign,
                                    desc: isAssignVehicle
                                        ? StringConstant.assignVehicleConfirmation
                                        : StringConstant.removeAssignVehicleConfirmation,

                                    descTextStyle: textBold.copyWith(
                                      fontSize: 20.sp,
                                      color: AppColor.dark,
                                    ),
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {},
                                  ).show();
                                },
                                height: 35.h,
                                buttonColor: isAssignVehicle
                                    ? AppColor.red
                                    : AppColor.green,
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
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
