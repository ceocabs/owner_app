import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/ui/auth/model/fuel_type_model.dart';
import 'package:owner/ui/auth/response/get_fuel_type_response.dart';
import 'package:owner/values/extensions/double_ext.dart';
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
import '../../values/passing_parameters.dart';
import '../../widgets/custom_info_dialog.dart';
import 'package:intl/intl.dart';
import '../auth/model/brand_model.dart';
import '../auth/model/color_model.dart';
import '../auth/response/get_brand_response.dart';
import '../auth/response/get_color_response.dart';
import '../auth/response/get_vehicle_name_response.dart';
import '../auth/response/get_vehicle_type_response.dart';
import '../auth/viewModel/vehicle_name_model.dart';
import '../vehicle_registration_models/Vehicle_type-model.dart';

class VehicleRegistrationPage extends StatefulWidget {
  const VehicleRegistrationPage({Key? key}) : super(key: key);

  @override
  State<VehicleRegistrationPage> createState() =>
      _VehicleRegistrationPageState();
}

class _VehicleRegistrationPageState extends State<VehicleRegistrationPage> {
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController ccCapacityController = TextEditingController();
  TextEditingController runningKmController = TextEditingController();
  TextEditingController pucExpiryController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  List<ColorModel> colorModelList = [];
  List<BrandModel> brandModelList = [];
  List<VehicleNameModel> vehicleNameModelList = [];
  List<VehicleTypeModel> vehicleTypeModelList = [];
  List<FuelTypeModel> fuelTypeModelList = [];
  List<DropdownMenuItem<String>> colorMenuItems = [];
  List<DropdownMenuItem<String>> fuelMenuItems = [];
  List<DropdownMenuItem<String>> vehicleTypeMenuItems = [];
  String? selectedBrandValue = null;
  String? selectedColorValue = null;
  String? selectedFuelValue = null;
  String? selectedVehicleNameValue = null;
  String? selectedcarrierValue = null;
  String? selectedAcValue = null;
  String? selectedRegisterYearValue = null;
  String? selectedVehicleTypeValue = null;
  bool isLoading = false;

  List<DropdownMenuItem<String>> get VehicleColorItems {
    List<DropdownMenuItem<String>> menuItemsData = colorMenuItems;
    return menuItemsData;
  }

  List<DropdownMenuItem<String>> get VehicleTypeItems {
    List<DropdownMenuItem<String>> menuItemsData = vehicleTypeMenuItems;
    return menuItemsData;
  }

