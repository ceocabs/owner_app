import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/ui/auth/login_screen.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../auth/model/online_offline_drivers_model.dart';
import '../auth/response/online_offline_drivers_response.dart';
import '../auth/viewModel/online_offline_driver_viewModel.dart';

class OnlineOfflineDriverScreen extends StatefulWidget {
  const OnlineOfflineDriverScreen({Key? key}) : super(key: key);

  @override
  State<OnlineOfflineDriverScreen> createState() =>
      _OnlineOfflineDriverScreenState();
}

class _OnlineOfflineDriverScreenState extends State<OnlineOfflineDriverScreen> {
  var data;
  String searchingType = "";
  List<OnlineOfflineDriversModel> onlineOfflineDriversModelList = [];

  @override
  Future<void> didChangeDependencies() async {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        searchingType = data["searchingType"].toString();
      });
      await onlineOfflineDrivers(
          context: context, ownerId: userId, status: searchingType);
    }
    super.didChangeDependencies();
  }

  onlineOfflineDrivers({
    required BuildContext context,
    required String ownerId,
    required String status,
  }) async {
    final apiHandler = OnlineOfflineDriversViewModel();
    OnlineOfflineDriversRequestModel request =
        OnlineOfflineDriversRequestModel(ownerId: ownerId, status: status);

    try {
      await apiHandler
          .onlineOfflineDriver(context: context, request: request)
          .then((response) {
        var code = response;
        onlineOfflineDriversModelList =
            response.map((i) => OnlineOfflineDriversModel.fromJson(i)).toList();
        print("${onlineOfflineDriversModelList.length}  length.........");
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
          StringConstant.onlineOfflineDrivers,
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
      body: onlineOfflineDriversModelList.length.toString() == "0"
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColor.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringConstant.dataNotFound,
                    style: textBold.copyWith(fontSize: 20.w),
                  )
                ],
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColor.white,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.h),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 15.w,
                      right: 15.w,
                      bottom: 10.h,
                    ),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          bottom: 10.h,
                          top: 10.h,
                          right: 20.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.w),
                              child: Image.network(
                                onlineOfflineDriversModelList[index]
                                    .profileImage
                                    .toString(),
                                width: 60.w,
                                height: 50.h,
                                fit: BoxFit.fill,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.asset(
                                    Res.uploadImage,
                                    width: 50.w,
                                    height: 50.h,
                                  );
                                },
                              ),
                            ),
                            20.w.HBox,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                5.h.VBox,
                                Text(
                                  onlineOfflineDriversModelList[index]
                                      .name
                                      .toString(),
                                  style: textBold.copyWith(color: AppColor.red),
                                ),
                                Text(
                                  onlineOfflineDriversModelList[index]
                                      .vehicleNo
                                      .toString(),
                                  style: textMedium.copyWith(fontSize: 14.sp),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Vehicle Type : ${onlineOfflineDriversModelList[index].vehicleType.toString()}",
                                      style:
                                          textMedium.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                5.h.VBox,
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: onlineOfflineDriversModelList.length,
              ),
            ),
    );
  }
}
