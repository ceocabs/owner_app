import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/view_vehicle_info_widget.dart';
import '../auth/model/vehicle_info_model.dart';
import '../auth/response/vehicle_info_response.dart';
import '../auth/viewModel/vehicle_info_viewModel.dart';

class VehicleInfoSecondPage extends StatefulWidget {
  const VehicleInfoSecondPage({Key? key}) : super(key: key);

  @override
  State<VehicleInfoSecondPage> createState() => _VehicleInfoSecondPageState();
}

class _VehicleInfoSecondPageState extends State<VehicleInfoSecondPage> {
  bool isLoading = false;
  List<VehicleModel> vehicleInfoModelList = [];
  String vehicleFrontImageUrl = "";
  String vehicleBackImageUrl = "";
  String vehicleRightImageUrl = "";
  String vehicleLeftImageUrl = "";
  String rcFrontImageUrl = "";
  String rcBackImageUrl = "";
  String insuranceImageUrl = "";
  String fitnessImageUrl = "";
  String saleAgreementImageUrl = "";
  String saleAgreementLastImageUrl = "";
  String authorizationImageUrl = "";
  String permitImageUrl = "";
  String roadTaxImageUrl = "";
  String pucImageUrl = "";
  var data;
  String vehicleId = "";

  getVehicleInfo({
    required BuildContext context,
    required String vehicleId,
  }) async {
    final apiHandler = vehicleInfoViewModel();
    VehicleInfoRequestModel request =
        VehicleInfoRequestModel(vehicleId: vehicleId);
    setState(() {
      isLoading = true;
    });
    try {
      await apiHandler
          .vehicleView(request: request, context: context)
          .then((response) async {
        print("$response  response vehicle info response..........");
        List<dynamic> vehicleInfoData = response;
        vehicleInfoModelList =
            vehicleInfoData.map((i) => VehicleModel.fromJson(i)).toList();

        vehicleFrontImageUrl =
            vehicleInfoModelList[0].vehiclePicFront.toString();
        vehicleBackImageUrl = vehicleInfoModelList[0].vehiclePicBack.toString();
        vehicleRightImageUrl =
            vehicleInfoModelList[0].vehiclePicRight.toString();
        vehicleLeftImageUrl = vehicleInfoModelList[0].vehiclePicLeft.toString();
        rcFrontImageUrl = vehicleInfoModelList[0].rcFrontImage.toString();
        rcBackImageUrl = vehicleInfoModelList[0].rcBackImage.toString();
        insuranceImageUrl = vehicleInfoModelList[0].insuranceImage.toString();
        fitnessImageUrl = vehicleInfoModelList[0].fitnessImage.toString();
        saleAgreementImageUrl =
            vehicleInfoModelList[0].saleAgreementFirst.toString();
        saleAgreementLastImageUrl =
            vehicleInfoModelList[0].saleAgreementLast.toString();
        authorizationImageUrl =
            vehicleInfoModelList[0].authorizationImage.toString();
        permitImageUrl = vehicleInfoModelList[0].permitImage.toString();
        roadTaxImageUrl = vehicleInfoModelList[0].roadTaxImage.toString();
        pucImageUrl = vehicleInfoModelList[0].pucImage.toString();
        setState(() {});
      });
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("$e e...........5");
    }
  }

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        vehicleId = data["vehicleId"].toString();
        print("$vehicleId vehicle Id......");
      });
      getVehicleInfo(context: context, vehicleId: vehicleId);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.vehicleRegistration,
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
      body: isLoading
          ? Container()
          : SingleChildScrollView(
              child: Container(
                color: AppColor.white,
                child: Column(
                  children: [
                    10.h.VBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.vehicleFrontImage,
                          image: vehicleFrontImageUrl,
                        ),
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.vehicleBackImage,
                          image: vehicleBackImageUrl,
                        ),
                      ],
                    ),
                    10.h.VBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.vehicleRight,
                          image: vehicleRightImageUrl,
                        ),
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.vehicleLeft,
                          image: vehicleLeftImageUrl,
                        ),
                      ],
                    ),
                    10.h.VBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.rcFrontPic,
                          image: rcFrontImageUrl,
                        ),
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.rcBackPic,
                          image: rcBackImageUrl,
                        ),
                      ],
                    ),
                    10.h.VBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.insurancePhoto,
                          image: insuranceImageUrl,
                        ),
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.fitnessPhoto,
                          image: fitnessImageUrl,
                        ),
                      ],
                    ),
                    10.h.VBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.saleAgreementPic,
                          image: saleAgreementImageUrl,
                        ),
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.saleAgreementLastPic,
                          image: saleAgreementLastImageUrl,
                        ),
                      ],
                    ),
                    10.h.VBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.authorisationPhoto,
                          image: authorizationImageUrl,
                        ),
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.permitPhoto,
                          image: permitImageUrl,
                        ),
                      ],
                    ),
                    10.h.VBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.roadTaxPhoto,
                          image: roadTaxImageUrl,
                        ),
                        ViewVehicleInfoWidget(
                          titleName: StringConstant.pucTitle,
                          image: pucImageUrl,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