  List<DropdownMenuItem<String>> get VehicleNameItems {
    List<DropdownMenuItem<String>> vehicleTypeItemsData = vehicleTypeMenuItems;
    return vehicleNameMenuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Yes", child: Text("Yes")),
      const DropdownMenuItem(value: "No", child: Text("No")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownCarrierItems {
    List<DropdownMenuItem<String>> carrierMenuItems = [
      const DropdownMenuItem(value: "Yes", child: Text("Yes")),
      const DropdownMenuItem(value: "No", child: Text("No")),
    ];
    return carrierMenuItems;
  }

  List<DropdownMenuItem<String>> get dropdownRegisterYearItems {
    List<DropdownMenuItem<String>> menuRegisterYearItems = [
      const DropdownMenuItem(value: "2016", child: Text("2016")),
      const DropdownMenuItem(value: "2017", child: Text("2017")),
      const DropdownMenuItem(value: "2018", child: Text("2018")),
      const DropdownMenuItem(value: "2019", child: Text("2019")),
      const DropdownMenuItem(value: "2020", child: Text("2020")),
      const DropdownMenuItem(value: "2021", child: Text("2021")),
      const DropdownMenuItem(value: "2022", child: Text("2022")),
      const DropdownMenuItem(value: "2023", child: Text("2023")),
    ];
    return menuRegisterYearItems;
  }

  List<DropdownMenuItem<String>> brandMenuItems = [];
  List<DropdownMenuItem<String>> vehicleNameMenuItems = [];

  List<DropdownMenuItem<String>> get dropdownBrandItems {
    List<DropdownMenuItem<String>> menuItemsData = brandMenuItems;
    return menuItemsData;
  }

  checkValidations() {
    if (vehicleNumberController.text.toString() == "" ||
        vehicleNumberController.text.toString() == null) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehicleNumberValidation,
          );
        },
      );
    } else if (selectedVehicleTypeValue.toString() == "" ||
        selectedVehicleTypeValue.toString() == null) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehicleTypeValidation,
          );
        },
      );
    } else if (selectedColorValue.toString() == "null" ||
        selectedColorValue.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehicleColorValidation,
          );
        },
      );
    } else if (selectedBrandValue.toString() == "null" ||
        selectedBrandValue == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehicleBrandValidation,
          );
        },
      );
    } else if (selectedVehicleNameValue.toString() == "null" ||
        selectedVehicleNameValue.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehicleNameValidation,
          );
        },
      );
    } else if (selectedRegisterYearValue.toString() == "null" ||
        selectedRegisterYearValue.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehicleRegisterYearValidation,
          );
        },
      );
    } else if (selectedAcValue.toString() == "null" ||
        selectedAcValue.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enteracValidation,
          );
        },
      );
    } else if (selectedFuelValue.toString() == "null" ||
        selectedFuelValue.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehicleFuelTypeValidation,
          );
        },
      );
    } else if (selectedcarrierValue.toString() == "null" ||
        selectedcarrierValue.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehicleCarrierValidation,
          );
        },
      );
    } else if (ccCapacityController.text.toString() == "null" ||
        ccCapacityController.text.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehicleCcCapacityValidation,
          );
        },
      );
    } else if (runningKmController.text.toString() == "null" ||
        runningKmController.text.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehicleRunningKmValidation,
          );
        },
      );
    } else if (pucExpiryController.text.toString() == "null" ||
        pucExpiryController.text.toString() == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.enterVehiclePucExpiryValidation,
          );
        },
      );
    } else {
      print("all data given.........");

      navigator.pushNamed(RouteName.vehicleRegistrationSecondPage, arguments: {
        PassingParameters.vehicleNumber: vehicleNumberController.text,
        PassingParameters.color: selectedColorValue,
        PassingParameters.brandName: selectedBrandValue,
        PassingParameters.vehicleName: selectedVehicleNameValue,
        PassingParameters.ccCapacity: ccCapacityController.text,
        PassingParameters.registerYear: selectedRegisterYearValue,
        PassingParameters.acAvailable: selectedAcValue,
        PassingParameters.runningKm: runningKmController.text,
        PassingParameters.fuelType: selectedFuelValue,
        PassingParameters.carrier: selectedcarrierValue,
        PassingParameters.pucExpiry: pucExpiryController.text,
        PassingParameters.vehicleId: vehicleId,
        PassingParameters.isEdit: isEdit,
      });
    }
  }

  @override
  void initState() {
    getFuelType(context: context);
    getColor(context: context);
    getBrand(context: context);
    super.initState();
  }

  var data;
  String vehicleId = "";
  String isEdit = "";
  String? _selectedTime;

  @override
  Future<void> didChangeDependencies() async {
    setState(() {
      isLoading = true;
    });
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        vehicleId = data["vehicleId"].toString();
        isEdit = data["isEdit"].toString();
        vehicleNumberController.text = data["vehicleNumber"].toString();
      });
    }

    setState(() {
      isLoading = false;
    });
    super.didChangeDependencies();
  }

  getBrand({
    required BuildContext context,
  }) async {
    final apiHandler = getBrandViewModel();
    setState(() {
      isLoading = true;
    });
    try {
      await apiHandler.getBrand(context: context).then((response) {
        var code = response;
        brandModelList = response.map((i) => BrandModel.fromJson(i)).toList();
        print("${brandModelList.length}  length.........");

        if (code != null) {
          setState(() {
            for (int i = 0; i < brandModelList.length; i++) {
              brandMenuItems.add(
                DropdownMenuItem(
                  value: brandModelList[i].brandsId.toString(),
                  child: Text(brandModelList[i].brandName),
                ),
              );
            }
            isLoading = false;
            setState(() {
              print("data sorted in drop down......");
            });
          });
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  getVehicleName(
      {required BuildContext context, required String? brandId}) async {
    final apiHandler = getVehicleNameViewModel();
    GetVehicleNameRequestModel request =
        GetVehicleNameRequestModel(brandId: brandId);
    try {
      await apiHandler
          .getVehicleName(context: context, request: request)
          .then((response) {
        var code = response;
        vehicleNameModelList =
            response.map((i) => VehicleNameModel.fromJson(i)).toList();
        print(
            "${vehicleNameModelList.length} vehicle name list length.........");

        if (code != null) {
          for (int i = 0; i < vehicleNameModelList.length; i++) {
            vehicleNameMenuItems.add(
              DropdownMenuItem(
                value: vehicleNameModelList[i].vehicleNameId.toString(),
                child: Text(
                  vehicleNameModelList[i].vehicleName.toString(),
                ),
              ),
            );
            setState(() {});
          }
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  getVehicleType({
    required BuildContext context,
  }) async {
    final apiHandler = getVehicleTypeViewModel();
    getVehicleTypeResponseModel request = getVehicleTypeResponseModel();
    try {
      await apiHandler.getVehicleType(context: context).then((response) {
        var code = response;

        vehicleTypeModelList =
            response.map((i) => VehicleTypeModel.fromJson(i)).toList();
        print(
            "${vehicleTypeModelList.length} vehicle name list length.........");
        /* print(
            vehicleTypeModelList[0].typeName.toString() + " vehicle type....");
*/
        if (code != null) {
          for (int i = 0; i < vehicleTypeModelList.length; i++) {
            vehicleTypeMenuItems.add(
              DropdownMenuItem(
                value: vehicleTypeModelList[i].vehicleTypesId.toString(),
                child: Text(vehicleTypeModelList[i].typeName),
              ),
            );
          }
          setState(() {});
        } else {}
        setState(() {});
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  getFuelType({
    required BuildContext context,
  }) async {
    final apiHandler = getFuelTypeViewModel();
    getFuelTypeResponseModel request = getFuelTypeResponseModel();
    try {
      await apiHandler.getFuelTypeName(context: context).then((response) {
        var code = response;
        fuelTypeModelList =
            response.map((i) => FuelTypeModel.fromJson(i)).toList();
        print("${fuelTypeModelList.length} fuel type list length.........");

        if (code != null) {
          for (int i = 0; i < fuelTypeModelList.length; i++) {
            fuelMenuItems.add(
              DropdownMenuItem(
                value: fuelTypeModelList[i].fuelTypeId.toString(),
                child: Text(fuelTypeModelList[i].fuelTypeName),
              ),
            );
            setState(() {});
          }
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String formattedDate = DateFormat("dd-MM-yyyy").format(selectedDate);
        pucExpiryController.text = formattedDate.toString();
        print("$selectedDate selected  date ");
      });
    }
  }

  getColor({
    required BuildContext context,
  }) async {
    final apiHandler = getColorViewModel();
    GetColorRequestModel request = GetColorRequestModel();
    try {
      await apiHandler
          .getColor(context: context, request: request)
          .then((response) {
        var code = response;
        colorModelList = response.map((i) => ColorModel.fromJson(i)).toList();
        print(colorModelList.length.toString() + "  length.........");

        if (code != null) {
          for (int i = 0; i < colorModelList.length; i++) {
            colorMenuItems.add(
              DropdownMenuItem(
                value: colorModelList[i].id.toString(),
                child: Text(
                  colorModelList[i].colorName.toString(),
                ),
              ),
            );
          }
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
                                readOnly: isEdit == "true" ? true : false,
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
                                    hintText: StringConstant.selectColor,
                                    fillColor: AppColor.white,
                                  ),
                                  dropdownColor: AppColor.white,
                                  isExpanded: true,
                                  value: selectedColorValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedColorValue = newValue!;
                                    });
                                  },
                                  items: VehicleColorItems,
                                ),
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
                                    hintText: StringConstant.selectBrand,
                                    fillColor: AppColor.white,
                                  ),
                                  dropdownColor: AppColor.white,
                                  isExpanded: true,
                                  value: selectedBrandValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedBrandValue = newValue!;
                                      print(
                                          "$selectedBrandValue selected brand value.....");
                                    });
                                    getVehicleName(
                                        context: context,
                                        brandId: selectedBrandValue.toString());
                                  },
                                  items: dropdownBrandItems,
                                ),
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.vehicleName,
                                style: textRegular.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.darkBlue),
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
                                    hintText: StringConstant.selectBrand,
                                    fillColor: AppColor.white,
                                  ),
                                  dropdownColor: AppColor.white,
                                  isExpanded: true,
                                  value: selectedVehicleNameValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedVehicleNameValue = newValue!;
                                    });
                                  },
                                  items: vehicleNameMenuItems,
                                ),
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
                                      RegExp('[\\.|\\,|\\-\\ ]')),
                                ],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.registerYear,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
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
                                    hintText: StringConstant.selectVehicleType,
                                    fillColor: AppColor.white,
                                  ),
                                  dropdownColor: AppColor.white,
                                  isExpanded: true,
                                  value: selectedRegisterYearValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedRegisterYearValue =
                                          newValue.toString();
                                    });
                                  },
                                  items: dropdownRegisterYearItems,
                                ),
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.acAvailable,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
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
                                    hintText: StringConstant.selectVehicleType,
                                    fillColor: AppColor.white,
                                  ),
                                  dropdownColor: AppColor.white,
                                  isExpanded: true,
                                  value: selectedAcValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedAcValue = newValue.toString();
                                    });
                                  },
                                  items: dropdownItems,
                                ),
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
                                      RegExp('[\\.|\\,|\\-\\ ]')),
                                ],
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.fuelType,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
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
                                    hintText: StringConstant.selectFuel,
                                    fillColor: AppColor.white,
                                  ),
                                  dropdownColor: AppColor.white,
                                  isExpanded: true,
                                  value: selectedFuelValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedFuelValue = newValue!;
                                    });
                                  },
                                  items: fuelMenuItems,
                                ),
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.carrier,
                                style: textRegular.copyWith(
                                    color: AppColor.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
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
                                        color: Colors.blue,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10.w),
                                    ),
                                    filled: false,
                                    contentPadding: EdgeInsets.all(14.w),
                                    hintText: StringConstant.selectFuel,
                                    fillColor: AppColor.white,
                                  ),
                                  dropdownColor: AppColor.white,
                                  isExpanded: true,
                                  value: selectedcarrierValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedcarrierValue = newValue!;
                                      print(
                                          "$selectedcarrierValue selected carrier Value selection");
                                    });
                                  },
                                  items: dropdownCarrierItems,
                                ),
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
                                onTap: () {
                                  _selectDate(context);
                                },
                                suffixIcon: InkWell(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: const Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                ),
                                validators: pinCodeValidator,
                                inputFormatters: [NoLeadingSpaceFormatter()],
                              ),
                              20.h.VBox,
                              AppButton(
                                StringConstant.next,
                                () {
                                  checkValidations();
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

/* navigator.pushNamed(
                                      RouteName.vehicleRegistrationSecondPage,
                                      arguments: {
                                        PassingParameters.vehicleNumber:
                                            vehicleNumberController.text,
                                        PassingParameters.vehicleType:
                                            selectedVehicleTypeValue,
                                        PassingParameters.color:
                                            selectedColorValue,
                                        PassingParameters.brandName:
                                            selectedBrandValue,
                                        PassingParameters.vehicleName:
                                            selectedVehicleNameValue,
                                        PassingParameters.ccCapacity:
                                            ccCapacityController.text,
                                        PassingParameters.registerYear:
                                            selectedRegisterYearValue,
                                        PassingParameters.acAvailable:
                                            selectedAcValue,
                                        PassingParameters.runningKm:
                                            runningKmController.text,
                                        PassingParameters.fuelType:
                                            selectedFuelValue,
                                        PassingParameters.carrier:
                                            selectedcarrierValue,
                                        PassingParameters.pucExpiry:
                                            pucExpiryController.text
                                      });*/
