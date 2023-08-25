import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/ui/auth/login_screen.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/custom_info_dialog.dart';
import '../../widgets/vehicle_status_widget.dart';
import '../auth/model/get_vehicle_by_status_model.dart';
import '../auth/viewModel/get_vehicle_by_status_viewModel.dart';
import '../auth/response/get_vehicle_status_response.dart';

class VehicleStatusPage extends StatefulWidget {
  const VehicleStatusPage({Key? key}) : super(key: key);

  @override
  State<VehicleStatusPage> createState() => _VehicleStatusPageState();
}

class _VehicleStatusPageState extends State<VehicleStatusPage> {
  bool isApproved = true;
  bool isLoading = false;
  List<GetVehicleByStatusModel> vehicleStatusModelList = [];

  @override
  void initState() {
    vehicleStatus(status: "approved", ownerId: userId, context: context);
    super.initState();
  }

  vehicleStatus({
    required BuildContext context,
    required dynamic ownerId,
    required dynamic status,
  }) async {
    final apiHandler = GetVehicleByStatusViewModel();

    GetVehicleStatusRequestModel request =
        GetVehicleStatusRequestModel(ownerId: ownerId, status: status);
    vehicleStatusModelList.clear();
    try {
      await apiHandler
          .getVehicleByStatus(request: request, context: context)
          .then((response) {
        List<dynamic> vehicleStatusData = response;

        vehicleStatusModelList = vehicleStatusData
            .map((i) => GetVehicleByStatusModel.fromJson(i))
            .toList();
        setState(() {});
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
          StringConstant.vehicleStatus,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    isApproved = true;
                    vehicleStatus(
                        status: "approved", ownerId: userId, context: context);
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    padding: EdgeInsets.all(10.w),
                    child: Center(
                      child: Text(
                        StringConstant.approvedVehicle,
                        style: isApproved
                            ? textBold.copyWith(color: AppColor.red)
                            : textBold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    isApproved = false;
                    vehicleStatus(
                        status: "rejected", ownerId: userId, context: context);
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    padding: EdgeInsets.all(10.w),
                    child: Center(
                      child: Text(
                        StringConstant.rejectedVehicle,
                        style: isApproved == false
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
              child: vehicleStatusModelList.length == 0
                  ? Container(
                      child: Center(
                        child: Text(
                          StringConstant.dataNotFound,
                          style: textBold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 20.w,
                            top: 10.h,
                            bottom: 10.h,
                          ),
                          child: VehicleStatusWidget(
                            vehicleNo: vehicleStatusModelList[index]
                                .vehicleNo
                                .toString(),
                            status: vehicleStatusModelList[index]
                                .approvalStatus
                                .toString(),
                            onPressed: () {
                              if (vehicleStatusModelList[index]
                                      .approvalStatus ==
                                  "Pending") {
                                showDialog(
                                  barrierColor: Colors.black26,
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context) {
                                    return CustomInfoDialog(
                                      title: StringConstant.alert,
                                      description:
                                          StringConstant.documentsUnderReview,
                                    );
                                  },
                                );
                              } else if (vehicleStatusModelList[index]
                                      .approvalStatus ==
                                  "Rejected") {
                                navigator.pushNamed(
                                    RouteName.uploadRejectedVehicleDocument,
                                    arguments: {
                                      "vehicleId": vehicleStatusModelList[index]
                                          .vehiclesId
                                          .toString(),
                                    });
                              } else if (vehicleStatusModelList[index]
                                      .approvalStatus ==
                                  "Approved") {
                                navigator.pushNamed(
                                  RouteName.vehicleInfoFirstPage,
                                  arguments: {
                                    "vehicleId": vehicleStatusModelList[index]
                                        .vehiclesId
                                        .toString(),
                                  },
                                );
                              }
                            },
                          ),
                        );
                      },
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: vehicleStatusModelList.length,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
