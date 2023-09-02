import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/widgets/button_widget.dart';

import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/text_form_filed.dart';

class DriverInfoPage extends StatefulWidget {
  const DriverInfoPage({Key? key}) : super(key: key);

  @override
  State<DriverInfoPage> createState() => _DriverInfoPageState();
}

class _DriverInfoPageState extends State<DriverInfoPage> {
  TextEditingController driverNameController = TextEditingController();
  TextEditingController driverEmailController = TextEditingController();
  TextEditingController driverMobileNoController = TextEditingController();
  TextEditingController driverWhatsAppNumberController =
      TextEditingController();
  TextEditingController driverAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColor.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h.VBox,
              Container(
                width: 450.w,
                //  height: 450.h,
                padding: EdgeInsets.only(
                  right: 20.w,
                  left: 20.w,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 20.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.driverName,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label: StringConstant.driverName,
                              hint: StringConstant.driverName,
                              readOnly: true,
                              controller: driverNameController,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.driverEmailIdTitle,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label: StringConstant.driverEmailIdTitle,
                              hint: StringConstant.driverEmailIdTitle,
                              readOnly: true,
                              controller: driverEmailController,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.driverEmailIdTitle,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label: StringConstant.driverEmailIdTitle,
                              hint: StringConstant.driverEmailIdTitle,
                              readOnly: true,
                              controller: driverEmailController,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.driverMobileNoTitle,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label: StringConstant.driverMobileNoTitle,
                              hint: StringConstant.driverMobileNoTitle,
                              readOnly: true,
                              controller: driverMobileNoController,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.driverWhatsappNumberTitle,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label: StringConstant.driverWhatsappNumberTitle,
                              hint: StringConstant.driverWhatsappNumberTitle,
                              readOnly: true,
                              controller: driverWhatsAppNumberController,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.driverAddressTitle,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label: StringConstant.driverAddressTitle,
                              hint: StringConstant.driverAddressTitle,
                              readOnly: true,
                              controller: driverAddressController,
                            )
                          ],
                        ),
                        10.h.VBox,
                        AppButton(StringConstant.next, () {
                          navigator.pushNamed(RouteName.driverInfoSecondPage);
                        }, height: 40.h),
                        10.h.VBox,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
