import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/passing_parameters.dart';
import 'package:owner/widgets/custom_info_dialog.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../core/navigation/routes.dart';
import '../../../res.dart';
import '../../../values/colors.dart';
import '../../../values/string_contsant.dart';
import '../../../values/style.dart';
import '../../../values/validations.dart';
import '../../../values/validator.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_filed.dart';
import '../auth/model/insurance_company_model.dart';
import '../auth/response/insurance_company_response.dart';
import '../auth/model/insurance_type_model.dart';
import '../auth/viewModel/insurance_type_viewModel.dart';

class VehicleRegistrationSecondPage extends StatefulWidget {
  const VehicleRegistrationSecondPage({Key? key}) : super(key: key);

  @override
  State<VehicleRegistrationSecondPage> createState() =>
      _VehicleRegistrationSecondPageState();
}

class _VehicleRegistrationSecondPageState
    extends State<VehicleRegistrationSecondPage> {
  TextEditingController insuranceCompanyNameController =
      TextEditingController();
  TextEditingController insuranceTypeController = TextEditingController();
  TextEditingController insuranceExpiryController = TextEditingController();
  TextEditingController fitnessExpiryController = TextEditingController();
  TextEditingController permitExpiryController = TextEditingController();
  TextEditingController roadTaxExpiryController = TextEditingController();
  TextEditingController authorisationExpiryController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  String vehicleNumber = "";
  String vehicleType = "";
  String color = "";
  String brandName = "";
  String vehicleName = "";
  String ccCapacity = "";
  String registerYear = "";
  String acAvailable = "";
  String runningKm = "";
  String fuelType = "";
  String carrier = "";
  String pucExpiry = "";
  String vehicleId = "";
  String isEdit = "";
  var data;
  List<InsuranceTypeModel> insuranceTypeModelList = [];
  List<InsuranceCompanyModel> insuranceCompanyNameList = [];
  List<DropdownMenuItem<String>> insuranceTypeMenuItems = [];
  List<DropdownMenuItem<String>> insuranceNameMenuItems = [];
  String? selectedInsuranceTypeValue = null;
  String? selectedInsuranceNameValue = null;

  List<DropdownMenuItem<String>> get insuranceTypeItems {
    List<DropdownMenuItem<String>> menuItemsData = insuranceTypeMenuItems;
    return menuItemsData;
  }

  List<DropdownMenuItem<String>> get insuranceNameItems {
    List<DropdownMenuItem<String>> menuItemsData = insuranceNameMenuItems;
    return menuItemsData;
  }

  insuranceType({
    required BuildContext context,
  }) async {
    final apiHandler = InsuranceTypeViewModel();

    InsuranceCompanyRequestModel request = InsuranceCompanyRequestModel();

    try {
      await apiHandler
          .insuranceTypeList(request: request, context: context)
          .then(
        (response) {
          print("$response insurance type response.........");
          List<dynamic> insuranceTypeData = response;
          insuranceTypeModelList = insuranceTypeData
              .map((i) => InsuranceTypeModel.fromJson(i))
              .toList();
          print(
              "${insuranceTypeModelList.length} InsuranceTypeViewModel length......");

          for (int i = 0; i < insuranceTypeModelList.length; i++) {
            insuranceTypeMenuItems.add(
              DropdownMenuItem(
                value: insuranceTypeModelList[i].id.toString(),
                child: Text(insuranceTypeModelList[i].icName.toString()),
              ),
            );
            setState(() {});
          }
        },
      );
    } catch (e) {
      print("$e e...........");
    }
  }

  insuranceCompanyName({
    required BuildContext context,
  }) async {
    final apiHandler = InsuranceTypeViewModel();

    InsuranceCompanyRequestModel request = InsuranceCompanyRequestModel();

    try {
      await apiHandler
          .insuranceTypeList(request: request, context: context)
          .then(
        (response) {
          print("$response insurance type response.........");
          List<dynamic> insuranceCompanyNameData = response;

          insuranceCompanyNameList = insuranceCompanyNameData
              .map((i) => InsuranceCompanyModel.fromJson(i))
              .toList();
          print(
              "${insuranceCompanyNameList.length} insuranceCompanyNameList length......");
          for (int i = 0; i < insuranceCompanyNameList.length; i++) {
            insuranceNameMenuItems.add(
              DropdownMenuItem(
                value: insuranceCompanyNameList[i].id.toString(),
                child: Text(insuranceCompanyNameList[i].icName.toString()),
              ),
            );
            setState(() {});
          }
        },
      );
    } catch (e) {
      print("$e e...........");
    }
  }

  @override
  void initState() {
    insuranceType(context: context);
    insuranceCompanyName(context: context);

    super.initState();
  }

  insuranceValidations() {
    if (insuranceCompanyNameController.text.toString() == "null" ||
        insuranceCompanyNameController.text.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterInsuranceCompanyValidation,
          );
        },
      );
    } else if (insuranceTypeController.text.toString() == "null" ||
        insuranceTypeController.text.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterInsuranceTypeValidation,
          );
        },
      );
    } else if (insuranceExpiryController.text.toString() == "null" ||
        insuranceExpiryController.text.toString() == "") {
      print("enter into this....");
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterInsuranceExpiryValidations,
          );
        },
      );
    } else if (fitnessExpiryController.text.toString() == "null" ||
        fitnessExpiryController.text.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterFitnessExpiryValidations,
          );
        },
      );
    } else if (permitExpiryController.text.toString() == "null" ||
        permitExpiryController.text.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterPermitExpiryValidations,
          );
        },
      );
    } else if (roadTaxExpiryController.text.toString() == "null" ||
        roadTaxExpiryController.text.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterRoadTaxExpiryValidations,
          );
        },
      );
    } else if (authorisationExpiryController.text.toString() == "null" ||
        authorisationExpiryController.text.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterAuthorizationExpiry,
          );
        },
      );
    } else {
      navigator.pushNamed(RouteName.vehicleRegistrationThirdPage, arguments: {
        PassingParameters.vehicleNumber: vehicleNumber,
        // PassingParameters.vehicleType: vehicleType,
        PassingParameters.color: color,
        PassingParameters.brandName: brandName,
        PassingParameters.vehicleName: vehicleName,
        PassingParameters.ccCapacity: ccCapacity,
        PassingParameters.registerYear: registerYear,
        PassingParameters.acAvailable: acAvailable,
        PassingParameters.runningKm: runningKm,
        PassingParameters.fuelType: fuelType,
        PassingParameters.carrier: carrier,
        PassingParameters.pucExpiry: pucExpiry,
        PassingParameters.insuranceCompanyName:
            insuranceCompanyNameController.text,
        PassingParameters.insuranceType: insuranceTypeController.text,
        PassingParameters.pucExpiry: pucExpiry,
        PassingParameters.insuranceExpiry: insuranceExpiryController.text,
        PassingParameters.fitnessExpiry: fitnessExpiryController.text,
        PassingParameters.permitExpiry: permitExpiryController.text,
        PassingParameters.roadTaxExpiry: roadTaxExpiryController.text,
        PassingParameters.authorisationExpiry:
            authorisationExpiryController.text,
        PassingParameters.vehicleId: vehicleId,
        PassingParameters.isEdit: isEdit,
      });
    }
  }

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        vehicleNumber = data[PassingParameters.vehicleNumber].toString();

        color = data[PassingParameters.color].toString();
        brandName = data[PassingParameters.brandName].toString();
        vehicleName = data[PassingParameters.vehicleName].toString();
        ccCapacity = data[PassingParameters.ccCapacity].toString();
        registerYear = data[PassingParameters.registerYear].toString();
        acAvailable = data[PassingParameters.acAvailable].toString();
        runningKm = data[PassingParameters.runningKm].toString();
        fuelType = data[PassingParameters.fuelType].toString();
        carrier = data[PassingParameters.carrier].toString();
        pucExpiry = data[PassingParameters.pucExpiry].toString();
        vehicleId = data["vehicleId"].toString();
        isEdit = data["isEdit"].toString();
        print("$vehicleNumber vehicle number................");
        print("$color vehicle number................");
        print("$brandName brandname................");
        print("$color color................");
        print("$vehicleName vehicleName................");
        print("$ccCapacity ccCapacity................");
        print("$registerYear registerYear................");
        print("$acAvailable acAvailable................");
        print("$runningKm runningKm................");
        print("$fuelType fuelType................");
        print("$carrier carrier...............");
        print("$pucExpiry pucExpiry................");
      });
    }
    super.didChangeDependencies();
  }

  String? _selectedTime;

  Future<void> _selectDate(BuildContext context, int index) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      String formattedDate = DateFormat("dd-MM-yyyy").format(selectedDate);
      if (index == 1) {
        insuranceExpiryController.text = formattedDate.toString();
        print("${insuranceExpiryController.text}  insurance expiry date.....");
      } else if (index == 2) {
        fitnessExpiryController.text = formattedDate.toString();
        print("${fitnessExpiryController.text}  fitness expiry date.....");
      } else if (index == 3) {
        permitExpiryController.text = formattedDate.toString();
        print("${permitExpiryController.text}  permit expiry date.....");
      } else if (index == 4) {
        roadTaxExpiryController.text = formattedDate.toString();
        print("${roadTaxExpiryController.text}  road tax expiry date.....");
      } else if (index == 5) {
        authorisationExpiryController.text = formattedDate.toString();
        print(
            "${authorisationExpiryController.text}  authorization expiry date.....");
      }
      setState(() {});
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
              // height: 520.h,
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 20.h,
              ),
              child: Container(
                child: SingleChildScrollView(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.w,
                      ),
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
                            StringConstant.insuranceCompanyName,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          ),
                          5.h.VBox,
                          SizedBox(
                            height: 41.h,
                            child: DropdownButtonFormField(
                              menuMaxHeight: 150.h,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                filled: false,
                                contentPadding: EdgeInsets.all(14.w),
                                hintText: StringConstant.selectInsuranceCompany,
                                fillColor: AppColor.white,
                              ),
                              dropdownColor: AppColor.white,
                              isExpanded: true,
                              value: selectedInsuranceNameValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedInsuranceNameValue = newValue!;
                                  insuranceCompanyNameController.text =
                                      selectedInsuranceNameValue.toString();
                                });
                              },
                              items: insuranceNameItems,
                            ),
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.insuranceType,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          SizedBox(
                            height: 41.h,
                            child: DropdownButtonFormField(
                              menuMaxHeight: 150.h,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                filled: false,
                                contentPadding: EdgeInsets.all(14.w),
                                hintText: StringConstant.selectInsuranceType,
                                fillColor: AppColor.white,
                              ),
                              dropdownColor: AppColor.white,
                              isExpanded: true,
                              value: selectedInsuranceTypeValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedInsuranceTypeValue = newValue!;
                                  insuranceTypeController.text =
                                      selectedInsuranceTypeValue.toString();
                                });
                              },
                              items: insuranceTypeItems,
                            ),
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.insuranceExpiry,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.insuranceExpiry,
                            hint: StringConstant.insuranceExpiry,
                            keyboardAction: TextInputAction.next,
                            validators: emailValidator,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context, 1);
                            },
                            suffixIcon: InkWell(
                              onTap: () {
                                _selectDate(context, 1);
                              },
                              child: const Icon(Icons.calendar_month_outlined),
                            ),
                            controller: insuranceExpiryController,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.fitnessExpiry,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.fitnessExpiry,
                            hint: StringConstant.fitnessExpiry,
                            validators: addressValidator,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context, 2);
                            },
                            suffixIcon: InkWell(
                              onTap: () {
                                _selectDate(context, 2);
                              },
                              child: const Icon(
                                Icons.calendar_month_outlined,
                              ),
                            ),
                            keyboardAction: TextInputAction.next,
                            controller: fitnessExpiryController,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.permitExpiry,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.permitExpiry,
                            hint: StringConstant.permitExpiry,
                            validators: stateValidator,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context, 3);
                            },
                            suffixIcon: InkWell(
                              onTap: () {
                                _selectDate(context, 3);
                              },
                              child: const Icon(
                                Icons.calendar_month_outlined,
                              ),
                            ),
                            controller: permitExpiryController,
                            keyboardAction: TextInputAction.next,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.roadTaxExpiry,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.roadTaxExpiry,
                            hint: StringConstant.roadTaxExpiry,
                            validators: cityValidator,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context, 4);
                            },
                            suffixIcon: InkWell(
                              onTap: () {
                                _selectDate(context, 4);
                              },
                              child: const Icon(
                                Icons.calendar_month_outlined,
                              ),
                            ),
                            controller: roadTaxExpiryController,
                            keyboardAction: TextInputAction.next,
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
                            keyboardAction: TextInputAction.done,
                            controller: authorisationExpiryController,
                            validators: pinCodeValidator,
                            onTap: () {
                              _selectDate(context, 5);
                            },
                            suffixIcon: InkWell(
                              onTap: () {
                                _selectDate(context, 5);
                              },
                              child: const Icon(Icons.calendar_month_outlined),
                            ),
                            readOnly: true,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          AppButton(
                            StringConstant.next,
                            () {
                              insuranceValidations();
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
            ),
          ],
        ),
      ),
    );
  }
}
