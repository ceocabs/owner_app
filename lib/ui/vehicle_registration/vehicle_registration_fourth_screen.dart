import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../res.dart';
import '../../../values/colors.dart';
import '../../../values/string_contsant.dart';
import '../../../values/style.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/upload_documet_widget.dart';
import '../../values/passing_parameters.dart';
import 'package:http/http.dart' as http;
import '../../widgets/custom_info_dialog.dart';
import '../auth/response/driver_image_upload_response.dart';
import '../auth/response/edit_vehicle_details_response.dart';
import '../auth/viewModel/edit_vehicle_details_viewModel.dart';
import '../auth/response/register_vehicle_response.dart';
import '../auth/viewModel/register_vehicle_viewModel.dart';
import '../auth/viewModel/upload_image_viewModel.dart';

class VehicleRegistrationFourthScreen extends StatefulWidget {
  const VehicleRegistrationFourthScreen({Key? key}) : super(key: key);

  @override
  State<VehicleRegistrationFourthScreen> createState() =>
      _VehicleRegistrationFourthScreenState();
}

class _VehicleRegistrationFourthScreenState
    extends State<VehicleRegistrationFourthScreen> {
  String saleAgreementFirstPageImageUrl = "";
  String saleAgreementLastPageImageUrl = "";
  String authorisationImageUrl = "";
  String permitImageUrl = "";
  String pucCertificateImageUrl = "";
  String roadTaxImageUrl = "";

  File? image;

  File? saleAgreementFirstPageFile;
  File? saleAgreementLastPageFile;
  File? authorisationFile;
  File? permitFile;
  File? pucCertificateFile;
  File? roadTaxFile;

  File? vehicleFrontPic;
  File? vehicleBackPic;
  File? vehicleRightPic;
  File? vehicleLeftPic;
  File? rcFrontPic;
  File? rcBackPic;
  File? insurancePic;
  File? fitnessPic;
  File? pucPic;

  bool isSaleAgreementFirstPic = false;
  bool isSaleAgreementLastPic = false;
  bool isAuthorisationPic = false;
  bool isPermitPic = false;
  bool isPucCertificatePic = false;
  bool isRoadTaxPic = false;
  bool isUploaded = false;
  bool isLoading = false;

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
        Uri.parse("http://ceocabsnode-env.eba-8wh7cacx.ap-south-1.elasticbeanstalk.com:8005/public/api/upload-image"));
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
    print("$parsed image added response..........");
    print("${parsed['data']} image url.........");

    if (index == 1) {
      saleAgreementFirstPageImageUrl = parsed['data'].toString();
      print("$saleAgreementFirstPageImageUrl vehicle front image url......");
    } else if (index == 2) {
      saleAgreementLastPageImageUrl = parsed['data'].toString();
      print("$saleAgreementLastPageImageUrl vehicle back image url......");
    } else if (index == 3) {
      authorisationImageUrl = parsed['data'].toString();
      print("$authorisationImageUrl vehicle right image url......");
    } else if (index == 4) {
      permitImageUrl = parsed['data'].toString();
      print("$permitImageUrl vehicle left image url......");
    } else if (index == 5) {
      pucCertificateImageUrl = parsed['data'].toString();
      print("$pucCertificateImageUrl rc front image url......");
    } else if (index == 6) {
      roadTaxImageUrl = parsed['data'].toString();
      print("$roadTaxImageUrl rc back image url......");
    }

    setState(() {
      isLoading = false;
    });
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
        saleAgreementFirstPageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: saleAgreementFirstPageFile,
            folderName: "test",
            index: 1);
        isSaleAgreementFirstPic = true;
      } else if (i == 2) {
        saleAgreementLastPageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: saleAgreementLastPageFile,
            folderName: "test",
            index: 2);
        isSaleAgreementLastPic = true;
      } else if (i == 3) {
        authorisationFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: authorisationFile,
            folderName: "test",
            index: 3);
        isAuthorisationPic = true;
      } else if (i == 4) {
        permitFile = imageTemp;
        await uploadImageMethod(
            context: context, file: permitFile, folderName: "test", index: 4);
        isPermitPic = true;
      } else if (i == 5) {
        pucCertificateFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: pucCertificateFile,
            folderName: "test",
            index: 5);
        isPucCertificatePic = true;
      } else if (i == 6) {
        roadTaxFile = imageTemp;
        await uploadImageMethod(
            context: context, file: roadTaxFile, folderName: "test", index: 6);
        isRoadTaxPic = true;
      }

      navigator.pop();
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
        await uploadImageMethod(
            context: context,
            file: saleAgreementFirstPageFile,
            folderName: "test",
            index: 1);
        isSaleAgreementFirstPic = true;
      } else if (i == 2) {
        saleAgreementLastPageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: saleAgreementLastPageFile,
            folderName: "test",
            index: 2);
        isSaleAgreementLastPic = true;
      } else if (i == 3) {
        authorisationFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: authorisationFile,
            folderName: "test",
            index: 3);
        isAuthorisationPic = true;
      } else if (i == 4) {
        permitFile = imageTemp;
        await uploadImageMethod(
            context: context, file: permitFile, folderName: "test", index: 4);
        isPermitPic = true;
      } else if (i == 5) {
        pucCertificateFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: pucCertificateFile,
            folderName: "test",
            index: 5);
        isPucCertificatePic = true;
      } else if (i == 6) {
        roadTaxFile = imageTemp;
        await uploadImageMethod(
            context: context, file: roadTaxFile, folderName: "test", index: 6);
        isRoadTaxPic = true;
      }

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void checkValidation() {
    if (saleAgreementFirstPageImageUrl == "" ||
        saleAgreementFirstPageImageUrl == null) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.saleAgreementFirstPageValidation,
          );
        },
      );
    } else if (saleAgreementLastPageFile == "" ||
        saleAgreementLastPageFile == null) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.saleAgreementLastPageValidation,
          );
        },
      );
    } else if (authorisationImageUrl == "" || authorisationImageUrl == null) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.authorisationValidation,
          );
        },
      );
    } else if (permitImageUrl == "" || permitImageUrl == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.permitValidation,
          );
        },
      );
    } else if (pucCertificateImageUrl == "" || pucCertificateImageUrl == null) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.pucCertificateValidation,
          );
        },
      );
    } else if (roadTaxImageUrl == "" || roadTaxImageUrl == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.roadTaxValidation,
          );
        },
      );
    }
  }

  vehicleRegistration({
    required String vehicleNo,
    required String brandId,
    required String colorId,
    required String vehicleNameId,
    required String fuelTypeId,
    required String ccCapacity,
    required String registerYear,
    required String acAvailable,
    required String runningKm,
    required String carrier,
    required String pucExpiry,
    required String insuranceCompany,
    required String insuranceType,
    required String insuranceExpiry,
    required String insuranceImage,
    required String fitnessExpiry,
    required String fitnessImage,
    required String permitExpiry,
    required String permitImage,
    required String roadTaxExpiry,
    required String authorizationExpiry,
    required String authorizationImage,
    required String vehiclePicFront,
    required String vehiclePicLeft,
    required String vehiclePicRight,
    required String saleAgreementFirst,
    required String saleAgreementLast,
    required String rcFrontImage,
    required String rcBackImage,
    required String pucImage,
    required String pucCertificate,
  }) async {
    final apiHandler = RegisterVehicleViewModel();

    RegisterVehicleRequestModel request = RegisterVehicleRequestModel(
        vehicleNo: vehicleNo,
        brandId: brandId,
        colorId: colorId,
        vehicleNameId: vehicleNameId,
        fuelTypeId: fuelTypeId,
        ccCapacity: ccCapacity,
        registerYear: registerYear,
        acAvailable: acAvailable,
        runningKm: runningKm,
        carrier: carrier,
        pucExpiry: pucExpiry,
        insuranceExpiry: insuranceExpiry,
        insuranceImage: insuranceImage,
        insuranceCompany: insuranceCompany,
        insuranceType: insuranceType,
        fitnessExpiry: fitnessExpiry,
        fitnessImage: fitnessImage,
        permitExpiry: permitExpiry,
        permitImage: permitImage,
        roadTaxExpiry: roadTaxExpiry,
        authorizationExpiry: authorizationExpiry,
        authorizationImage: authorizationImage,
        vehiclePicFront: vehiclePicFront,
        vehiclePicLeft: vehiclePicLeft,
        vehiclePicRight: vehiclePicRight,
        saleAgreementFirst: saleAgreementFirst,
        saleAgreementLast: saleAgreementLast,
        rcFrontImage: rcFrontImage,
        rcBackImage: rcBackImage,
        pucImage: pucImage,
        pucCertificate: pucCertificate);

    print("$request vehicle registration request.......");

    try {
      await apiHandler
          .registerVehicle(request: request, context: context)
          .then((response) {
        print("$response register vehicle.........");
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  editVehicleRegistration({
    required String vehicleNo,
    required String brandId,
    required String colorId,
    required String vehicleId,
    required String vehicleNameId,
    required String fuelTypeId,
    required String ccCapacity,
    required String registerYear,
    required String acAvailable,
    required String runningKm,
    required String carrier,
    required String pucExpiry,
    required String insuranceCompany,
    required String insuranceType,
    required String insuranceExpiry,
    required String insuranceImage,
    required String fitnessExpiry,
    required String fitnessImage,
    required String permitExpiry,
    required String permitImage,
    required String roadTaxExpiry,
    required String authorizationExpiry,
    required String authorizationImage,
    required String vehiclePicFront,
    required String vehiclePicLeft,
    required String vehiclePicRight,
    required String saleAgreementFirst,
    required String saleAgreementLast,
    required String rcFrontImage,
    required String rcBackImage,
    required String pucImage,
    required String pucCertificate,
  }) async {
    final apiHandler = EditVehicleDetailsViewModel();

    EditVehicleDetailsRequestModel request = EditVehicleDetailsRequestModel(
        vehicleNo: vehicleNo,
        brandId: brandId,
        vehicleId: vehicleId,
        colorId: colorId,
        vehicleNameId: vehicleNameId,
        fuelTypeId: fuelTypeId,
        ccCapacity: ccCapacity,
        registerYear: registerYear,
        acAvailable: acAvailable,
        runningKms: runningKm,
        carrier: carrier,
        pucExpiry: pucExpiry,
        insuranceExpiry: insuranceExpiry,
        insuranceImage: insuranceImage,
        insuranceCompany: insuranceCompany,
        insuranceType: insuranceType,
        fitnessExpiry: fitnessExpiry,
        fitnessImage: fitnessImage,
        permitExpiry: permitExpiry,
        permitImage: permitImage,
        roadTaxExpiry: roadTaxExpiry,
        authorizationExpiry: authorizationExpiry,
        authorizationImage: authorizationImage,
        vehiclePicFront: vehiclePicFront,
        vehiclePicLeft: vehiclePicLeft,
        vehiclePicRight: vehiclePicRight,
        saleAgreementFirst: saleAgreementFirst,
        saleAgreementLast: saleAgreementLast,
        rcFrontImage: rcFrontImage,
        rcBackImage: rcBackImage,
        pucImage: pucImage,
        pucCertificate: pucCertificate);

    print("$request vehicle registration request.......");

    try {
      await apiHandler
          .editVehicle(request: request, context: context)
          .then((response) {
        print("$response register vehicle.........");
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  String vehicleNumber = "";
  String vehicleType = "";
  String color = "";
  String brandName = "";
  String vehicleName = "";
  String ccCapacity = "";
  String registerYear = "";
  String acAvailable = "";
  String runningKm = "";
  String fuelType = "";
  String carrier = "";
  String pucExpiry = "";
  String insuranceCompanyName = "";
  String insuranceType = "";
  String insuranceExpiry = "";
  String fitnessExpiry = "";
  String permitExpiry = "";
  String roadTaxExpiry = "";
  String authorizationExpiry = "";

  String vehicleFrontImageUrl = "";
  String vehicleBackImageUrl = "";
  String vehicleRightImageUrl = "";
  String vehicleLeftImageUrl = "";
  String rcFrontImageUrl = "";
  String rcBackImageUrl = "";
  String rcInsuranceImageUrl = "";
  String fitnessImageUrl = "";
  String pucImageUrl = "";
  String vehicleId = "";
  String isEdit = "";
  var data;

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      vehicleNumber = data[PassingParameters.vehicleNumber].toString();
      vehicleType = data[PassingParameters.vehicleType].toString();
      color = data[PassingParameters.color].toString();
      brandName = data[PassingParameters.brandName].toString();
      vehicleName = data[PassingParameters.vehicleName].toString();
      ccCapacity = data[PassingParameters.ccCapacity].toString();
      registerYear = data[PassingParameters.registerYear].toString();
      acAvailable = data[PassingParameters.acAvailable].toString();
      runningKm = data[PassingParameters.runningKm].toString();
      fuelType = data[PassingParameters.fuelType].toString();
      carrier = data[PassingParameters.carrier].toString();
      pucExpiry = data[PassingParameters.pucExpiry].toString();
      insuranceCompanyName =
          data[PassingParameters.insuranceCompanyName].toString();
      insuranceType = data[PassingParameters.insuranceType].toString();
      insuranceExpiry = data[PassingParameters.insuranceExpiry].toString();
      fitnessExpiry = data[PassingParameters.fitnessExpiry].toString();
      permitExpiry = data[PassingParameters.permitExpiry].toString();
      roadTaxExpiry = data[PassingParameters.roadTaxExpiry].toString();
      authorizationExpiry =
          data[PassingParameters.authorisationExpiry].toString();
      vehicleId = data["vehicleId"].toString();
      isEdit = data["isEdit"].toString();
      print("$vehicleNumber vehicle number.........");
      print("$insuranceCompanyName insuranceCompanyName number.........");
      vehicleFrontImageUrl = data[PassingParameters.vehiclePicFront];
      vehicleBackImageUrl = data[PassingParameters.vehiclePicBack];
      vehicleRightImageUrl = data[PassingParameters.vehiclePicRight];
      vehicleLeftImageUrl = data[PassingParameters.vehiclePicLeft];
      rcFrontImageUrl = data[PassingParameters.rcPhotoFront];
      rcBackImageUrl = data[PassingParameters.rcPhotoBack];
      rcInsuranceImageUrl = data[PassingParameters.insurancePhoto];
      fitnessImageUrl = data[PassingParameters.fitnessPhoto];
      setState(() {});
    }
    super.didChangeDependencies();
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
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 20.h,
              ),
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
                              pickImageFromCamara(1);
                              setState(() {});
                            },
                          ),
                          UploadDocumentWidget(
                            titleName: StringConstant.saleAgreementLastPic,
                            onTap: () {
                              pickImageFromCamara(2);
                              setState(() {});
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
                              pickImageFromCamara(3);
                              setState(() {});
                            },
                            isUploaded: isAuthorisationPic ? true : false,
                            file: authorisationFile,
                          ),
                          UploadDocumentWidget(
                            titleName: StringConstant.permitPhoto,
                            isUploaded: isPermitPic ? true : false,
                            file: permitFile,
                            onTap: () {
                              pickImageFromCamara(4);
                              setState(() {});
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
                              setState(() {
                                pickImageFromCamara(5);
                              });
                            },
                          ),
                          UploadDocumentWidget(
                            titleName: StringConstant.roadTaxPhoto,
                            onTap: () {
                              pickImageFromCamara(6);
                              setState(() {});
                            },
                            isUploaded: isRoadTaxPic ? true : false,
                            file: roadTaxFile,
                          ),
                        ],
                      ),
                      20.h.VBox,
                      AppButton(
                        StringConstant.submit,
                        () async {
                          if (isEdit == "false") {
                            vehicleRegistration(
                              vehicleNo: vehicleNumber,
                              brandId: brandName,
                              colorId: color,
                              vehicleNameId: vehicleName,
                              fuelTypeId: fuelType,
                              ccCapacity: ccCapacity,
                              registerYear: registerYear,
                              acAvailable: acAvailable,
                              runningKm: runningKm,
                              carrier: carrier,
                              pucExpiry: pucExpiry,
                              insuranceCompany: insuranceCompanyName,
                              insuranceType: insuranceType,
                              insuranceExpiry: insuranceExpiry,
                              insuranceImage: rcInsuranceImageUrl,
                              fitnessExpiry: fitnessExpiry,
                              fitnessImage: fitnessImageUrl,
                              permitExpiry: permitExpiry,
                              permitImage: permitImageUrl,
                              roadTaxExpiry: roadTaxExpiry,
                              authorizationExpiry: authorizationExpiry,
                              authorizationImage: authorisationImageUrl,
                              pucCertificate: pucImageUrl,
                              pucImage: pucImageUrl,
                              rcBackImage: rcBackImageUrl,
                              rcFrontImage: rcFrontImageUrl,
                              saleAgreementLast: saleAgreementFirstPageImageUrl,
                              saleAgreementFirst: saleAgreementLastPageImageUrl,
                              vehiclePicRight: vehicleRightImageUrl,
                              vehiclePicLeft: vehicleLeftImageUrl,
                              vehiclePicFront: vehicleFrontImageUrl,
                            );
                          } else if (isEdit == "true") {
                            editVehicleRegistration(
                              vehicleId: vehicleId,
                              vehicleNo: vehicleNumber,
                              brandId: brandName,
                              colorId: color,
                              vehicleNameId: vehicleName,
                              fuelTypeId: fuelType,
                              ccCapacity: ccCapacity,
                              registerYear: registerYear,
                              acAvailable: acAvailable,
                              runningKm: runningKm,
                              carrier: carrier,
                              pucExpiry: pucExpiry,
                              insuranceCompany: insuranceCompanyName,
                              insuranceType: insuranceType,
                              insuranceExpiry: insuranceExpiry,
                              insuranceImage: rcInsuranceImageUrl,
                              fitnessExpiry: fitnessExpiry,
                              fitnessImage: fitnessImageUrl,
                              permitExpiry: permitExpiry,
                              permitImage: permitImageUrl,
                              roadTaxExpiry: roadTaxExpiry,
                              authorizationExpiry: authorizationExpiry,
                              authorizationImage: authorisationImageUrl,
                              pucCertificate: pucImageUrl,
                              pucImage: pucImageUrl,
                              rcBackImage: rcBackImageUrl,
                              rcFrontImage: rcFrontImageUrl,
                              saleAgreementLast: saleAgreementFirstPageImageUrl,
                              saleAgreementFirst: saleAgreementLastPageImageUrl,
                              vehiclePicRight: vehicleRightImageUrl,
                              vehiclePicLeft: vehicleLeftImageUrl,
                              vehiclePicFront: vehicleFrontImageUrl,
                            );
                          }
                        },
                        height: 41.h,
                      ),
                      10.h.VBox
                    ],
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

/*

      var parsed = jsonDecode(response.body);
      LoginResponseModel userModel = LoginResponseModel.fromJson(parsed);
      print(userModel.message.toString() + " data..........");
      print(userModel.data.toString() + " data..........");

      if (userModel.success.toString() == "1") {
        navigator.pushNamedAndRemoveUntil(RouteName.vehicleRegisterSuccess);
      }
    } catch (e) {
      print(e.toString() + " error of api.........");
    }

*/ /*
    var parsed = jsonDecode(response.body);
    LoginResponseModel userModel = LoginResponseModel.fromJson(parsed);
    Map<String, dynamic> otpDataValue = userModel.data[0];
    String otpValue = otpDataValue['otp'].toString();*/ /*

    setState(() {});

    */ /*navigator.pushNamedAndRemoveUntil(RouteName.otpVerification, arguments: {
      'type': "Register",
      "otp": otpValue,
      "mobileNumber": mobileNo
    });*/ /*
    setState(() {
      isLoading = false;
    });
  }*/
