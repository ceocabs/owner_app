import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/core/navigation/routes.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../values/validations.dart';
import '../../values/validator.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_form_filed.dart';

class AddDriverPage extends StatefulWidget {
  const AddDriverPage({Key? key}) : super(key: key);

  @override
  State<AddDriverPage> createState() => _AddDriverPageState();
}

class _AddDriverPageState extends State<AddDriverPage> {
  String countryCode = "+91";
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController driverIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.addDriver,
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
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: [NoLeadingSpaceFormatter()],
                        ),
                        10.h.VBox,
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
                          StringConstant.driverId,
                          style: textRegular.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColor.darkBlue,
                          ),
                        ),
                        5.h.VBox,
                        AppTextField(
                          label: StringConstant.driverId,
                          hint: StringConstant.driverId,
                          // validators: emailValidator,
                          controller: driverIdController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [NoLeadingSpaceFormatter()],
                        ),
                        20.h.VBox,
                        Text(
                          "You agree and acknowledge that you have consent to share personal data of the person that you're inviting to join your fleet. Invitation restrictions apply.",
                          style: textRegular.copyWith(
                              color: AppColor.greyColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        20.h.VBox,
                        AppButton(
                          StringConstant.addDriver,
                          () {
                            navigator.pushNamed(RouteName.driverDocumentsPage);
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
