import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/ui/auth/response/get_color_response.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/widgets/text_form_filed.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../values/validations.dart';
import '../../widgets/button_widget.dart';
import '../auth/model/brand_model.dart';
import '../auth/model/city_model.dart';
import '../auth/response/city_response.dart';
import '../auth/viewModel/city_viewModel.dart';
import '../auth/model/color_model.dart';
import '../auth/response/get_brand_response.dart';
import '../auth/model/state_model.dart';
import '../auth/response/state_response.dart';
import '../auth/viewModel/state_viewModel.dart';

class VehicleRegistrationDemoPage extends StatefulWidget {
  const VehicleRegistrationDemoPage({Key? key}) : super(key: key);

  @override
  State<VehicleRegistrationDemoPage> createState() =>
      _VehicleRegistrationDemoPageState();
}

class _VehicleRegistrationDemoPageState
    extends State<VehicleRegistrationDemoPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController =
      TextEditingController(text: "Maharashtra");
  List<CityModel> cityModelList = [];
  List<StateModel> stateModelList = [];
  int stateId = 0;
  String chooseCity = "";
  String chooseState = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedValue = null;
  String? selectedStateValue = null;
  String? selectedColorValue = null;
  String? selectedBrandValue = null;
  List<DropdownMenuItem<String>> menuItems = [];
  List<DropdownMenuItem<String>> stateMenuItems = [];
  List<DropdownMenuItem<String>> colorMenuItems = [];
  List<DropdownMenuItem<String>> brandMenuItems = [];

  List<BrandModel> brandModelList = [];

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItemsData = menuItems;
    return menuItemsData;
  }

  stateList({
    required BuildContext context,
  }) async {
    final apiHandler = StateViewModel();

    StateRequestModel request = StateRequestModel();

    try {
      await apiHandler
          .stateList(request: request, context: context)
          .then((response) {
        var code = response;
        List<dynamic> stateData = response;

        stateModelList = stateData.map((i) => StateModel.fromJson(i)).toList();
        print(stateModelList.length.toString() + " city model list.........");
        for (int i = 0; i < stateModelList.length; i++) {
          stateMenuItems.add(
            DropdownMenuItem(
              value: stateModelList[i].statesId.toString(),
              child: Text(
                stateModelList[i].stateName.toString(),
              ),
            ),
          );
        }
        setState(() {});
        print(response.toString() + " city api response........");
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print(e.toString() + " e...........");
    }
  }

  getBrand({
    required BuildContext context,
  }) async {
    final apiHandler = getBrandViewModel();

    try {
      await apiHandler.getBrand(context: context).then((response) {
        var code = response;
        brandModelList = response.map((i) => BrandModel.fromJson(i)).toList();
        print(brandModelList.length.toString() + "  length.........");

        if (code != null) {
          setState(() {
            for (int i = 0; i < brandModelList.length; i++) {
              brandMenuItems.add(
                DropdownMenuItem(
                  value: brandModelList[i].brandsId.toString(),
                  child: Text(brandModelList[i].brandName.toString()),
                ),
              );
            }
          });
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  List<ColorModel> colorModelList = [];

  colorList({
    required BuildContext context,
  }) async {
    final apiHandler = getColorViewModel();

    GetColorRequestModel request = GetColorRequestModel();

    try {
      await apiHandler
          .getColor(request: request, context: context)
          .then((response) {
        var code = response;
        List<dynamic> stateData = response;

        colorModelList = response.map((i) => ColorModel.fromJson(i)).toList();
        print(colorModelList.length.toString() + " city model list.........");
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
        setState(() {});
        print(response.toString() + " city api response........");
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print(e.toString() + " e...........");
    }
  }

  cityList({
    required BuildContext context,
    required String id,
  }) async {
    final apiHandler = CityViewModel();

    CityRequestModel request = CityRequestModel(stateId: id);

    try {
      await apiHandler
          .cityList(request: request, context: context)
          .then((response) {
        var code = response;
        setState(() {
          cityModelList.clear();
          menuItems.clear();
        });
        List<dynamic> cityData = response;

        cityModelList = cityData.map((i) => CityModel.fromJson(i)).toList();
        print(cityModelList.length.toString() + " city model list.........");
        for (int i = 0; i < cityModelList.length; i++) {
          menuItems.add(
            DropdownMenuItem(
              value: cityModelList[i].citiesId.toString(),
              child: Text(
                cityModelList[i].cityName.toString(),
              ),
            ),
          );
        }
        setState(() {});
        print(response.toString() + " city api response........");
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print(e.toString() + " e...........");
    }
  }

  @override
  void initState() {
    colorList(context: context);
    stateList(context: context);
    getBrand(context: context);
    super.initState();
  }

  //  cityList(context: context, id: "4");
  String countryCode = "+91";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.registration,
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
            Form(
              key: _formKey,
              child: Container(
                //   height: 520.h,
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
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 17.w,
                        top: 20.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 20.h.VBox,
                          Text(
                            StringConstant.vehicleNumber,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          ),
                          5.h.VBox,
                          /*AppTextField(
                            label: StringConstant.firstName,
                            hint: StringConstant.firstName,
                            controller: firstNameController,
                            //validators: firstNameValidator,
                            textCapitalization: TextCapitalization.characters,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.text,
                            maxLength: 20,
                          ),*/
                          AppTextField(
                            label: StringConstant.vehicleNumber,
                            hint: StringConstant.vehicleNumber,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.text,
                            // controller: vehicleNumberController,
                            maxLength: 20,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.color,
                            style: textRegular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          Container(
                            height: 41.h,
                            child: DropdownButtonFormField(
                              menuMaxHeight: 150.h,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: false,
                                contentPadding: EdgeInsets.all(14.w),
                                hintText: StringConstant.selectColorTitle,
                                fillColor: AppColor.white,
                              ),
                              dropdownColor: AppColor.white,
                              isExpanded: true,
                              value: selectedColorValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedColorValue = newValue!;
                                  print(
                                      "$selectedColorValue selectedColorValue value........");
                                  /*cityList(
                                      context: context,
                                      id: selectedStateValue.toString());*/
                                  // chooseState = selectedColorValue.toString();
                                });
                              },
                              items: colorMenuItems,
                            ),
                          ),
                          10.h.VBox,

                          Text(
                            StringConstant.brandName,
                            style: textRegular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          Container(
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
                                contentPadding: EdgeInsets.all(14),
                                hintText: "Select Brand",
                                fillColor: AppColor.white,
                              ),
                              dropdownColor: AppColor.white,
                              isExpanded: true,
                              value: selectedBrandValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedBrandValue = newValue!;
                                  print(
                                      "$selectedBrandValue selectedColorValue value........");
                                });
                              },
                              items: brandMenuItems,
                            ),
                          ),

                          Text(
                            StringConstant.email,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.email,
                            hint: StringConstant.email,
                            controller: emailIdController,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.emailAddress,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.permanentAddress,
                            style: textRegular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.permanentAddress,
                            hint: StringConstant.permanentAddress,
                            textCapitalization: TextCapitalization.characters,
                            keyboardType: TextInputType.streetAddress,
                            controller: permanentAddressController,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.state,
                            style: textRegular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          Container(
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
                                hintText: "Select State",
                                fillColor: AppColor.white,
                              ),
                              dropdownColor: AppColor.white,
                              isExpanded: true,
                              value: selectedStateValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedStateValue = newValue!;
                                  chooseState = selectedStateValue.toString();

                                  print(
                                      "$selectedStateValue state value........");
                                  cityList(
                                      context: context,
                                      id: selectedStateValue.toString());
                                });
                              },
                              items: stateMenuItems,
                            ),
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.city,
                            style: textRegular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.darkBlue),
                          ),

                          Container(
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: false,
                                contentPadding: EdgeInsets.all(14.w),
                                hintText: "Select city",
                                fillColor: AppColor.white,
                              ),
                              dropdownColor: AppColor.white,
                              isExpanded: true,
                              value: selectedValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue!;
                                  chooseCity = selectedValue.toString();
                                  print("$selectedValue city value.......");
                                });
                              },
                              items: dropdownItems,
                            ),
                          ),
                          5.h.VBox,
                          10.h.VBox,
                          Text(
                            StringConstant.pinCode,
                            style: textRegular.copyWith(
                                color: AppColor.darkBlue,
                                fontWeight: FontWeight.w500),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: "000000",
                            hint: "000000",
                            maxLength: 6,
                            //validators: pinCodeValidator,
                            controller: pinCodeController,
                            keyboardType: TextInputType.number,
                            keyboardAction: TextInputAction.done,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          AppButton(
                            StringConstant.next,
                            () {
                              if (_formKey.currentState!.validate()) {
                                if (selectedValue != null) {
                                } else {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    headerAnimationLoop: true,
                                    animType: AnimType.topSlide,
                                    showCloseIcon: false,
                                    title: StringConstant.warning,
                                    desc: StringConstant.selectVehicle,
                                    descTextStyle: textBold.copyWith(
                                        fontSize: 20.sp, color: AppColor.dark),
                                    btnCancelOnPress: () {},
                                    onDismissCallback: (type) {},
                                    btnOkOnPress: () {},
                                  ).show();
                                }
                              }
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

/*  navigator.pushNamed(
                                      RouteName.driverDocumentsPage,
                                      arguments: {
                                        PassParameter.firstName:
                                        firstNameController.text,
                                        PassParameter.lastName:
                                        lastNameController.text,
                                        PassParameter.email:
                                        emailIdController.text,
                                        PassParameter.permanentAddress:
                                        permanentAddressController.text,
                                        PassParameter.city: chooseCity,
                                        PassParameter.state: chooseState,
                                        PassParameter.pinCode:
                                        pinCodeController.text
                                      });*/
