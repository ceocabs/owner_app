import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/widgets/upload_documet_widget.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../core/navigation/routes.dart';
import '../../../res.dart';
import '../../../values/colors.dart';
import '../../../values/string_contsant.dart';
import '../../../values/style.dart';
import '../../../widgets/button_widget.dart';

class EditVehicleThirdPage extends StatefulWidget {
  const EditVehicleThirdPage({Key? key}) : super(key: key);

  @override
  State<EditVehicleThirdPage> createState() => _EditVehicleThirdPageState();
}

class _EditVehicleThirdPageState extends State<EditVehicleThirdPage> {
  String vehicleFrontImage = "";
  String vehicleBackImage = "";
  String vehicleRightImage = "";
  String vehicleLeftImage = "";
  String rcFrontImage = "";
  String rcBackImage = "";
  String insuranceImage = "";
  String fitnessImage = "";
  bool isUploaded = false;

  File? vehicleFrontImageFile;
  File? vehicleBackImageFile;
  File? vehicleRightImageFile;
  File? vehicleLeftImageFile;
  File? rcFrontImageFile;
  File? rcBackImageFile;
  File? insuranceImageFile;
  File? fitnessImageFile;

  bool isEdit = false;

  File? image;
  bool isVehicleFrontPic = false;
  bool isVehicleBackPic = false;
  bool isVehicleRightPic = false;
  bool isVehicleLeftPic = false;
  bool isRcBookFrontPic = false;
  bool isRcBookBackPic = false;
  bool isInsurancePic = false;
  bool isFitnessPic = false;

  Future pickImageFromCamara(int i) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);

      setState(() {
        isUploaded = true;
      });
      if (i == 1) {
        vehicleBackImageFile = imageTemp;
        isVehicleFrontPic = true;
        setState(() {});
      } else if (i == 2) {
        vehicleBackImageFile = imageTemp;
        isVehicleBackPic = true;
      } else if (i == 3) {
        vehicleRightImageFile = imageTemp;
        isVehicleRightPic = true;
      } else if (i == 4) {
        vehicleLeftImageFile = imageTemp;
        isVehicleLeftPic = true;
      } else if (i == 5) {
        rcBackImageFile = imageTemp;
        isRcBookFrontPic = true;
      } else if (i == 6) {
        rcBackImageFile = imageTemp;
        isRcBookBackPic = true;
      } else if (i == 7) {
        insuranceImageFile = imageTemp;
        isInsurancePic = true;
      } else if (i == 8) {
        fitnessImageFile = imageTemp;
        isFitnessPic = true;
      }

      //setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void checkValidation() {
    if (vehicleFrontImage == "" || vehicleFrontImage == null) {
    } else if (vehicleBackImage == "" || vehicleBackImage == null) {
    } else if (vehicleRightImage == "" || vehicleRightImage == null) {
    } else if (vehicleLeftImage == "" || vehicleLeftImage == "") {
    } else if (rcFrontImage == "" || rcFrontImage == null) {
    } else if (rcBackImage == "" || rcBackImage == "") {
    } else if (insuranceImage == "" || insuranceImage == "") {
    } else if (fitnessImage == "" || fitnessImage == "") {}
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.uploadDocument,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isEdit = true;
                    });
                  },
                  child: Text(
                    StringConstant.edit,
                    style: textBold.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        color: AppColor.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
              child: Container(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UploadDocumentWidget(
                                titleName: StringConstant.vehicleFrontImage,
                                isUploaded: isUploaded ? true : false,
                                file: vehicleFrontImageFile,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(1);
                                  });
                                },
                              ),
                              UploadDocumentWidget(
                                titleName: StringConstant.vehicleBackImage,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(2);
                                  });
                                },
                                isUploaded: isVehicleBackPic ? true : false,
                                file: vehicleBackImageFile,
                              ),
                            ],
                          ),
                          20.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UploadDocumentWidget(
                                titleName: StringConstant.vehicleRight,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(3);
                                  });
                                },
                                isUploaded: isVehicleRightPic ? true : false,
                                file: vehicleRightImageFile,
                              ),
                              UploadDocumentWidget(
                                titleName: StringConstant.vehicleLeft,
                                isUploaded: isVehicleLeftPic ? true : false,
                                file: vehicleLeftImageFile,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(4);
                                  });
                                },
                              ),
                            ],
                          ),
                          20.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UploadDocumentWidget(
                                titleName: StringConstant.rcFrontPic,
                                isUploaded: isRcBookFrontPic ? true : false,
                                file: rcFrontImageFile,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(5);
                                  });
                                },
                              ),
                              UploadDocumentWidget(
                                titleName: StringConstant.rcBackPic,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(6);
                                  });
                                },
                                isUploaded: isRcBookBackPic ? true : false,
                                file: rcBackImageFile,
                              ),
                            ],
                          ),
                          20.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UploadDocumentWidget(
                                titleName: StringConstant.insurancePhoto,
                                isUploaded: isInsurancePic ? true : false,
                                file: insuranceImageFile,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(5);
                                  });
                                },
                              ),
                              UploadDocumentWidget(
                                titleName: StringConstant.fitnessPhoto,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(6);
                                  });
                                },
                                isUploaded: isFitnessPic ? true : false,
                                file: fitnessImageFile,
                              ),
                            ],
                          ),
                          20.h.VBox,
                          AppButton(
                            isEdit
                                ? StringConstant.update
                                : StringConstant.next,
                            () {
                              navigator
                                  .pushNamed(RouteName.editVehicleFourthPage);
                            },
                            height: 41.h,
                          ),
                          30.h.VBox
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
