import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../values/validations.dart';
import '../../values/validator.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_form_filed.dart';
import '../auth/model/vehicle_info_model.dart';
import '../auth/response/vehicle_info_response.dart';
import '../auth/viewModel/vehicle_info_viewModel.dart';

class VehicleInfoFirstPage extends StatefulWidget {
  const VehicleInfoFirstPage({Key? key}) : super(key: key);

  @override
  State<VehicleInfoFirstPage> createState() => _VehicleInfoFirstPageState();
}

class _VehicleInfoFirstPageState extends State<VehicleInfoFirstPage> {
  bool isLoading = false;
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController ccCapacityController = TextEditingController();
  TextEditingController runningKmController = TextEditingController();
  TextEditingController pucExpiryController = TextEditingController();
  TextEditingController carrierEditingController = TextEditingController();
  TextEditingController fuelTypeEditingController = TextEditingController();
  TextEditingController acAvailableEditingController = TextEditingController();
  TextEditingController registerYearEditingController = TextEditingController();
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController brandNameTextEditingController =
      TextEditingController();
  TextEditingController colorTextEditingController = TextEditingController();
  TextEditingController insuranceCompanyNameController =
      TextEditingController();
  TextEditingController insuranceTypeController = TextEditingController();
  TextEditingController insuranceExpiryController = TextEditingController();
  TextEditingController fitnessExpiryController = TextEditingController();
  TextEditingController permitExpiryController = TextEditingController();
  TextEditingController roadTaxExpiryController = TextEditingController();
  TextEditingController authorisationExpiryController = TextEditingController();
  List<VehicleModel> vehicleInfoModelList = [];

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

