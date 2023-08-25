import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../res.dart';
import '../../../util/app_utils.dart';
import '../../../values/colors.dart';
import '../../../values/string_contsant.dart';
import '../../../values/style.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/upload_documet_widget.dart';

class EditVehicleFourthPage extends StatefulWidget {
  const EditVehicleFourthPage({Key? key}) : super(key: key);

  @override
  State<EditVehicleFourthPage> createState() => _EditVehicleFourthPageState();
}

class _EditVehicleFourthPageState extends State<EditVehicleFourthPage> {
  String saleAgreementFirstPageImage = "";
  String saleAgreementLastPageImage = "";
  String authorisationImage = "";
  String permitImage = "";
  String pucCertificateImage = "";
  String roadTaxImage = "";

  File? image;
  File? saleAgreementFirstPageFile;
  File? saleAgreementLastPageFile;
  File? authorisationFile;
  File? permitFile;
  File? pucCertificateFile;
  File? roadTaxFile;

  bool isSaleAgreementFirstPic = false;
  bool isSaleAgreementLastPic = false;
  bool isAuthorisationPic = false;
  bool isPermitPic = false;
  bool isPucCertificatePic = false;
  bool isRoadTaxPic = false;

  bool isEdit = false;
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
        saleAgreementFirstPageFile = imageTemp;
        isSaleAgreementFirstPic = true;
      } else if (i == 2) {
        saleAgreementLastPageFile = imageTemp;
        isSaleAgreementLastPic = true;
      } else if (i == 3) {
        authorisationFile = imageTemp;
        isAuthorisationPic = true;
      } else if (i == 4) {
        permitFile = imageTemp;
        isPermitPic = true;
      } else if (i == 5) {
        pucCertificateFile = imageTemp;
        isPucCertificatePic = true;
      } else if (i == 6) {
        roadTaxFile = imageTemp;
        isRoadTaxPic = true;
      }

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void checkValidation() {
    if (saleAgreementFirstPageImage == "" ||
        saleAgreementFirstPageImage == null) {
      showMessage(StringConstant.saleAgreementFirstPageValidation);
    } else if (saleAgreementLastPageFile == "" ||
        saleAgreementLastPageFile == null) {
      showMessage(StringConstant.saleAgreementLastPageValidation);
    } else if (authorisationImage == "" || authorisationImage == null) {
      showMessage(StringConstant.authorisationValidation);
    } else if (permitImage == "" || permitImage == "") {
      showMessage(StringConstant.permitValidation);
    } else if (pucCertificateImage == "" || pucCertificateImage == null) {
      showMessage(StringConstant.pucCertificateValidation);
    } else if (roadTaxImage == "" || roadTaxImage == "") {
      showMessage(StringConstant.roadTaxValidation);
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
                    style: textBold.copyWith(color: AppColor.white),
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
                              titleName: StringConstant.saleAgreementPic,
                              isUploaded: isUploaded ? true : false,
                              file: saleAgreementFirstPageFile,
                              onTap: () {
                                setState(() {
                                  pickImageFromCamara(1);
                                });
                              },
                            ),
                            UploadDocumentWidget(
                              titleName: StringConstant.saleAgreementLastPic,
                              onTap: () {
                                setState(() {
                                  pickImageFromCamara(2);
                                });
                              },
                              isUploaded: isSaleAgreementLastPic ? true : false,
                              file: saleAgreementLastPageFile,
                            ),
                          ],
                        ),
                        20.h.VBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            UploadDocumentWidget(
                              titleName: StringConstant.authorisationPhoto,
                              onTap: () {
                                setState(() {
                                  pickImageFromCamara(3);
                                });
                              },
                              isUploaded: isAuthorisationPic ? true : false,
                              file: authorisationFile,
                            ),
                            UploadDocumentWidget(
                              titleName: StringConstant.permitPhoto,
                              isUploaded: isPermitPic ? true : false,
                              file: permitFile,
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
                              titleName: StringConstant.pucCertificate,
                              isUploaded: isPucCertificatePic ? true : false,
                              file: pucCertificateFile,
                              onTap: () {
                                setState(
                                  () {
                                    pickImageFromCamara(5);
                                  },
                                );
                              },
                            ),
                            UploadDocumentWidget(
                              titleName: StringConstant.roadTaxPhoto,
                              onTap: () {
                                setState(() {
                                  pickImageFromCamara(6);
                                });
                              },
                              isUploaded: isRoadTaxPic ? true : false,
                              file: roadTaxFile,
                            ),
                          ],
                        ),
                        20.h.VBox,
                        AppButton(
                          isEdit
                              ? StringConstant.update
                              : StringConstant.submit,
                          () {},
                          height: 41.h,
                        ),
                        30.h.VBox
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
