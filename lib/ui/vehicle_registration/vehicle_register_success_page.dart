import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/widgets/button_widget.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';

import '../../values/string_contsant.dart';
import '../../values/style.dart';

class VehicleRegisterSuccessPage extends StatefulWidget {
  const VehicleRegisterSuccessPage({Key? key}) : super(key: key);

  @override
  State<VehicleRegisterSuccessPage> createState() =>
      _VehicleRegisterSuccessPageState();
}

class _VehicleRegisterSuccessPageState
    extends State<VehicleRegisterSuccessPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.registrationSuccess,
          style: textBold.copyWith(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                navigator.pushNamedAndRemoveUntil(RouteName.homePage);
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Res.vehicleRegister,
                          height: 250.h,
                          width: 250.w,
                          fit: BoxFit.contain,
                        ),
                        Container(
                          width: 280.w,
                          child: Text(
                            StringConstant.registerVehicleSuccess,
                            style: textBold.copyWith(
                              fontSize: 20.sp,
                              color: AppColor.darkBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        20.h.VBox,
                        AppButton(
                          StringConstant.submit,
                          () {},
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
