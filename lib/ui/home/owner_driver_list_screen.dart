import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/ui/auth/login_screen.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/passing_parameters.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/owner_driver_info_widget.dart';
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
    driverList(ownerId: userId, context: context);
    super.initState();
  }

  driverList({
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColor.white,
        child: Column(
          children: [
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return OwnerDriverInfoWidget(
                  driverName:
                      "${ownerDriverModelList[index].firstName} ${ownerDriverModelList[index].lastName}",
                  balance: "",
                  status: ownerDriverModelList[index].approvalStatus.toString(),
                  imageUrl: ownerDriverModelList[index].profileImage.toString(),
                  driverMobileNumber: "${ownerDriverModelList[index].mobileNo}",
                  onTapView: () {
                    navigator.pushNamed(RouteName.driverInfoPage, arguments: {
                      PassingParameters.driverId:
                          ownerDriverModelList[index].id.toString()
                    });
                  },
                  onTapRemove: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      headerAnimationLoop: true,
                      animType: AnimType.topSlide,
                      showCloseIcon: false,
                      title: StringConstant.remove,
                      desc: StringConstant.removeDriverConfirmation,
                      descTextStyle: textBold.copyWith(
                        fontSize: 20.sp,
                        color: AppColor.dark,
                      ),
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
                  },
                  onTapAssignVehicle: () {
                    navigator.pushNamed(RouteName.ownerAssignVehiclePage);
                  },
                );
              },
              padding: EdgeInsets.only(
                top: 10.h,
                bottom: 10.h,
              ),
              shrinkWrap: true,
              itemCount: ownerDriverModelList.length,
              physics: const ScrollPhysics(),
            )
          ],
        ),
      ),
    );
  }
}
