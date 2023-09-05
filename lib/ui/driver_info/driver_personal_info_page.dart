import 'package:flutter/material.dart';
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
import '../../widgets/button_widget.dart';
import '../../widgets/text_form_filed.dart';

class DriverPersonaInfoPage extends StatefulWidget {
  const DriverPersonaInfoPage({Key? key}) : super(key: key);

  @override
  State<DriverPersonaInfoPage> createState() => _DriverPersonaInfoPageState();
}

class _DriverPersonaInfoPageState extends State<DriverPersonaInfoPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String countryCode = "+91";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                          // 20.h.VBox,
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
                            controller: emailIdController,
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
                            keyboardType: TextInputType.streetAddress,
                            controller: permanentAddressController,
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
                          AppTextField(
                            label: StringConstant.state,
                            hint: StringConstant.state,
                            controller: stateController,
                            keyboardType: TextInputType.streetAddress,
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
                          AppTextField(
                            label: StringConstant.city,
                            hint: StringConstant.city,
                            controller: cityController,
                            keyboardType: TextInputType.streetAddress,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.pinCode,
                            style: textRegular.copyWith(
                              color: AppColor.darkBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.pinCode,
                            hint: StringConstant.pinCode,
                            controller: pinCodeController,
                            keyboardType: TextInputType.number,
                            keyboardAction: TextInputAction.done,
                          ),
                          10.h.VBox,
                          AppButton(
                            StringConstant.next,
                            () {
                              navigator.pushNamed(RouteName.driverDocumentPage);
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