        vehicleNumberController.text = vehicleInfoModelList[0].vehicleNo;
        ccCapacityController.text =
            vehicleInfoModelList[0].ccCapacity.toString();
        runningKmController.text =
            vehicleInfoModelList[0].runningKms.toString();
        pucExpiryController.text = vehicleInfoModelList[0].puc.toString();
        carrierEditingController.text = vehicleInfoModelList[0].carrier;
        fuelTypeEditingController.text = vehicleInfoModelList[0].fuelTypeId;
        acAvailableEditingController.text =
            vehicleInfoModelList[0].acAvailable.toString();
        registerYearEditingController.text =
            vehicleInfoModelList[0].registerYear;
        vehicleNameController.text =
            vehicleInfoModelList[0].vehicleName.toString();
        brandNameTextEditingController.text =
            vehicleInfoModelList[0].brandName.toString();
        colorTextEditingController.text =
            vehicleInfoModelList[0].colorName.toString();
        insuranceCompanyNameController.text =
            vehicleInfoModelList[0].insuranceCompany.toString();
        insuranceTypeController.text =
            vehicleInfoModelList[0].insuranceType.toString();
        insuranceExpiryController.text =
            vehicleInfoModelList[0].insuranceExpiry.toString();
        fitnessExpiryController.text =
            vehicleInfoModelList[0].fitnessExpiry.toString();
        permitExpiryController.text =
            vehicleInfoModelList[0].permitExpiry.toString();
        roadTaxExpiryController.text =
            vehicleInfoModelList[0].roadTaxExpiry.toString();
        authorisationExpiryController.text =
            vehicleInfoModelList[0].authorizationExpiry.toString();
      });
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("$e e...........5");
    }
  }

  var data;
  String vehicleId = "";

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
    double screenWidth = MediaQuery.of(context).size.width;

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
        actions: [
          GestureDetector(
            onTap: () {
              navigator.pushNamed(RouteName.vehicleRegistrationFirstPage,
                  arguments: {
                    "isEdit": "true",
                    "vehicleId": vehicleId,
                    "vehicleNumber": vehicleNumberController.text,
                  });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20.w, top: 15.h),
              child: Text(
                StringConstant.edit,
                style: textBold.copyWith(color: AppColor.white),
              ),
            ),
          )
        ],
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
          : Container(
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
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.w),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 17.w,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.h.VBox,
                              Text(
                                StringConstant.vehicleNumber,
                                style: textRegular.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                ),
                              ),
                              5.h.VBox,
                              AppTextField(
                                label: StringConstant.vehicleNumber,
                                hint: StringConstant.vehicleNumber,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                                keyboardType: TextInputType.text,
                                controller: vehicleNumberController,
                                maxLength: 20,
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.color,
                                style: textRegular.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.darkBlue,
                                ),
                              ),
                              5.h.VBox,
                              AppTextField(
                                label: StringConstant.color,
                                hint: StringConstant.color,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                                keyboardType: TextInputType.text,
                                controller: colorTextEditingController,
                                maxLength: 20,
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.brandName,
                                style: textRegular.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.darkBlue,
                                ),
                              ),
                              5.h.VBox,
                              AppTextField(
                                label: StringConstant.color,
                                hint: StringConstant.color,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                                keyboardType: TextInputType.text,
                                controller: brandNameTextEditingController,
                                maxLength: 20,
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.vehicleName,
                                style: textRegular.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.darkBlue),
                              ),
                              5.h.VBox,
                              AppTextField(
                                label: StringConstant.color,
                                hint: StringConstant.color,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                                keyboardType: TextInputType.text,
                                controller: vehicleNameController,
                                maxLength: 20,
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.ccCapacity,
                                style: textRegular.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.darkBlue),
                              ),
                              5.h.VBox,
                              AppTextField(
                                label: StringConstant.ccCapacity,
                                hint: StringConstant.ccCapacity,
                                validators: cityValidator,
                                readOnly: false,
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                controller: ccCapacityController,
                                inputFormatters: [
                                  NoLeadingSpaceFormatter(),
                                  FilteringTextInputFormatter.deny(
                                    RegExp('[\\.|\\,|\\-\\ ]'),
                                  ),
                                ],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.registerYear,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.color,
                                hint: StringConstant.color,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                                keyboardType: TextInputType.text,
                                controller: registerYearEditingController,
                                maxLength: 20,
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.acAvailable,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.color,
                                hint: StringConstant.color,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                                keyboardType: TextInputType.text,
                                controller: acAvailableEditingController,
                                maxLength: 20,
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.runningKm,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.runningKm,
                                hint: StringConstant.runningKm,
                                controller: runningKmController,
                                readOnly: false,
                                maxLength: 7,
                                keyboardType: TextInputType.number,
                                validators: pinCodeValidator,
                                inputFormatters: [
                                  NoLeadingSpaceFormatter(),
                                  FilteringTextInputFormatter.deny(
                                    RegExp('[\\.|\\,|\\-\\ ]'),
                                  ),
                                ],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.fuelType,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.color,
                                hint: StringConstant.color,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                                keyboardType: TextInputType.text,
                                controller: fuelTypeEditingController,
                                maxLength: 20,
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.carrier,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.color,
                                hint: StringConstant.color,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                                keyboardType: TextInputType.text,
                                controller: carrierEditingController,
                                maxLength: 20,
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.pucExpiry,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.pucExpiry,
                                hint: StringConstant.pucExpiry,
                                controller: pucExpiryController,
                                readOnly: true,
                                suffixIcon: const Icon(
                                  Icons.calendar_month_outlined,
                                ),
                                validators: pinCodeValidator,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.insuranceCompanyName,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.insuranceCompanyName,
                                hint: StringConstant.insuranceCompanyName,
                                controller: insuranceCompanyNameController,
                                readOnly: true,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.insuranceType,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.insuranceType,
                                hint: StringConstant.insuranceType,
                                controller: insuranceTypeController,
                                readOnly: true,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.insuranceType,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.insuranceType,
                                hint: StringConstant.insuranceType,
                                controller: insuranceTypeController,
                                readOnly: true,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.insuranceExpiry,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.insuranceExpiry,
                                hint: StringConstant.insuranceExpiry,
                                controller: insuranceExpiryController,
                                readOnly: true,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.fitnessExpiry,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.fitnessExpiry,
                                hint: StringConstant.fitnessExpiry,
                                controller: fitnessExpiryController,
                                readOnly: true,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.permitExpiry,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.permitExpiry,
                                hint: StringConstant.permitExpiry,
                                controller: permitExpiryController,
                                readOnly: true,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.roadTaxExpiry,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.roadTaxExpiry,
                                hint: StringConstant.roadTaxExpiry,
                                controller: roadTaxExpiryController,
                                readOnly: true,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.authorizationExpiry,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppTextField(
                                label: StringConstant.authorizationExpiry,
                                hint: StringConstant.authorizationExpiry,
                                controller: authorisationExpiryController,
                                readOnly: true,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                              ),
                              20.h.VBox,
                              AppButton(
                                StringConstant.next,
                                () {
                                  navigator.pushNamed(
                                      RouteName.vehicleInfoSecondPage,
                                      arguments: {"vehicleId": vehicleId});
                                },
                                height: 41.h,
                              ),
                              20.h.VBox,
                            ],
                          ),
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
