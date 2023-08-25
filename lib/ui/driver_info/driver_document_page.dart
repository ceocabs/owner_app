import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../util/app_utils.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../values/validations.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_form_filed.dart';

class DriverDocumentPage extends StatefulWidget {
  const DriverDocumentPage({Key? key}) : super(key: key);

  @override
  State<DriverDocumentPage> createState() => _DriverDocumentPageState();
}

class _DriverDocumentPageState extends State<DriverDocumentPage> {
  TextEditingController aadharCardNumberController = TextEditingController();
  TextEditingController panCardController = TextEditingController();
  TextEditingController drivingLicenseNoController = TextEditingController();
  TextEditingController drivingLicenseLastDateController =
      TextEditingController();
  TextEditingController licenseTypeController = TextEditingController();
  TextEditingController licenseCategoryController = TextEditingController();
  TextEditingController referenceIdController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController whatsAppNumberController = TextEditingController();
  String countryCode = "+91";
  bool isDriver = false;
  bool isDriverBecomeOwner = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    borderRadius: BorderRadius.circular(20.w),
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
                                color: AppColor.darkBlue),
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
                            keyboardType: TextInputType.number,
                            label: StringConstant.whatsAppNumber,
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
                            label: StringConstant.aadharCardNumber,
                            hint: StringConstant.aadharCardNumber,
                            controller: aadharCardNumberController,
                            keyboardType: TextInputType.number,
                            maxLength: 20,
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
                            label: StringConstant.panCardNumber,
                            hint: StringConstant.panCardNumber,
                            controller: panCardController,
                            keyboardType: TextInputType.text,
                            maxLength: 20,
                            keyboardAction: TextInputAction.next,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.drivingLicenseNo,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.drivingLicenseNo,
                            hint: StringConstant.drivingLicenseNo,
                            controller: drivingLicenseNoController,
                            keyboardAction: TextInputAction.next,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.drivingLicenceType,
                            style: textRegular.copyWith(
                                color: AppColor.darkBlue,
                                fontWeight: FontWeight.w500),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.drivingLicenceType,
                            hint: StringConstant.drivingLicenceType,
                            controller: referenceIdController,
                            keyboardAction: TextInputAction.next,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.drivingLicenseExpiry,
                            style: textRegular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.drivingLicenseExpiry,
                            hint: StringConstant.drivingLicenseExpiry,
                            controller: drivingLicenseLastDateController,
                            keyboardAction: TextInputAction.next,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.referanceId,
                            style: textRegular.copyWith(
                                color: AppColor.darkBlue,
                                fontWeight: FontWeight.w500),
                          ),
                          AppTextField(
                            label: StringConstant.referanceId,
                            hint: StringConstant.referanceId,
                            controller: referenceIdController,
                            keyboardAction: TextInputAction.next,
                          ),
                          10.h.VBox,
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
                          30.h.VBox,
                          AppButton(
                            StringConstant.next,
                            () {
                              if (_formKey.currentState!.validate()) {
                                if (isDriver == false &&
                                    isDriverBecomeOwner == false) {
                                  showSnackBar(
                                    context,
                                    StringConstant
                                        .driverOptionSelectionValidation,
                                  );
                                } else {
                                  navigator.pushNamed(
                                      RouteName.driverDocumentImagePage);
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
