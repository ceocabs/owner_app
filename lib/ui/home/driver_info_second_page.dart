import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';

import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/driver_images_widget.dart';
import '../auth/model/driver_profile_model.dart';
import '../auth/response/driver_profile_response.dart';
import '../auth/viewModel/driver_profile_viewModel.dart';

class DriverInfoSecondPage extends StatefulWidget {
  const DriverInfoSecondPage({Key? key}) : super(key: key);

  @override
  State<DriverInfoSecondPage> createState() => _DriverInfoSecondPageState();
}

class _DriverInfoSecondPageState extends State<DriverInfoSecondPage> {
  String driverId = "";
  String? licenceFrontImageUrl = "";
  String? licenceBackImageUrl = "";
  String? panCardFrontImageUrl = "";
  String? profileImageUrl = "";
  String? adharCardFrontImageUrl = "";
  String? adharCardBackImageUrl = "";
  List<DriverProfileModel> driverProfileModelList = [];
  var data;

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        driverId = data["driverId"].toString();
      });
      driverInfo(ownerId: driverId, context: context);
    }
    super.didChangeDependencies();
  }



  driverInfo({
    required BuildContext context,
    required String ownerId,
  }) async {
    final apiHandler = DriverProfileViewModel();

    DriverProfileRequestModel request = DriverProfileRequestModel(
      userId: ownerId,
    );

    try {
      await apiHandler
          .driverProfile(request: request, context: context)
          .then((response) {
        var code = response;

        print("$response response............");
        List<dynamic> driverData = response;
        driverProfileModelList =
            driverData.map((i) => DriverProfileModel.fromJson(i)).toList();
        setState(() {});
        licenceFrontImageUrl =
            driverProfileModelList[0].drivingLicenseFrontImage;
        licenceBackImageUrl = driverProfileModelList[0].drivingLicenceBackImage;
        panCardFrontImageUrl = driverProfileModelList[0].panCardImage;
        profileImageUrl = driverProfileModelList[0].profileImage;
        adharCardFrontImageUrl = driverProfileModelList[0].adharCardFrontImage;
        adharCardBackImageUrl = driverProfileModelList[0].adharCardBackImage;
        print("$profileImageUrl profile image url......");

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
          StringConstant.driverDetails,
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColor.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.h.VBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DriverImagesWidget(
                  profileImage: licenceFrontImageUrl,
                  titleName: StringConstant.licenceFrontImageTitle,
                ),
                DriverImagesWidget(
                  profileImage: licenceBackImageUrl,
                  titleName: StringConstant.licenceBackImageTitle,
                ),
              ],
            ),
            20.h.VBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DriverImagesWidget(
                  profileImage: panCardFrontImageUrl,
                  titleName: StringConstant.panCardFrontImageTitle,
                ),
                DriverImagesWidget(
                  profileImage: profileImageUrl,
                  titleName: StringConstant.profileImage,
                ),
              ],
            ),
            20.h.VBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DriverImagesWidget(
                  profileImage: adharCardFrontImageUrl,
                  titleName: StringConstant.aadtharCardFrontImage,
                ),
                DriverImagesWidget(
                  profileImage: adharCardBackImageUrl,
                  titleName: StringConstant.aadtharCardBackImage,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
