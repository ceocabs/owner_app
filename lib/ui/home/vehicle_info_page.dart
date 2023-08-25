import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../auth/response/vehicle_details_response.dart';
import '../auth/viewModel/vehicle_details_viewModel.dart';
import '../auth/model/vehicle_info_model.dart';

class VehicleInfoPage extends StatefulWidget {
  const VehicleInfoPage({Key? key}) : super(key: key);

  @override
  State<VehicleInfoPage> createState() => _VehicleInfoPageState();
}

class _VehicleInfoPageState extends State<VehicleInfoPage> {
  @override
  Future<void> didChangeDependencies() async {
    await getVehicleDetails(context: context);
    super.didChangeDependencies();
  }

  List<VehicleModel> vehicleModelList = [];

  getVehicleDetails({
    required BuildContext context,
  }) async {
    final apiHandler = VehicleDetailsViewModel();
    VehicleDetailsRequestModel request = VehicleDetailsRequestModel(id: "4");
    //  VehicleApprovalStatusModel request = VehicleApprovalStatusModel();
    try {
      await apiHandler
          .vehicleDetails(context: context, request: request)
          .then((response) {
        var code = response;
        vehicleModelList =
            response.map((i) => VehicleModel.fromJson(i)).toList();
        print("${vehicleModelList.length}  length.........");
        print("${vehicleModelList[0].ownerId} ownerId name");
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
          StringConstant.vehicleInfo,
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    20.h.VBox,
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Card(
                            elevation: 2,
                            child: Container(
                              width: 320.w,
                              padding: EdgeInsets.only(left: 12.w, right: 12.w),
                              color: AppColor.white,
                              child: Column(
                                children: [
                                  Container(
                                    child: ListView.builder(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.only(top: 17.h),
                                          child: InkWell(
                                            onTap: () {
                                              if (vehicleModelList[index]
                                                      .approvalStatus ==
                                                  "Pending") {
                                                navigator.pushNamed(RouteName
                                                    .pendingVehicleApprovalPage);
                                              } else if (vehicleModelList[index]
                                                      .approvalStatus ==
                                                  "Rejected") {}
                                              /*  navigator.pushNamed(RouteName
                                                  .editVehicleFirstPage);*/
                                            },
                                            child: Container(
                                              height: 69.h,
                                              width: 294.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.w),
                                                border: Border.all(
                                                  width: 1.w,
                                                  color: AppColor.greyColor
                                                      .withOpacity(0.3),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        Res.car1,
                                                        width: 80.w,
                                                        height: 52.h,
                                                      ),
                                                      11.w.HBox,
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            vehicleModelList[
                                                                    index]
                                                                .vehicleNo,
                                                            style: textBold.copyWith(
                                                                color: AppColor
                                                                    .darkBlue,
                                                                fontSize:
                                                                    14.sp),
                                                          ),
                                                          Text(
                                                            "${vehicleModelList[index].brandId} | ${vehicleModelList[index].vehicleNameId}",
                                                            style: textRegular
                                                                .copyWith(
                                                                    color:
                                                                        AppColor
                                                                            .grey,
                                                                    fontSize:
                                                                        11.sp),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: vehicleModelList.length,
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                    ),
                                  ),
                                  20.h.VBox
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
