import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/ui/auth/model/city_model.dart';
import 'package:owner/ui/auth/response/city_response.dart';
import 'package:owner/ui/auth/viewModel/city_viewModel.dart';
import 'package:owner/ui/auth/model/state_model.dart';
import 'package:owner/ui/auth/response/state_response.dart';
import 'package:owner/ui/auth/viewModel/state_viewModel.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/passing_parameters.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../values/validations.dart';
import '../../values/validator.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_form_filed.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedValue = null;
  String countryCode = "+91";
  List<CityModel> cityModelList = [];
  List<StateModel> stateModelList = [];
  int stateId = 0;
  String chooseCity = "";
  String chooseState = "";

  String? selectedStateValue = null;
  List<DropdownMenuItem<String>> menuItems = [];
  List<DropdownMenuItem<String>> stateMenuItems = [];

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItemsData = menuItems;
    return menuItemsData;
  }

  @override
  void initState() {
    stateList(context: context);
    super.initState();
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
        print("${stateModelList.length} city model list.........");
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
        print("$response city api response........");
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
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
        print("${cityModelList.length} city model list.........");
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
        print("$response city api response........");
        if (code != null) {
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
          StringConstant.registration,
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
            Form(
              key: _formKey,
              child: Container(
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
                        top: 20.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstant.firstName,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.firstName,
                            hint: StringConstant.firstName,
                            controller: firstNameController,
                            textCapitalization: TextCapitalization.characters,
                            validators: firstNameValidator,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.text,
                            maxLength: 20,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.lastName,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.lastName,
                            hint: StringConstant.lastName,
                            controller: lastNameController,
                            textCapitalization: TextCapitalization.characters,
                            validators: lastNameValidator,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.text,
                            maxLength: 20,
                          ),
                          10.h.VBox,
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
                            validators: emailValidator,
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
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.permanentAddress,
                            hint: StringConstant.permanentAddress,
                            validators: addressValidator,
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
                              color: AppColor.darkBlue,
                            ),
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
                                    color: Colors.blue,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                filled: false,
                                contentPadding: EdgeInsets.all(14.w),
                                hintText: StringConstant.selectState,
                                fillColor: AppColor.white,
                              ),
                              dropdownColor: AppColor.white,
                              isExpanded: true,
                              value: selectedStateValue,
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    selectedStateValue = newValue!;
                                    chooseState = selectedStateValue.toString();
                                    print(
                                        "$selectedStateValue state value........");
                                    cityList(
                                      context: context,
                                      id: selectedStateValue.toString(),
                                    );
                                  },
                                );
                              },
                              items: stateMenuItems,
                            ),
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.city,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
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
                                    color: Colors.blue,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                filled: false,
                                contentPadding: EdgeInsets.all(14.w),
                                hintText: StringConstant.selectCityHintText,
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
                            label: StringConstant.pinCodeHintText,
                            hint: StringConstant.pinCodeHintText,
                            validators: pinCodeValidator,
                            controller: pinCodeController,
                            keyboardType: TextInputType.number,
                            maxLength: 8,
                            keyboardAction: TextInputAction.done,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          AppButton(
                            StringConstant.next,
                            () {
                              if (_formKey.currentState!.validate()) {
                                if (selectedValue != null) {
                                  navigator.pushNamed(
                                      RouteName.driverDocumentsPage,
                                      arguments: {
                                        PassingParameters.firstName:
                                            firstNameController.text,
                                        PassingParameters.lastName:
                                            lastNameController.text,
                                        PassingParameters.email:
                                            emailIdController.text,
                                        PassingParameters.permanentAddress:
                                            permanentAddressController.text,
                                        PassingParameters.city: selectedValue,
                                        PassingParameters.pinCode:
                                            pinCodeController.text
                                      });
                                } else {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    headerAnimationLoop: true,
                                    animType: AnimType.topSlide,
                                    showCloseIcon: false,
                                    title: StringConstant.warning,
                                    desc: StringConstant.selectCity,
                                    descTextStyle: textBold.copyWith(
                                      fontSize: 20.sp,
                                      color: AppColor.dark,
                                    ),
                                    btnCancelOnPress: () {},
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
