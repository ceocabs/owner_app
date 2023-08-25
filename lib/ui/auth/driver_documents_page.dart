import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../../widgets/custom_input_formatter.dart';
import '../../widgets/text_form_filed.dart';

class DriverDocumentsPage extends StatefulWidget {
  const DriverDocumentsPage({Key? key}) : super(key: key);

  @override
  State<DriverDocumentsPage> createState() => _DriverDocumentsPageState();
}

class _DriverDocumentsPageState extends State<DriverDocumentsPage> {
  TextEditingController aadharCardNumberController = TextEditingController();
  TextEditingController panCardController = TextEditingController();
  TextEditingController licenseTypeController = TextEditingController();
  TextEditingController licenseCategoryController = TextEditingController();
  TextEditingController referenceIdController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController whatsAppNumberController = TextEditingController();
  String countryCode = "+91";
  bool isDriver = false;
  var data;

  bool isDriverBecomeOwner = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String firstName = "";
  String lastName = "";
  String email = "";
  String permanentAddress = "";
  String state = "";
  String city = "";
  String pinCode = "";
  String type = "";

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        firstName = data[PassingParameters.firstName].toString();
        lastName = data[PassingParameters.lastName].toString();
        email = data[PassingParameters.email].toString();
        permanentAddress = data[PassingParameters.permanentAddress].toString();
        state = data[PassingParameters.state].toString();
        city = data[PassingParameters.city].toString();
        pinCode = data[PassingParameters.pinCode].toString();
      });
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
          StringConstant.personalDetails,
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.h.VBox,
                          Text(
                            StringConstant.mobileNo,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            prefixIcon: SizedBox(
                              child: CountryCodePicker(
                                padding: const EdgeInsets.all(0),
                                showFlag: true,
                                flagWidth: 20.w,
                                showFlagMain: true,
                                onChanged: (code) {
                                  setState(() {
                                    countryCode = code.toString();
                                  });
                                },
                                textOverflow: TextOverflow.ellipsis,
                                textStyle: textMedium,
                                initialSelection: "+91",
                              ),
                            ),
                            controller: mobileNumberController,
                            validators: mobileValidator,
                            keyboardType: TextInputType.number,
                            label: StringConstant.enterYourPhone,
                            maxLength: 10,
                            keyboardAction: TextInputAction.done,
                            hint: StringConstant.enterYourPhone,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.whatsAppNumber,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            prefixIcon: SizedBox(
                              child: CountryCodePicker(
                                padding: const EdgeInsets.all(0),
                                showFlag: true,
                                flagWidth: 20.w,
                                showFlagMain: true,
                                onChanged: (code) {
                                  setState(() {
                                    countryCode = code.toString();
                                  });
                                },
                                textOverflow: TextOverflow.ellipsis,
                                textStyle: textMedium,
                                initialSelection: "+91",
                              ),
                            ),
                            controller: whatsAppNumberController,
                            validators: mobileValidator,
                            keyboardType: TextInputType.number,
                            label: StringConstant.whatsAppNumber,
                            maxLength: 10,
                            hint: StringConstant.whatsAppNumber,
                            keyboardAction: TextInputAction.done,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.aadharCardNumber,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: "0000-0000-0000",
                            hint: "0000-0000-0000",
                            controller: aadharCardNumberController,
                            validators: aadtharCardValidator,
                            inputFormatters: [
                              NoLeadingSpaceFormatter(),
                              CustomInputFormatter(inputLength: 12),
                            ],
                            keyboardType: TextInputType.number,
                            maxLength: 16,
                            keyboardAction: TextInputAction.next,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.panCardNumber,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: "AAAAA0000A",
                            hint: "AAAAA0000A",
                            controller: panCardController,
                            validators: panCardValidator,
                            textCapitalization: TextCapitalization.characters,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.text,
                            maxLength: 10,
                            keyboardAction: TextInputAction.next,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.referanceId,
                            style: textRegular.copyWith(
                              color: AppColor.darkBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AppTextField(
                            label: StringConstant.referanceId,
                            hint: StringConstant.referanceId,
                            controller: referenceIdController,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardAction: TextInputAction.next,
                          ),
                          30.h.VBox,
                          AppButton(
                            StringConstant.next,
                            () {
                              if (_formKey.currentState!.validate()) {
                                navigator.pushNamed(
                                  RouteName.uploadDocumentPage,
                                  arguments: {
                                    PassingParameters.firstName: firstName,
                                    PassingParameters.lastName: lastName,
                                    PassingParameters.email: email,
                                    PassingParameters.permanentAddress:
                                        permanentAddress,
                                    PassingParameters.state: state,
                                    PassingParameters.city: city,
                                    PassingParameters.pinCode: pinCode,
                                    PassingParameters.mobileNo:
                                        mobileNumberController.text,
                                    PassingParameters.whatsAppNumber:
                                        whatsAppNumberController.text,
                                    PassingParameters.aadharCardNumber:
                                        aadharCardNumberController.text,
                                    PassingParameters.panCardNumber:
                                        panCardController.text,
                                    PassingParameters.referanceId:
                                        referenceIdController.text,
                                    PassingParameters.userType: "Owner"
                                  },
                                );
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

/*  10.h.VBox,
                          Text(
                            StringConstant.selectAnyOne,
                            style: textRegular.copyWith(
                              color: AppColor.darkBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          10.h.VBox,
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  isDriver
                                      ? Image.asset(
                                          Res.tickCircle,
                                          height: 20.w,
                                          width: 20.w,
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              isDriver = true;
                                              isDriverBecomeOwner = false;
                                            });
                                          },
                                          child: Container(
                                            width: 20.w,
                                            height: 20.w,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColor.darkBlue,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                  10.w.HBox,
                                  Text(
                                    StringConstant.driver,
                                    style: textBold,
                                  )
                                ],
                              ),
                              10.w.HBox,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  isDriverBecomeOwner
                                      ? Image.asset(
                                          Res.tickCircle,
                                          height: 20.w,
                                          width: 20.w,
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              isDriverBecomeOwner = true;
                                              isDriver = false;
                                            });
                                          },
                                          child: Container(
                                            width: 20.w,
                                            height: 20.w,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColor.darkBlue,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                  10.w.HBox,
                                  Text(
                                    StringConstant.ownerAndDriver,
                                    style: textBold,
                                  )
                                ],
                              ),
                            ],
                          ),
                        */
