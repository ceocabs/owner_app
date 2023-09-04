import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/upload_documet_widget.dart';

class UpdateVehicleDocumentsPage extends StatefulWidget {
  const UpdateVehicleDocumentsPage({Key? key}) : super(key: key);

  @override
  State<UpdateVehicleDocumentsPage> createState() =>
      _UpdateVehicleDocumentsPageState();
}

class _UpdateVehicleDocumentsPageState
    extends State<UpdateVehicleDocumentsPage> {
  File? image;
  File? vehicleFrontImageFile;
  File? vehicleBackImageFile;
  File? vehicleRightImageFile;
  File? vehicleLeftImageFile;
  File? rcFrontImageFile;
  File? rcBackImageFile;
  File? insuranceImageFile;
  File? fitnessImageFile;
  File? pucImageFile;
  File? saleAgreementFrontImageFile;
  File? saleAgreementBackImageFile;
  File? permitImageFile;
  File? pucCertificateImageFile;
  File? roadTaxImageFile;

  bool isVehiclePic = false;
  bool isRcPhoto = false;
  bool isInsurancePhoto = false;
  bool isFitnessPhoto = false;
  bool isPucPhoto = false;
  bool isSaleAgreementPhoto = false;
  bool isAuthorizationPhoto = false;
  bool isPermitPhoto = false;
  bool isPucCertificatePhoto = false;
  bool isRoadTaxPhoto = false;

  File? saleAgreementFirstPageFile;
  File? saleAgreementLastPageFile;
  File? authorisationFile;
  File? permitFile;
  File? pucCertificateFile;
  File? roadTaxFile;

  bool isUploaded = false;
  String referanceId = "";
  String userType = "";

  var data;
  String isAdharStatus = "";
  String isProfileStatus = "";
  String isPanStatus = "";
  String isLicenseStatus = "";

  choosePlatform(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 16,
          child: Container(
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    pickImageFromGallery(index);
                  },
                  child: Text(
                    StringConstant.gallery,
                    style: textBold.copyWith(
                      fontSize: 20.sp,
                      color: AppColor.darkBlue,
                    ),
                  ),
                ),
                10.h.VBox,
                Container(
                  height: 1.w,
                  color: AppColor.greyColor,
                ),
                10.h.VBox,
                InkWell(
                  onTap: () {
                    pickImageFromCamara(index);
                  },
                  child: Text(
                    StringConstant.camara,
                    style: textBold.copyWith(
                      fontSize: 20.sp,
                      color: AppColor.darkBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future pickImageFromGallery(int i) async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 100,
         );
      if (image == null) return;
      final imageTemp = File(image.path);

      setState(() {
        isUploaded = true;
      });
      if (i == 1) {
        vehicleFrontImageFile = imageTemp;
        //  isDrivingLicenseFrontImage = true;
        print("profile image calling..........");
      } else if (i == 2) {
        //  isDrivingLicenseBackImage = true;
        vehicleBackImageFile = imageTemp;

        print("pan card calling..........");
      } else if (i == 3) {
        vehicleRightImageFile = imageTemp;
        // isAadharCardFrontImage = true;
      } else if (i == 4) {
        vehicleLeftImageFile = imageTemp;
        //  isAadharCardBackImage = true;
      } else if (i == 5) {
        insuranceImageFile = imageTemp;
        //   isProfileImage = true;
      } else if (i == 6) {
        fitnessImageFile = imageTemp;
        //  isPanCardImage = true;
      } else if (i == 7) {
        rcFrontImageFile = imageTemp;
        //  isPanCardImage = true;
      } else if (i == 8) {
        rcBackImageFile = imageTemp;
        //  isPanCardImage = true;
      }
      navigator.pop();

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageFromCamara(int i) async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 100,
          );
      if (image == null) return;
      final imageTemp = File(
        image.path,
      );
      setState(() {
        isUploaded = true;
      });
      if (i == 1) {
        vehicleFrontImageFile = imageTemp;
      } else if (i == 2) {
        vehicleBackImageFile = imageTemp;
      } else if (i == 3) {
        vehicleRightImageFile = imageTemp;
      } else if (i == 4) {
        vehicleLeftImageFile = imageTemp;
      } else if (i == 5) {
        insuranceImageFile = imageTemp;
      } else if (i == 6) {
        fitnessImageFile = imageTemp;
      } else if (i == 7) {
        rcFrontImageFile = imageTemp;
      } else if (i == 8) {
        rcBackImageFile = imageTemp;
      }

      navigator.pop();
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
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
                      padding: EdgeInsets.only(left: 16.w, right: 17.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.h.VBox,
                          Text(
                            StringConstant.uploadRejectedDocuments,
                            style: textBold.copyWith(
                                fontSize: 16.sp, color: AppColor.white),
                          ),
                          10.h.VBox,
                          isLicenseStatus == "Rejected"
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    UploadDocumentWidget(
                                      titleName:
                                          StringConstant.vehicleFrontImage,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 1);
                                        });
                                      },
                                      isUploaded: isRoadTaxPhoto ? true : false,
                                      file: vehicleFrontImageFile,
                                    ),
                                    UploadDocumentWidget(
                                      titleName:
                                          StringConstant.vehicleBackImage,
                                      isUploaded: isRoadTaxPhoto ? true : false,
                                      file: vehicleBackImageFile,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 2);
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : Container(),
                          isLicenseStatus == "Rejected" ? 20.h.VBox : 0.h.VBox,
                          isAdharStatus == "Rejected"
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    UploadDocumentWidget(
                                      titleName: StringConstant.vehicleRight,
                                      isUploaded: isRoadTaxPhoto ? true : false,
                                      file: vehicleRightImageFile,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 3);
                                        });
                                      },
                                    ),
                                    UploadDocumentWidget(
                                      titleName: StringConstant.vehicleLeft,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 4);
                                        });
                                      },
                                      isUploaded: isRoadTaxPhoto ? true : false,
                                      file: vehicleLeftImageFile,
                                    ),
                                  ],
                                )
                              : Container(),
                          isInsurancePhoto == "Rejected" ||
                                  isFitnessPhoto == "Rejected"
                              ? 20.h.VBox
                              : 0.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              isInsurancePhoto == "Rejected"
                                  ? UploadDocumentWidget(
                                      titleName: StringConstant.insurancePhoto,
                                      isUploaded: isUploaded ? true : false,
                                      file: insuranceImageFile,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 5);
                                        });
                                      },
                                    )
                                  : Container(),
                              isFitnessPhoto == "Rejected"
                                  ? UploadDocumentWidget(
                                      titleName: StringConstant.fitnessPhoto,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 6);
                                        });
                                      },
                                      isUploaded: isRoadTaxPhoto ? true : false,
                                      file: fitnessImageFile,
                                    )
                                  : Container(),
                            ],
                          ),
                          isRcPhoto == "Rejected" ? 20.h.VBox : 0.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              isRcPhoto == "Rejected"
                                  ? UploadDocumentWidget(
                                      titleName: StringConstant.rcFrontPic,
                                      isUploaded: isUploaded ? true : false,
                                      file: rcFrontImageFile,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 5);
                                        });
                                      },
                                    )
                                  : Container(),
                              isFitnessPhoto == "Rejected"
                                  ? UploadDocumentWidget(
                                      titleName: StringConstant.rcBackPic,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 6);
                                        });
                                      },
                                      isUploaded: isRoadTaxPhoto ? true : false,
                                      file: rcBackImageFile,
                                    )
                                  : Container(),
                            ],
                          ),
                          isPucPhoto == "Rejected" ? 20.h.VBox : 0.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              isPucPhoto == "Rejected"
                                  ? UploadDocumentWidget(
                                      titleName: StringConstant.rcFrontPic,
                                      isUploaded: isUploaded ? true : false,
                                      file: pucImageFile,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 5);
                                        });
                                      },
                                    )
                                  : Container(),
                              isRoadTaxPhoto == "Rejected"
                                  ? UploadDocumentWidget(
                                      titleName: StringConstant.rcBackPic,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 6);
                                        });
                                      },
                                      isUploaded: isRoadTaxPhoto ? true : false,
                                      file: roadTaxImageFile,
                                    )
                                  : Container(),
                            ],
                          ),
                          20.h.VBox,
                          AppButton(StringConstant.submit, () async {
                            /*      await sendMultipartRequest(
                                customerId: int.parse(userId));*/
                            // navigator.pushNamed(RouteName.homePage);
                          }, height: 41.h),
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
