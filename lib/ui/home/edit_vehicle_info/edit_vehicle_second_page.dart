import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:intl/intl.dart';
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

class EditVehicleSecondPage extends StatefulWidget {
  const EditVehicleSecondPage({Key? key}) : super(key: key);

  @override
  State<EditVehicleSecondPage> createState() => _EditVehicleSecondPageState();
}

class _EditVehicleSecondPageState extends State<EditVehicleSecondPage> {
  TextEditingController insuranceCompanyNameController =
      TextEditingController();
  TextEditingController insuranceTypeController = TextEditingController();
  TextEditingController insuranceExpiryController = TextEditingController();
  TextEditingController fitnessExpiryController = TextEditingController();
  TextEditingController permitExpiryController = TextEditingController();
  TextEditingController roadTaxExpiryController = TextEditingController();
  TextEditingController authorisationExpiryController = TextEditingController();
  TextEditingController pucExpiryDateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  bool isEdit = false;
  String? _selectedTime;

  Future<void> _selectDate(BuildContext context, int index) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String formattedDate = DateFormat.yMMMd().format(selectedDate);
        if (index == 1) {
          insuranceExpiryController.text = formattedDate.toString();
        } else if (index == 2) {
          fitnessExpiryController.text = formattedDate.toString();
        } else if (index == 3) {
          permitExpiryController.text = formattedDate.toString();
        } else if (index == 4) {
          roadTaxExpiryController.text = formattedDate.toString();
        } else if (index == 5) {
          authorisationExpiryController.text = formattedDate.toString();
        } else if (index == 6) {
          pucExpiryDateController.text = formattedDate.toString();
        }
      });
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
          StringConstant.vehicleInfo,
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: InkWell(
              onTap: () {
                setState(() {
                  isEdit = true;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringConstant.edit,
                    style: textBold.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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
                      borderRadius: BorderRadius.circular(20.0),
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
                          AppTextField(
                            label: StringConstant.insuranceCompanyName,
                            hint: StringConstant.insuranceCompanyName,
                            validators: firstNameValidator,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.text,
                            keyboardAction: TextInputAction.next,
                            readOnly: isEdit ? false : true,
                            controller: insuranceCompanyNameController,
                            maxLength: 20,
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
                          AppTextField(
                            label: StringConstant.insuranceType,
                            hint: StringConstant.insuranceType,
                            validators: lastNameValidator,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.number,
                            readOnly: isEdit ? false : true,
                            keyboardAction: TextInputAction.next,
                            controller: insuranceTypeController,
                            maxLength: 20,
                          ),
                          10.h.VBox,
                          Text(
                            "PUC Expiry",
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.pucExpiry,
                            hint: StringConstant.pucExpiry,
                            validators: lastNameValidator,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            readOnly: isEdit ? false : true,
                            suffixIcon: InkWell(
                              onTap: () {
                                _selectDate(context, 6);
                              },
                              child: const Icon(Icons.calendar_month_outlined),
                            ),
                            keyboardType: TextInputType.number,
                            keyboardAction: TextInputAction.next,
                            controller: pucExpiryDateController,
                            maxLength: 20,
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
                            readOnly: isEdit ? false : true,
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
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.fitnessExpiry,
                            hint: StringConstant.fitnessExpiry,
                            validators: addressValidator,
                            readOnly: isEdit ? false : true,
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
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.permitExpiry,
                            hint: StringConstant.permitExpiry,
                            validators: stateValidator,
                            readOnly: isEdit ? false : true,
                            suffixIcon: InkWell(
                              onTap: () {
                                _selectDate(context, 3);
                              },
                              child: const Icon(Icons.calendar_month_outlined),
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
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.roadTaxExpiry,
                            hint: StringConstant.roadTaxExpiry,
                            validators: cityValidator,
                            readOnly: isEdit ? false : true,
                            suffixIcon: InkWell(
                              onTap: () {
                                _selectDate(context, 4);
                              },
                              child: const Icon(Icons.calendar_month_outlined),
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
                            suffixIcon: InkWell(
                              onTap: () {
                                _selectDate(context, 5);
                              },
                              child: const Icon(Icons.calendar_month_outlined),
                            ),
                            readOnly: isEdit ? false : true,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          AppButton(StringConstant.next, () {
                            if (isEdit == true) {
                              setState(() {
                                isEdit = false;
                              });
                            }
                            navigator.pushNamed(RouteName.editVehicleThirdPage);
                          }, height: 41.h),
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
