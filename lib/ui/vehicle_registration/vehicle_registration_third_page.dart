import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../core/navigation/routes.dart';
import '../../../res.dart';
import '../../../values/colors.dart';
import '../../../values/string_contsant.dart';
import '../../../values/style.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/upload_documet_widget.dart';
import '../../values/passing_parameters.dart';
import '../../widgets/custom_info_dialog.dart';
import '../auth/response/driver_image_upload_response.dart';
import '../auth/viewModel/upload_image_viewModel.dart';
import 'package:http/http.dart' as http;

class VehicleRegistrationThirdPage extends StatefulWidget {
  const VehicleRegistrationThirdPage({Key? key}) : super(key: key);

  @override
  State<VehicleRegistrationThirdPage> createState() =>
      _VehicleRegistrationThirdPageState();
}

class _VehicleRegistrationThirdPageState
    extends State<VehicleRegistrationThirdPage> {
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
  File? pucImageFile;

  File? image;
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
  String vehicleId = "";
  String isEdit = "";

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
      vehicleFrontImage = parsed['data'].toString();
      print("$vehicleFrontImage vehicle front image url......");
    } else if (index == 2) {
      vehicleBackImage = parsed['data'].toString();
      print("$vehicleBackImage vehicle back image url......");
    } else if (index == 3) {
      vehicleRightImage = parsed['data'].toString();
      print("$vehicleRightImage vehicle right image url......");
    } else if (index == 4) {
      vehicleLeftImage = parsed['data'].toString();
      print("$vehicleLeftImage vehicle left image url......");
    } else if (index == 5) {
      rcFrontImage = parsed['data'].toString();
      print("$rcFrontImage rc front image url......");
    } else if (index == 6) {
      rcBackImage = parsed['data'].toString();
      print("$rcBackImage rc back image url......");
    } else if (index == 7) {
      insuranceImage = parsed['data'].toString();
      print("$insuranceImage insurance image url......");
    } else if (index == 8) {
      fitnessImage = parsed['data'].toString();
      print("$fitnessImage fitness image url......");
    } else if (index == 8) {
      pucExpiry = parsed['data'].toString();
      print("$pucExpiry pucExpiry image url......");
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
        pucImageFile = imageTemp;
        isPUCPic = true;
        await uploadImageMethod(
          context: context,
          file: pucImageFile,
          folderName: "test",
          index: 9,
        );
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
          index: 1,
        );
      } else if (i == 2) {
        vehicleBackImageFile = imageTemp;
        isVehicleBackPic = true;
        await uploadImageMethod(
          context: context,
          file: vehicleBackImageFile,
          folderName: "test",
          index: 2,
        );
      } else if (i == 3) {
        vehicleRightImageFile = imageTemp;
        isVehicleRightPic = true;
        await uploadImageMethod(
          context: context,
          file: vehicleRightImageFile,
          folderName: "test",
          index: 3,
        );
      } else if (i == 4) {
        vehicleLeftImageFile = imageTemp;
        isVehicleLeftPic = true;
        await uploadImageMethod(
          context: context,
          file: vehicleLeftImageFile,
          folderName: "test",
          index: 4,
        );
      } else if (i == 5) {
        rcFrontImageFile = imageTemp;
        isRcBookFrontPic = true;
        await uploadImageMethod(
          context: context,
          file: rcFrontImageFile,
          folderName: "test",
          index: 5,
        );
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
          index: 7,
        );
      } else if (i == 8) {
        fitnessImageFile = imageTemp;
        isFitnessPic = true;
        await uploadImageMethod(
          context: context,
          file: fitnessImageFile,
          folderName: "test",
          index: 8,
        );
      } else if (i == 9) {
        pucImageFile = imageTemp;
        isPUCPic = true;
        await uploadImageMethod(
          context: context,
          file: pucImageFile,
          folderName: "test",
          index: 9,
        );
      }
      navigator.pop();
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void checkValidation() {
    if (vehicleFrontImage == "" || vehicleFrontImage == null) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.vehicleFrontImage,
          );
        },
      );
    } else if (vehicleBackImage == "" || vehicleBackImage == null) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.vehicleBackImage,
          );
        },
      );
    } else if (vehicleRightImage == "" || vehicleRightImage == null) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.vehicleRightImageValidations,
          );
        },
      );
    } else if (vehicleLeftImage == "" || vehicleLeftImage == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.vehicleLeftImageValidations,
          );
        },
      );
    } else if (rcFrontImage == "" || rcFrontImage == null) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.vehicleRcFrontImageValidations,
          );
        },
      );
    } else if (rcBackImage == "" || rcBackImage == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.vehicleRcBackImageValidations,
          );
        },
      );
    } else if (insuranceImage == "" || insuranceImage == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.vehicleInsuranceImageValidations,
          );
        },
      );
    } else if (fitnessImage == "" || fitnessImage == "") {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomInfoDialog(
            title: StringConstant.alert,
            description: StringConstant.vehicleFitnessImageValidations,
          );
        },
      );
    } else {
      navigator.pushNamed(RouteName.vehicleRegistrationFourthPage, arguments: {
        PassingParameters.vehicleType: vehicleType,
        PassingParameters.color: color,
        PassingParameters.brandName: brandName,
        PassingParameters.vehicleName: vehicleName,
        PassingParameters.ccCapacity: ccCapacity,
        PassingParameters.registerYear: registerYear,
        PassingParameters.acAvailable: acAvailable,
        PassingParameters.runningKm: runningKm,
        PassingParameters.fuelType: fuelType,
        PassingParameters.carrier: carrier,
        PassingParameters.pucExpiry: pucExpiry,
        PassingParameters.insuranceCompanyName: insuranceCompanyName,
        PassingParameters.insuranceType: insuranceType,
        PassingParameters.pucExpiry: pucExpiry,
        PassingParameters.insuranceExpiry: insuranceExpiry,
        PassingParameters.fitnessExpiry: fitnessExpiry,
        PassingParameters.permitExpiry: permitExpiry,
        PassingParameters.roadTaxExpiry: roadTaxExpiry,
        PassingParameters.authorisationExpiry: authorizationExpiry,
        PassingParameters.vehiclePicFront: vehicleFrontImage,
        PassingParameters.vehiclePicBack: vehicleBackImage,
        PassingParameters.vehiclePicRight: vehicleRightImage,
        PassingParameters.vehiclePicLeft: vehicleLeftImage,
        PassingParameters.rcPhotoFront: rcFrontImage,
        PassingParameters.rcPhotoBack: rcBackImage,
        PassingParameters.insurancePhoto: insuranceImage,
        PassingParameters.fitnessPhoto: fitnessImage,
        PassingParameters.vehicleNumber: vehicleNumber,
        PassingParameters.vehicleId: vehicleId,
        PassingParameters.isEdit: isEdit,
      });
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

  var data;

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
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

        print("$insuranceType insurance type................");
        print("$insuranceExpiry insurance expiry................");
        print("$fitnessExpiry fitness expiry................");
        print("$permitExpiry permit expiry................");
        print("$roadTaxExpiry road expiry................");
        print(
            "$authorizationExpiry authorizationExpiry expiry................");

        print("$vehicleNumber vehicle number................");
        print("$color vehicle number................");
        print("$brandName color................");
        print("$vehicleName vehicleName................");
        print("$ccCapacity ccCapacity................");
        print("$registerYear registerYear................");
        print("$acAvailable acAvailable................");
        print("$runningKm runningKm................");
        print("$fuelType fuelType................");
        print("$carrier carrier...............");
        print("$pucExpiry pucExpiry................");
      });
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
              //  height: 520.h,
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
                          ),
                          20.h.VBox,
                          Row(
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
                          ),
                          20.h.VBox,
                          Row(
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
                          ),
                          20.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UploadDocumentWidget(
                                titleName: StringConstant.insurancePhoto,
                                isUploaded: isInsurancePic ? true : false,
                                file: insuranceImageFile,
                                onTap: () async {
                                  await choosePlatform(context, 7);
                                  setState(() {});
                                },
                              ),
                              UploadDocumentWidget(
                                titleName: StringConstant.fitnessPhoto,
                                onTap: () async {
                                  await choosePlatform(context, 8);
                                  setState(() {});
                                },
                                isUploaded: isFitnessPic ? true : false,
                                file: fitnessImageFile,
                              ),
                            ],
                          ),
                          20.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UploadDocumentWidget(
                                titleName: StringConstant.pucTitle,
                                isUploaded: isPUCPic ? true : false,
                                file: pucImageFile,
                                onTap: () async {
                                  await choosePlatform(context, 9);
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          20.h.VBox,
                          AppButton(
                            StringConstant.next,
                            () {
                              checkValidation();
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
