import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/passing_parameters.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/choose_specifc_driver_widget.dart';
import '../auth/model/owner_driver_model.dart';
import '../auth/response/owner_status_response.dart';
import '../auth/viewModel/owner_driver_viewModel.dart';

class ChooseSpecifcDriverScreen extends StatefulWidget {
  const ChooseSpecifcDriverScreen({Key? key}) : super(key: key);

  @override
  State<ChooseSpecifcDriverScreen> createState() =>
      _ChooseSpecifcDriverScreenState();
}

class _ChooseSpecifcDriverScreenState extends State<ChooseSpecifcDriverScreen> {
  List<OwnerDriverModel> ownerDriverModelList = [];
  var data;
  String categoryType = "";

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        categoryType = data[PassingParameters.categoryType].toString();
      });
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    driverOTPVerification(ownerId: "6", context: context);
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
                return InkWell(
                  onTap: () {},
                  child: ChooseSpecifcDriverWidget(
                    onTap: () {
                      if (categoryType == "transactionHistory") {
                        navigator.pushNamed(RouteName.transactionHistoryPage);
                      } else if (categoryType == "withdrawHistory") {
                        navigator
                            .pushNamed(RouteName.driverWithdrawalHistoryPage);
                      } else if (categoryType == "totalEarning") {
                        navigator
                            .pushNamed(RouteName.earningFilterDataPage);
                      }
                    },
                    driverName:
                        "${ownerDriverModelList[index].firstName} ${ownerDriverModelList[index].lastName}",
                    profileImage:
                        ownerDriverModelList[index].profileImage.toString(),
                    balance: "",
                    number: ownerDriverModelList[index].mobileNo.toString(),
                    approvalStatus:
                        ownerDriverModelList[index].approvalStatus.toString(),
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
    );
  }
}

/*Padding(
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
                                      "${ownerDriverModelList[index]
                                          .firstName} ${ownerDriverModelList[index]
                                              .lastName}",
                                      style: textBold.copyWith(
                                        color: AppColor.darkBlue,
                                      ),
                                    ),
                                    Text(
                                      "Number : +91 ${ownerDriverModelList[index].mobileNo}",
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

                          ],
                        ),
                      ),
                    ),
                  )*/
