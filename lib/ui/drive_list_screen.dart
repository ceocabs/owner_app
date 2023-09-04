import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/ui/auth/model/driver_lisrt_model.dart';
import 'package:owner/ui/auth/response/driver_list_response.dart';
import 'package:owner/ui/auth/viewModel/driver_list_viewModel.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../core/navigation/navigation_service.dart';
import '../res.dart';
import '../values/colors.dart';
import '../values/string_contsant.dart';
import '../values/style.dart';

class DriverListScreen extends StatefulWidget {
  const DriverListScreen({Key? key}) : super(key: key);

  @override
  State<DriverListScreen> createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen> {
  @override
  Future<void> didChangeDependencies() async {
    await getDriverList(context: context);
    super.didChangeDependencies();
  }

  List<DriverListModel> driverListModelList = [];

  getDriverList({
    required BuildContext context,
  }) async {
    final apiHandler = DriverListViewModel();
    DriverListRequestModel request = DriverListRequestModel(userId: 1);

    try {
      await apiHandler
          .driverList(context: context, request: request)
          .then((response) {
        var code = response;
        driverListModelList =
            response.map((i) => DriverListModel.fromJson(i)).toList();
        print("${driverListModelList.length}  length.........");

        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.driverList,
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
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ClipPath(
              clipper: ProsteBezierCurve(
                position: ClipPosition.bottom,
                list: [
                  BezierCurveSection(
                    start: const Offset(0, 150),
                    top: Offset(screenWidth / 2, 200),
                    end: Offset(screenWidth, 150),
                  ),
                ],
              ),
              child: Container(
                height: 180.h,
                color: AppColor.darkBlue,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 20.h,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 0.w,
                    right: 0.w,
                    top: 0.h,
                  ),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.w),
                        ),
                        elevation: 10,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 5.h, bottom: 10.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60.w,
                                    height: 60.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.green,
                                    ),
                                    child: Image.asset(Res.user),
                                  ),
                                  10.w.HBox,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${driverListModelList[index].firstName} ${driverListModelList[index].lastName}   ",
                                        style: textBold.copyWith(
                                            color: AppColor.darkBlue,
                                            fontSize: 16.sp),
                                      ),
                                      Text(
                                        "Mobile Number : +91 ${driverListModelList[index].mobileNo}",
                                        style: textBold.copyWith(
                                            color: AppColor.dark,
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        "Driver Id : ${driverListModelList[index].id}",
                                        style: textBold.copyWith(
                                            color: AppColor.dark,
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    physics: const ScrollPhysics(),
                    itemCount: driverListModelList.length,
                    shrinkWrap: true,
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
