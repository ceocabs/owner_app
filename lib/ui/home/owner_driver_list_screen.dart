import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/ui/auth/login_screen.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../auth/model/owner_driver_model.dart';
import '../auth/response/owner_status_response.dart';
import '../auth/viewModel/owner_driver_viewModel.dart';

class OwnerDriverList extends StatefulWidget {
  const OwnerDriverList({Key? key}) : super(key: key);

  @override
  _OwnerDriverListState createState() => _OwnerDriverListState();
}

class _OwnerDriverListState extends State<OwnerDriverList> {
  List<OwnerDriverModel> ownerDriverModelList = [];

  @override
  void initState() {
    driverOTPVerification(ownerId: userId, context: context);
    super.initState();
  }

  driverOTPVerification({
    required BuildContext context,
    required String ownerId,
  }) async {
    final apiHandler = OwnerDriverViewModel();

    OwnerStatusRequestModel request = OwnerStatusRequestModel(
      ownerId: ownerId,
    );

    try {
      await apiHandler
          .ownerDrivers(request: request, context: context)
          .then((response) {
        var code = response;

        print("$response response............");
        List<dynamic> driverData = response;
        ownerDriverModelList =
            driverData.map((i) => OwnerDriverModel.fromJson(i)).toList();
        setState(() {});

        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.addDriver,
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColor.white,
          child: Column(
            children: [
              //10.h.VBox,
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                        ),
                        child: Column(
                          children: [
                            10.h.VBox,
                            Row(
                              children: [
                                Image.network(
                                  ownerDriverModelList[index]
                                      .profileImage
                                      .toString(),
                                  width: 40.h,
                                  height: 40.h,
                                  fit: BoxFit.fill,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Image.asset(
                                      Res.user,
                                      width: 40.h,
                                      height: 40.h,
                                    );
                                  },
                                ),
                                10.w.HBox,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ownerDriverModelList[index]
                                              .firstName
                                              .toString() +
                                          " " +
                                          ownerDriverModelList[index]
                                              .lastName
                                              .toString(),
                                      style: textBold.copyWith(
                                        color: AppColor.darkBlue,
                                      ),
                                    ),
                                    Text(
                                      "Mobile Number : +91 ${ownerDriverModelList[index].mobileNo}",
                                      style: textBold.copyWith(
                                        color: AppColor.darkBlue,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      StringConstant.statusTitle,
                                      style: textBold,
                                    ),
                                    Text(
                                      ownerDriverModelList[index]
                                          .approvalStatus
                                          .toString(),
                                      style: textBold.copyWith(
                                          color: AppColor.green),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      StringConstant.balanceTitle,
                                      style: textBold,
                                    ),
                                    Text(
                                      " Rs.",
                                      style: textBold.copyWith(
                                          color: AppColor.green),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            10.h.VBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.darkBlue,
                                    borderRadius: BorderRadius.circular(5.w),
                                  ),
                                  child: Center(
                                    child: Text(
                                      StringConstant.view,
                                      style: textBold.copyWith(
                                          color: AppColor.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.redColor,
                                    borderRadius: BorderRadius.circular(5.w),
                                  ),
                                  child: Center(
                                    child: Text(
                                      StringConstant.remove,
                                      style: textBold.copyWith(
                                          color: AppColor.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.green,
                                    borderRadius: BorderRadius.circular(5.w),
                                  ),
                                  child: Center(
                                    child: Text(
                                      StringConstant.addVehicle,
                                      style: textBold.copyWith(
                                          color: AppColor.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            10.h.VBox,
                          ],
                        ),
                      ),
                    ),
                  );
                },
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                shrinkWrap: true,
                itemCount: ownerDriverModelList.length,
                physics: const ScrollPhysics(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
