import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class EditVehicleFirstPage extends StatefulWidget {
  const EditVehicleFirstPage({Key? key}) : super(key: key);

  @override
  State<EditVehicleFirstPage> createState() => _EditVehicleFirstPageState();
}

class _EditVehicleFirstPageState extends State<EditVehicleFirstPage> {
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController colorTypeController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController ccCapacityController = TextEditingController();
  TextEditingController registerYearController = TextEditingController();
  TextEditingController acAvailableController = TextEditingController();
  TextEditingController runningKmController = TextEditingController();
  TextEditingController fuelTypeController = TextEditingController();
  TextEditingController carrierController = TextEditingController();
  TextEditingController pucExpiryController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isEdit = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        pucExpiryController.text = selectedDate.toString();
        print("$selectedDate selected  date ");
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
                          validators: firstNameValidator,
                          readOnly: isEdit ? false : true,
                          inputFormatters: [NoLeadingSpaceFormatter()],
                          keyboardType: TextInputType.number,
                          controller: vehicleNumberController,
                          maxLength: 20,
                        ),
                        10.h.VBox,
                        Text(
                          StringConstant.vehicleType,
                          style: textRegular.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColor.darkBlue,
                          ),
                        ),
                        5.h.VBox,
                        AppTextField(
                          label: StringConstant.vehicleType,
                          hint: StringConstant.vehicleType,
                          controller: vehicleTypeController,
                          validators: lastNameValidator,
                          readOnly: isEdit ? false : true,
                          inputFormatters: [NoLeadingSpaceFormatter()],
                          keyboardType: TextInputType.number,
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
                          readOnly: isEdit ? false : true,
                          controller: colorTypeController,
                          validators: emailValidator,
                          inputFormatters: [NoLeadingSpaceFormatter()],
                        ),
                        10.h.VBox,
                        Text(
                          StringConstant.brandName,
                          style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue),
                        ),
                        5.h.VBox,
                        AppTextField(
                          label: StringConstant.brandName,
                          hint: StringConstant.brandName,
                          controller: brandNameController,
                          readOnly: isEdit ? false : true,
                          validators: addressValidator,
                          inputFormatters: [NoLeadingSpaceFormatter()],
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
                          label: StringConstant.vehicleName,
                          hint: StringConstant.vehicleName,
                          controller: vehicleNameController,
                          validators: stateValidator,
                          readOnly: isEdit ? false : true,
                          inputFormatters: [NoLeadingSpaceFormatter()],
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
                          readOnly: isEdit ? false : true,
                          controller: ccCapacityController,
                          inputFormatters: [NoLeadingSpaceFormatter()],
                        ),
                        10.h.VBox,
                        Text(
                          StringConstant.registerYear,
                          style: textRegular.copyWith(
                              color: AppColor.darkBlue,
                              fontWeight: FontWeight.w500),
                        ),
                        AppTextField(
                          label: StringConstant.registerYear,
                          hint: StringConstant.registerYear,
                          validators: pinCodeValidator,
                          readOnly: isEdit ? false : true,
                          controller: ccCapacityController,
                          inputFormatters: [NoLeadingSpaceFormatter()],
                        ),
                        10.h.VBox,
                        Text(
                          StringConstant.acAvailable,
                          style: textRegular.copyWith(
                              color: AppColor.darkBlue,
                              fontWeight: FontWeight.w500),
                        ),
                        AppTextField(
                          label: StringConstant.acAvailable,
                          hint: StringConstant.acAvailable,
                          validators: pinCodeValidator,
                          readOnly: isEdit ? false : true,
                          controller: acAvailableController,
                          inputFormatters: [NoLeadingSpaceFormatter()],
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
                          readOnly: isEdit ? false : true,
                          validators: pinCodeValidator,
                          inputFormatters: [NoLeadingSpaceFormatter()],
                        ),
                        10.h.VBox,
                        Text(
                          StringConstant.fuelType,
                          style: textRegular.copyWith(
                              color: AppColor.darkBlue,
                              fontWeight: FontWeight.w500),
                        ),
                        AppTextField(
                          label: StringConstant.fuelType,
                          hint: StringConstant.fuelType,
                          controller: fuelTypeController,
                          readOnly: isEdit ? false : true,
                          validators: pinCodeValidator,
                          inputFormatters: [NoLeadingSpaceFormatter()],
                        ),
                        10.h.VBox,
                        Text(
                          StringConstant.carrier,
                          style: textRegular.copyWith(
                              color: AppColor.darkBlue,
                              fontWeight: FontWeight.w500),
                        ),
                        AppTextField(
                          label: StringConstant.carrier,
                          hint: StringConstant.carrier,
                          controller: carrierController,
                          readOnly: isEdit ? false : true,
                          validators: pinCodeValidator,
                          inputFormatters: [NoLeadingSpaceFormatter()],
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
                          readOnly: isEdit ? false : true,
                          suffixIcon: InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: const Icon(Icons.calendar_month_outlined),
                          ),
                          validators: pinCodeValidator,
                          inputFormatters: [NoLeadingSpaceFormatter()],
                        ),
                        20.h.VBox,
                        AppButton(
                          isEdit ? StringConstant.update : StringConstant.next,
                          () {
                            setState(() {
                              if (isEdit == true) {
                                isEdit = false;
                              }
                            });
                            navigator
                                .pushNamed(RouteName.editVehicleSecondPage);
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
