import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/ui/auth/login_screen.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/widgets/button_widget.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../auth/response/assign_driver_owner_response.dart';
import '../auth/viewModel/assign_driver_owner_viewModel.dart';

class DriverConfirmationPage extends StatefulWidget {
  const DriverConfirmationPage({Key? key}) : super(key: key);

  @override
  State<DriverConfirmationPage> createState() => _DriverConfirmationPageState();
}

class _DriverConfirmationPageState extends State<DriverConfirmationPage> {
  String? driverName = "";
  String? driverId = "";
  String? driverImage = "";
  String? driverMobileNumber = "";
  String? driverWhatsappNumber = "";
  var data;

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        driverName = data["driverName"].toString();
        driverId = data["driverId"].toString();
        driverImage = data["profileImage"].toString();
        driverMobileNumber = data["mobileNo"].toString();
        driverWhatsappNumber = data["whatsappNumber"].toString();
      });
    }
    super.didChangeDependencies();
  }

  connectDrover({
    required BuildContext context,
    required String driverId,
    required String ownerId,
  }) async {
    final apiHandler = AssignDriverToOwnerViewModel();

    AssignDriverToOwnerRequestModel request =
        AssignDriverToOwnerRequestModel(driverId: driverId, ownerId: ownerId);

    try {
      await apiHandler
          .assignDriver(request: request, context: context)
          .then((response) {
        var code = response;
        print("$response response............");
        //List<dynamic> driverData = response;
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
          StringConstant.addDriver,
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
              width: MediaQuery.of(context).size.width,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 80.w,
                              width: 80.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.white),
                              child: ClipRRect(
                                child: Image.network(
                                  driverImage.toString(),
                                  height: 80.w,
                                  width: 80.w,
                                  fit: BoxFit.fill,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Image.asset(
                                      Res.user,
                                      height: 70.w,
                                      width: 70.w,
                                      fit: BoxFit.contain,
                                    );
                                  },
                                ),
                              ),
                            ),
                            5.h.VBox,
                            Center(
                              child: Container(
                                width: 60.w,
                                child: const RatingBar.readOnly(
                                  filledIcon: Icons.star,
                                  emptyIcon: Icons.star_border,
                                  initialRating: 4,
                                  size: 12,
                                  maxRating: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name  :  ${driverName}",
                              style:
                                  textBold.copyWith(color: AppColor.darkBlue),
                            ),
                            5.h.VBox,
                            Text(
                              "Mobile No   : +91 ${driverMobileNumber}",
                              style: textRegular.copyWith(
                                  color: AppColor.darkBlue,
                                  fontWeight: FontWeight.w600),
                            ),
                            5.h.VBox,
                            Text(
                              "Whatsapp No : +91 ${driverWhatsappNumber}",
                              style: textBold.copyWith(
                                  color: AppColor.darkBlue,
                                  fontWeight: FontWeight.w600),
                            ),
                            5.h.VBox,
                            Text(
                              "Driver Id   :  ${driverId}",
                              style: textRegular.copyWith(
                                  color: AppColor.darkBlue,
                                  fontWeight: FontWeight.w600),
                            ),
                            20.h.VBox,
                            AppButton(
                              StringConstant.connect,
                              () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.warning,
                                  headerAnimationLoop: true,
                                  animType: AnimType.topSlide,
                                  showCloseIcon: false,
                                  title: StringConstant.connect,
                                  desc:
                                      StringConstant.connectDriverConfirmation,
                                  descTextStyle: textBold.copyWith(
                                    fontSize: 20.sp,
                                    color: AppColor.dark,
                                  ),
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    connectDrover(
                                      context: context,
                                      ownerId: userId,
                                      driverId: driverId.toString(),
                                    );
                                  },
                                ).show();
                              },
                              height: 40.h,
                            ),
                            20.h.VBox,
                          ],
                        )
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
