import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../util/app_utils.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/upload_documet_widget.dart';

class DriverDocumentImagePage extends StatefulWidget {
  const DriverDocumentImagePage({Key? key}) : super(key: key);

  @override
  State<DriverDocumentImagePage> createState() =>
      _DriverDocumentImagePageState();
}

class _DriverDocumentImagePageState extends State<DriverDocumentImagePage> {
  String profileImage = "";
  String panCardImage = "";
  String drivingLicenseFrontImage = "";
  String drivingLicenseBackImage = "";
  String aadharCardFrontImage = "";
  String aadharCardBackImage = "";

  File? image;
  File? profileImageFile;
  File? panCardImageFile;
  File? drivingLicenseFrontImageFile;
  File? drivingLicenseBackImageFile;
  File? aadharCardFrontImageFile;
  File? aadharCardBackImageFile;

  bool isProfileImage = false;
  bool isPanCardImage = false;
  bool isDrivingLicenseFrontImage = false;
  bool isDrivingLicenseBackImage = false;
  bool isAadharCardFrontImage = false;
  bool isAadharCardBackImage = false;
  bool isUploaded = false;

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageFromCamara(int i) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        isUploaded = true;
      });
      if (i == 1) {
        profileImageFile = imageTemp;
        isProfileImage = true;
      } else if (i == 2) {
        panCardImageFile = imageTemp;
        isPanCardImage = true;
      } else if (i == 3) {
        drivingLicenseFrontImageFile = imageTemp;
        isDrivingLicenseFrontImage = true;
      } else if (i == 4) {
        drivingLicenseBackImageFile = imageTemp;
        isDrivingLicenseBackImage = true;
      } else if (i == 5) {
        aadharCardFrontImageFile = imageTemp;
        isAadharCardFrontImage = true;
      } else if (i == 6) {
        aadharCardBackImageFile = imageTemp;
        isAadharCardBackImage = true;
      }

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void checkValidation() {
    if (profileImage == "" || profileImage == null) {
      showMessage(StringConstant.profileImageValidation);
    } else if (panCardImage == "" || panCardImage == null) {
      showMessage(StringConstant.panCardImageValidation);
    } else if (drivingLicenseFrontImage == "" ||
        drivingLicenseFrontImage == null) {
      showMessage(StringConstant.drivingLicenseFrontImageValidation);
    } else if (drivingLicenseBackImage == "" || drivingLicenseBackImage == "") {
      showMessage(StringConstant.drivingLicenseBackImageValidation);
    } else if (aadharCardFrontImage == "" || aadharCardFrontImage == null) {
      showMessage(StringConstant.aadharCardFrontImageValidation);
    } else if (aadharCardBackImage == "" || aadharCardBackImage == "") {
      showMessage(StringConstant.aadharCardBackImageValidation);
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
          StringConstant.uploadDocument,
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
              height: 520.h,
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
                                titleName: StringConstant.profileImage,
                                isUploaded: isUploaded ? true : false,
                                file: profileImageFile,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(1);
                                  });
                                },
                              ),
                              UploadDocumentWidget(
                                titleName: StringConstant.panCardImage,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(2);
                                  });
                                },
                                isUploaded: isPanCardImage ? true : false,
                                file: panCardImageFile,
                              ),
                            ],
                          ),
                          20.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UploadDocumentWidget(
                                titleName:
                                    StringConstant.drivingLicenseFrontImage,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(3);
                                  });
                                },
                                isUploaded:
                                    isDrivingLicenseFrontImage ? true : false,
                                file: drivingLicenseFrontImageFile,
                              ),
                              UploadDocumentWidget(
                                titleName:
                                    StringConstant.drivingLicenseBackImage,
                                isUploaded:
                                    isDrivingLicenseBackImage ? true : false,
                                file: drivingLicenseBackImageFile,
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
                                titleName: StringConstant.aadtharCardFrontImage,
                                isUploaded:
                                    isAadharCardFrontImage ? true : false,
                                file: aadharCardFrontImageFile,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(5);
                                  });
                                },
                              ),
                              UploadDocumentWidget(
                                titleName: StringConstant.aadtharCardBackImage,
                                onTap: () {
                                  setState(() {
                                    pickImageFromCamara(6);
                                  });
                                },
                                isUploaded:
                                    isAadharCardBackImage ? true : false,
                                file: aadharCardBackImageFile,
                              ),
                            ],
                          ),
                          20.h.VBox,
                          AppButton(
                            StringConstant.submit,
                            () {
                              navigator.pushNamedAndRemoveUntil(
                                RouteName.homePage,
                              );
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
