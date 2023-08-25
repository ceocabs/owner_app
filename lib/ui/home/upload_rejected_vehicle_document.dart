import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:http/http.dart' as http;
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/upload_documet_widget.dart';
import '../auth/response/driver_image_upload_response.dart';
import '../auth/response/edit_vehicle_response.dart';
import '../auth/viewModel/edit_vehicle_viewModel.dart';
import '../auth/viewModel/upload_image_viewModel.dart';
import '../auth/model/vehicle_info_model.dart';
import '../auth/response/vehicle_info_response.dart';
import '../auth/viewModel/vehicle_info_viewModel.dart';

class UploadRejectedVehicleDocument extends StatefulWidget {
  const UploadRejectedVehicleDocument({Key? key}) : super(key: key);

  @override
  State<UploadRejectedVehicleDocument> createState() =>
      _UploadRejectedVehicleDocumentState();
}

class _UploadRejectedVehicleDocumentState
    extends State<UploadRejectedVehicleDocument> {
  bool pucStatus = true;
  bool insuranceStatus = true;
  bool fitnessStatus = true;
  bool permitStatus = true;
  bool roadTaxStatus = true;
  bool authorizationStatus = true;
  bool vehiclePicStatus = true;
  bool rcStatus = true;
  bool saleAgreementStatus = true;

  bool isUploaded = false;

  File? vehicleFrontImageFile;
  File? vehicleBackImageFile;
  File? vehicleRightImageFile;
  File? vehicleLeftImageFile;
  File? rcFrontImageFile;
  File? rcBackImageFile;
  File? insuranceImageFile;
  File? fitnessImageFile;
  File? pucImageFile;
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
  File? image;

  String vehicleFrontImageUrl = "";
  String vehicleBackImageUrl = "";
  String vehicleRightImageUrl = "";
  String vehicleLeftImageUrl = "";
  String rcFrontImageUrl = "";
  String rcBackImageUrl = "";
  String insuranceImageUrl = "";
  String fitnessImageUrl = "";
  String saleAgreementFirstImageUrl = "";
  String saleAgreementLastImageUrl = "";
  String authorizationImageUrl = "";
  String permitImageUrl = "";
  String pucCertificateImageUrl = "";
  String roadTaxImageUrl = "";
  String pucImageUrl = "";
  String vehicleId = "";
  var data;

  List<VehicleModel> vehicleInfoModelList = [];

  uploadImage(
      {required File? file,
      required String folderName,
      required BuildContext context}) async {
    final apiHandler = uploadImageViewModel();
    DriverImageUploadRequestModel request =
        DriverImageUploadRequestModel(file: file, folderName: folderName);

    try {
      await apiHandler
          .driverImageUpload(request: request, context: context)
          .then((response) async {
        print("${response.toString()}   driver upload image..........");
        setState(() {});
      });
    } catch (e) {
      print("$e e....payment 1");
    }
  }

  uploadImageMethod(
      {BuildContext? context,
      File? file,
      String? folderName,
      int? index}) async {
    var req = http.MultipartRequest('POST',
        Uri.parse("http://13.126.160.153:8005/public/api/upload-image"));
    final headers = {
      'Content-Type': 'application/json',
    };
    setState(() {
      isLoading = true;
    });
    req.files.add(
      await http.MultipartFile.fromPath('file', file!.path),
    );

    var streamedResponse = await req.send();
    var response = await http.Response.fromStream(streamedResponse);
    var parsed = jsonDecode(response.body);
    print(parsed.toString() + " image added response..........");
    print(parsed['data'].toString() + " image url.........");

    if (index == 1) {
      vehicleFrontImageUrl = parsed['data'].toString();
    } else if (index == 2) {
      vehicleBackImageUrl = parsed['data'].toString();
    } else if (index == 3) {
      vehicleRightImageUrl = parsed['data'].toString();
    } else if (index == 4) {
      vehicleLeftImageUrl = parsed['data'].toString();
    } else if (index == 5) {
      rcFrontImageUrl = parsed['data'].toString();
    } else if (index == 6) {
      rcBackImageUrl = parsed['data'].toString();
    } else if (index == 7) {
      insuranceImageUrl = parsed['data'].toString();
    } else if (index == 8) {
      fitnessImageUrl = parsed['data'].toString();
    } else if (index == 9) {
      saleAgreementFirstImageUrl = parsed['data'].toString();
    } else if (index == 10) {
      saleAgreementLastImageUrl = parsed['data'].toString();
    } else if (index == 11) {
      authorizationImageUrl = parsed['data'].toString();
    } else if (index == 12) {
      permitImageUrl = parsed['data'].toString();
    } else if (index == 13) {
      pucCertificateImageUrl = parsed['data'].toString();
    } else if (index == 14) {
      roadTaxImageUrl = parsed['data'].toString();
    } else if (index == 15) {
      pucImageUrl = parsed['data'].toString();
    }

    setState(() {
      isLoading = false;
    });
  }

  choosePlatform(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.w),
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
                    setState(() {});
                  },
                  child: Text(
                    StringConstant.gallery,
                    style: textBold.copyWith(
                        fontSize: 20.sp, color: AppColor.darkBlue),
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
        maxWidth: 100,
        maxHeight: 100,
        imageQuality: 50,
      );
      if (image == null) return;
      final imageTemp = File(image.path);
      print("${imageTemp.path} vehicleFrontImageFile..........");
      setState(() {});

      setState(() {
        isUploaded = true;
      });
      if (i == 1) {
        vehicleFrontImageFile = imageTemp;
        isVehicleFrontPic = true;
        await uploadImageMethod(
            context: context,
            file: vehicleFrontImageFile,
            folderName: "test",
            index: 1);
      } else if (i == 2) {
        vehicleBackImageFile = imageTemp;
        isVehicleBackPic = true;
        await uploadImageMethod(
            context: context,
            file: vehicleBackImageFile,
            folderName: "test",
            index: 2);
      } else if (i == 3) {
        vehicleRightImageFile = imageTemp;
        isVehicleRightPic = true;
        await uploadImageMethod(
            context: context,
            file: vehicleRightImageFile,
            folderName: "test",
            index: 3);
      } else if (i == 4) {
        vehicleLeftImageFile = imageTemp;
        isVehicleLeftPic = true;
        await uploadImageMethod(
            context: context,
            file: vehicleLeftImageFile,
            folderName: "test",
            index: 4);
      } else if (i == 5) {
        rcFrontImageFile = imageTemp;
        isRcBookFrontPic = true;
        await uploadImageMethod(
            context: context,
            file: rcFrontImageFile,
            folderName: "test",
            index: 5);
      } else if (i == 6) {
        rcBackImageFile = imageTemp;
        isRcBookBackPic = true;
        await uploadImageMethod(
            context: context,
            file: rcBackImageFile,
            folderName: "test",
            index: 6);
      } else if (i == 7) {
        insuranceImageFile = imageTemp;
        isInsurancePic = true;
        await uploadImageMethod(
            context: context,
            file: insuranceImageFile,
            folderName: "test",
            index: 7);
      } else if (i == 8) {
        fitnessImageFile = imageTemp;
        isFitnessPic = true;
        await uploadImageMethod(
            context: context,
            file: fitnessImageFile,
            folderName: "test",
            index: 8);
      } else if (i == 9) {
        saleAgreementFirstPageFile = imageTemp;
        isSaleAgreementFirstPic = true;
        await uploadImageMethod(
            context: context,
            file: saleAgreementFirstPageFile,
            folderName: "test",
            index: 9);
      } else if (i == 10) {
        saleAgreementLastPageFile = imageTemp;
        isSaleAgreementLastPic = true;
        await uploadImageMethod(
            context: context,
            file: saleAgreementLastPageFile,
            folderName: "test",
            index: 10);
      } else if (i == 11) {
        authorisationFile = imageTemp;
        isAuthorisationPic = true;
        await uploadImageMethod(
            context: context,
            file: authorisationFile,
            folderName: "test",
            index: 11);
      } else if (i == 12) {
        permitFile = imageTemp;
        isPermitPic = true;
        await uploadImageMethod(
          context: context,
          file: permitFile,
          folderName: "test",
          index: 12,
        );
      } else if (i == 13) {
        pucCertificateFile = imageTemp;
        isPucCertificatePic = true;
        await uploadImageMethod(
            context: context,
            file: pucCertificateFile,
            folderName: "test",
            index: 13);
      } else if (i == 14) {
        roadTaxFile = imageTemp;
        isRoadTaxPic = true;
        await uploadImageMethod(
          context: context,
          file: roadTaxFile,
          folderName: "test",
          index: 14,
        );
      } else if (i == 15) {
        pucImageFile = imageTemp;
        isPUCPic = true;
        await uploadImageMethod(
            context: context,
            file: pucImageFile,
            folderName: "test",
            index: 15);
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
          imageQuality: 50,
          maxHeight: 100,
          maxWidth: 100);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        isUploaded = true;
      });
      if (i == 1) {
        vehicleFrontImageFile = imageTemp;
        isVehicleFrontPic = true;
        await uploadImageMethod(
            context: context,
            file: vehicleFrontImageFile,
            folderName: "test",
            index: 1);
      } else if (i == 2) {
        vehicleBackImageFile = imageTemp;
        isVehicleBackPic = true;
        await uploadImageMethod(
            context: context,
            file: vehicleBackImageFile,
            folderName: "test",
            index: 2);
      } else if (i == 3) {
        vehicleRightImageFile = imageTemp;
        isVehicleRightPic = true;
        await uploadImageMethod(
            context: context,
            file: vehicleRightImageFile,
            folderName: "test",
            index: 3);
      } else if (i == 4) {
        vehicleLeftImageFile = imageTemp;
        isVehicleLeftPic = true;
        await uploadImageMethod(
            context: context,
            file: vehicleLeftImageFile,
            folderName: "test",
            index: 4);
      } else if (i == 5) {
        rcFrontImageFile = imageTemp;
        isRcBookFrontPic = true;
        await uploadImageMethod(
            context: context,
            file: rcFrontImageFile,
            folderName: "test",
            index: 5);
      } else if (i == 6) {
        rcBackImageFile = imageTemp;
        isRcBookBackPic = true;
        await uploadImageMethod(
            context: context,
            file: rcBackImageFile,
            folderName: "test",
            index: 6);
      } else if (i == 7) {
        insuranceImageFile = imageTemp;
        isInsurancePic = true;
        await uploadImageMethod(
            context: context,
            file: insuranceImageFile,
            folderName: "test",
            index: 7);
      } else if (i == 8) {
        fitnessImageFile = imageTemp;
        isFitnessPic = true;
        await uploadImageMethod(
            context: context,
            file: fitnessImageFile,
            folderName: "test",
            index: 8);
      } else if (i == 9) {
        saleAgreementFirstPageFile = imageTemp;
        isSaleAgreementFirstPic = true;
        await uploadImageMethod(
            context: context,
            file: saleAgreementFirstPageFile,
            folderName: "test",
            index: 9);
      } else if (i == 10) {
        saleAgreementLastPageFile = imageTemp;
        isSaleAgreementLastPic = true;
        await uploadImageMethod(
            context: context,
            file: saleAgreementLastPageFile,
            folderName: "test",
            index: 10);
      } else if (i == 11) {
        authorisationFile = imageTemp;
        isAuthorisationPic = true;
        await uploadImageMethod(
            context: context,
            file: authorisationFile,
            folderName: "test",
            index: 11);
      } else if (i == 12) {
        permitFile = imageTemp;
        isPermitPic = true;
        await uploadImageMethod(
            context: context, file: permitFile, folderName: "test", index: 12);
      } else if (i == 13) {
        pucCertificateFile = imageTemp;
        isPucCertificatePic = true;
        await uploadImageMethod(
            context: context,
            file: pucCertificateFile,
            folderName: "test",
            index: 13);
      } else if (i == 14) {
        roadTaxFile = imageTemp;
        isRoadTaxPic = true;
        await uploadImageMethod(
            context: context, file: roadTaxFile, folderName: "test", index: 14);
      } else if (i == 15) {
        pucImageFile = imageTemp;
        isPUCPic = true;
        await uploadImageMethod(
            context: context,
            file: pucImageFile,
            folderName: "test",
            index: 15);
      }
      navigator.pop();
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  getVehicleInfo({
    required BuildContext context,
    required String vehicleId,
  }) async {
    final apiHandler = vehicleInfoViewModel();
    VehicleInfoRequestModel request =
        VehicleInfoRequestModel(vehicleId: vehicleId);
    setState(() {
      isLoading = true;
    });
    try {
      await apiHandler
          .vehicleView(request: request, context: context)
          .then((response) async {
        print(
            "$response  response vehicle info response..........");
        List<dynamic> vehicleInfoData = response;
        vehicleInfoModelList =
            vehicleInfoData.map((i) => VehicleModel.fromJson(i)).toList();

        pucStatus = vehicleInfoModelList[0].pucStatus.toString() == "Approved"
            ? false
            : true;
        insuranceStatus =
            vehicleInfoModelList[0].insuranceStatus.toString() == "Approved"
                ? false
                : true;
        fitnessStatus =
            vehicleInfoModelList[0].fitnessStatus == "Approved" ? false : true;
        permitStatus =
            vehicleInfoModelList[0].permitStatus == "Approved" ? false : true;
        roadTaxStatus =
            vehicleInfoModelList[0].roadTaxStatus == "Approved" ? false : true;
        authorizationStatus =
            vehicleInfoModelList[0].authorizationStatus == "Approved"
                ? false
                : true;
        vehiclePicStatus =
            vehicleInfoModelList[0].vehiclePicStatus == "Approved"
                ? false
                : true;
        rcStatus = vehicleInfoModelList[0].rcStatus.toString() == "Approved"
            ? false
            : true;
        saleAgreementStatus =
            vehicleInfoModelList[0].saleAgreementStatus == "Approved"
                ? false
                : true;
      });
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("$e e...........5");
    }
  }

  uploadVehicleRejectedDocuments() async {
    final apiHandler = EditVehicleViewModel();

    EditVehicleRequestModel request = EditVehicleRequestModel(
        vehicleId: vehicleId,
        saleAgreementFirst: saleAgreementFirstImageUrl,
        saleAgreementLast: saleAgreementLastImageUrl,
        rcFrontImage: rcFrontImageUrl,
        rcBackImage: rcBackImageUrl,
        pucImage: pucImageUrl,
        pucCertificate: pucCertificateImageUrl,
        permitImage: permitImageUrl,
        fitnessImage: fitnessImageUrl,
        insuranceImage: insuranceImageUrl,
        authorizationImage: authorizationImageUrl,
        roadTaxImage: roadTaxImageUrl,
        vehiclePicBackImage: vehicleBackImageUrl,
        vehiclePicFrontImage: vehicleFrontImageUrl);

    try {
      await apiHandler
          .editVehicleData(request: request, context: context)
          .then((response) {
        var code = response;
        navigator.pushNamedAndRemoveUntil(RouteName.pendingApprovalPage);
        //Map<String, dynamic> otpValue = code[0];

        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  bool isVehicleFrontPic = false;
  bool isVehicleBackPic = false;
  bool isVehicleRightPic = false;
  bool isVehicleLeftPic = false;
  bool isRcBookFrontPic = false;
  bool isRcBookBackPic = false;
  bool isInsurancePic = false;
  bool isPUCPic = false;
  bool isFitnessPic = false;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        vehicleId = data["vehicleId"].toString();
        print(vehicleId.toString() + " vehicle Id......");
      });
      getVehicleInfo(context: context, vehicleId: vehicleId);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.uploadDocuments,
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
                  vehiclePicStatus == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            UploadDocumentWidget(
                              titleName: StringConstant.vehicleFrontImage,
                              isUploaded: isUploaded ? true : false,
                              file: vehicleFrontImageFile,
                              onTap: () async {
                                await choosePlatform(context, 1);
                              },
                            ),
                            UploadDocumentWidget(
                              titleName: StringConstant.vehicleBackImage,
                              onTap: () async {
                                await choosePlatform(context, 2);
                                setState(() {});
                              },
                              isUploaded: isVehicleBackPic ? true : false,
                              file: vehicleBackImageFile,
                            ),
                          ],
                        )
                      : Container(),
                  vehiclePicStatus == true ? 20.h.VBox : 0.h.VBox,
                  vehiclePicStatus == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            UploadDocumentWidget(
                              titleName: StringConstant.vehicleRight,
                              onTap: () async {
                                await choosePlatform(context, 3);
                                setState(() {});
                              },
                              isUploaded: isVehicleRightPic ? true : false,
                              file: vehicleRightImageFile,
                            ),
                            UploadDocumentWidget(
                              titleName: StringConstant.vehicleLeft,
                              isUploaded: isVehicleLeftPic ? true : false,
                              file: vehicleLeftImageFile,
                              onTap: () async {
                                await choosePlatform(context, 4);
                                setState(() {});
                              },
                            ),
                          ],
                        )
                      : Container(),
                  vehiclePicStatus == true ? 20.h.VBox : 0.h.VBox,
                  rcStatus == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            UploadDocumentWidget(
                              titleName: StringConstant.rcFrontPic,
                              isUploaded: isRcBookFrontPic ? true : false,
                              file: rcFrontImageFile,
                              onTap: () async {
                                await choosePlatform(context, 5);
                              },
                            ),
                            UploadDocumentWidget(
                              titleName: StringConstant.rcBackPic,
                              onTap: () async {
                                await choosePlatform(context, 6);
                                setState(() {});
                              },
                              isUploaded: isRcBookBackPic ? true : false,
                              file: rcBackImageFile,
                            ),
                          ],
                        )
                      : Container(),
                  rcStatus == true ? 20.h.VBox : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      insuranceStatus == true
                          ? UploadDocumentWidget(
                              titleName: StringConstant.insurancePhoto,
                              isUploaded: isInsurancePic ? true : false,
                              file: insuranceImageFile,
                              onTap: () async {
                                await choosePlatform(context, 7);
                                setState(() {});
                              },
                            )
                          : Container(),
                      fitnessStatus == true
                          ? UploadDocumentWidget(
                              titleName: StringConstant.fitnessPhoto,
                              onTap: () async {
                                await choosePlatform(context, 8);
                                setState(() {});
                              },
                              isUploaded: isFitnessPic ? true : false,
                              file: fitnessImageFile,
                            )
                          : Container(),
                    ],
                  ),
                  20.h.VBox,
                  saleAgreementStatus == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            UploadDocumentWidget(
                              titleName: StringConstant.saleAgreementPic,
                              isUploaded: isUploaded ? true : false,
                              file: saleAgreementFirstPageFile,
                              onTap: () async {
                                await choosePlatform(context, 9);

                                setState(() {});
                              },
                            ),
                            UploadDocumentWidget(
                              titleName: StringConstant.saleAgreementLastPic,
                              onTap: () async {
                                await choosePlatform(context, 10);

                                setState(() {});
                              },
                              isUploaded: isSaleAgreementLastPic ? true : false,
                              file: saleAgreementLastPageFile,
                            ),
                          ],
                        )
                      : Container(),
                  saleAgreementStatus == true ? 20.h.VBox : 0.h.VBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      authorizationStatus == true
                          ? UploadDocumentWidget(
                              titleName: StringConstant.authorisationPhoto,
                              onTap: () async {
                                await choosePlatform(context, 11);
                                setState(() {});
                              },
                              isUploaded: isAuthorisationPic ? true : false,
                              file: authorisationFile,
                            )
                          : Container(),
                      permitStatus == true
                          ? UploadDocumentWidget(
                              titleName: StringConstant.permitPhoto,
                              isUploaded: isPermitPic ? true : false,
                              file: permitFile,
                              onTap: () async {
                                await choosePlatform(context, 12);
                                setState(() {});
                              },
                            )
                          : Container(),
                    ],
                  ),
                  20.h.VBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      roadTaxStatus == true
                          ? UploadDocumentWidget(
                              titleName: StringConstant.roadTaxPhoto,
                              onTap: () async {
                                await choosePlatform(context, 14);
                                setState(() {});
                              },
                              isUploaded: isRoadTaxPic ? true : false,
                              file: roadTaxFile,
                            )
                          : Container(),
                    ],
                  ),
                  20.h.VBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      pucStatus == true
                          ? UploadDocumentWidget(
                              titleName: StringConstant.pucTitle,
                              isUploaded: isPUCPic ? true : false,
                              file: pucImageFile,
                              onTap: () async {
                                await choosePlatform(context, 15);
                                setState(() {});
                              },
                            )
                          : Container(),
                    ],
                  ),
                  20.h.VBox,
                  AppButton(
                    StringConstant.next,
                    () async {
                      await uploadVehicleRejectedDocuments();
                      //  checkValidation();
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
    );
  }
}
