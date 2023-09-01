import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:http/http.dart' as http;
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/upload_documet_widget.dart';
import '../auth/login_screen.dart';
import '../auth/response/driver_image_upload_response.dart';
import '../auth/response/login_response.dart';
import '../auth/response/owner_upload_rejected_doc_response.dart';
import '../auth/viewModel/owner_upload_rejected_doc_viewModel.dart';
import '../auth/viewModel/upload_image_viewModel.dart';

class UploadRejectedDocumentPage extends StatefulWidget {
  const UploadRejectedDocumentPage({Key? key}) : super(key: key);

  @override
  State<UploadRejectedDocumentPage> createState() =>
      _UploadRejectedDocumentPageState();
}

class _UploadRejectedDocumentPageState
    extends State<UploadRejectedDocumentPage> {
  File? image;
  File? profileImageFile;
  File? panCardImageFile;
  File? aadharCardFrontImageFile;
  File? aadharCardBackImageFile;
  File? drivingLicenseFrontImageFile;
  File? drivingLicenseBackImageFile;

  String isAdharStatus = "";
  String isProfileStatus = "";
  String isPanStatus = "";
  String isLicenseStatus = "";

  String whatsAppNumber = "";
  String aadharCardNumber = "";
  String panCardNumber = "";

  bool isProfileImage = false;
  bool isPanCardImage = false;
  bool isAadharCardFrontImage = false;
  bool isAadharCardBackImage = false;
  bool isUploaded = false;
  String referanceId = "";
  String userType = "";

  var data;

  bool isDrivingLicenseFrontImage = false;
  bool isDrivingLicenseBackImage = false;

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        isAdharStatus = data['isAdharStatus'].toString();
        isProfileStatus = data['isProfileStatus'].toString();
        isPanStatus = data['isPanStatus'].toString();
        isLicenseStatus = data['isLicenseStatus'].toString();
        print("${isProfileStatus} + isProfile status.................");
        print("${isLicenseStatus} + isLicenseStatus status.................");
        print("${isAdharStatus} + isAdharStatus status.................");
      });
    }
    super.didChangeDependencies();
  }


  bool isLoading = false;
  String profileImageUrl = "";
  String panCardImageUrl = "";
  String aadharCardFrontImageUrl = "";
  String aadharCardBackImageUrl = "";



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
    if (index == 3) {
      profileImageUrl = parsed['data'].toString();
      print("$profileImageUrl profile image url......");
    } else if (index == 4) {
      panCardImageUrl = parsed['data'].toString();
      print("$panCardImageUrl pan card image url......");
    } else if (index == 1) {
      aadharCardFrontImageUrl = parsed['data'].toString();
      print("$aadharCardFrontImageUrl aadhar card front image url......");
    } else if (index == 2) {
      aadharCardBackImageUrl = parsed['data'].toString();
      print("$aadharCardBackImageUrl aadhar card back image url......");
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

      setState(() {
        isUploaded = true;
      });
      if (i == 1) {
        aadharCardFrontImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 1);
        isAadharCardFrontImage = true;
      } else if (i == 2) {
        aadharCardBackImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 2);
        isAadharCardBackImage = true;
      } else if (i == 3) {

        profileImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 3);
        isProfileImage = true;


      } else if (i == 4) {

        panCardImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 4);
        isPanCardImage = true;

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
        aadharCardFrontImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 1);
        isAadharCardFrontImage = true;
      } else if (i == 2) {
        aadharCardBackImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 2);
        isAadharCardBackImage = true;
      } else if (i == 3) {
        profileImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 3);
        isProfileImage = true;


      } else if (i == 4) {
        panCardImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 4);
        isPanCardImage = true;


      }
      navigator.pop();
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }


  uploadRejectedDocuments(
      {required BuildContext context,
        required String ownerId,
        required String drivingLicenseBackImage,
        required String drivingLicenseFrontImage,
        required String profileImage,
        required String panCardImage,
        required String adharCardFrontImage,
        required String adharCardBackImage,
       }) async {
    final apiHandler = OwnerUploadRejectedDocViewModel();

    OwnerUploadRejectedDocRequestModel request = OwnerUploadRejectedDocRequestModel(
     ownerId: ownerId,
      drivingLicenseBackImage: drivingLicenseBackImage,
      drivingLicenseFrontImage:drivingLicenseFrontImage ,
      profileImage: profileImage,
      panCardImage: panCardImage,
      adharCardFrontImage: adharCardFrontImage,
      adharCardBackImage: adharCardBackImage
    );

    try {
      await apiHandler
          .uploadRejectedDoc(request: request, context: context)
          .then((response) {
        var code = response;
        navigator.pushNamed(RouteName.pendingApprovalPage);
       /* Map<String, dynamic> otpValue = code[0];
        print("${otpValue['otp']} otp value number....");
        navigator.pushNamed(RouteName.otpVerificationPage, arguments: {
          PassingParameters.type: "Login",
          PassingParameters.otp: otpValue['otp'].toString(),
          PassingParameters.mobileNumber: mobileController.text
        });*/
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
                            "Please upload your rejected documents",
                            style: textBold.copyWith(
                                fontSize: 16.sp, color: AppColor.white),
                          ),
                          10.h.VBox,

                          isAdharStatus == "Rejected"
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    UploadDocumentWidget(
                                      titleName:
                                          StringConstant.aadtharCardFrontImage,
                                      isUploaded:
                                          isAadharCardFrontImage ? true : false,
                                      file: aadharCardFrontImageFile,
                                      onTap: () {
                                        choosePlatform(context, 1);
                                        setState(() {

                                        });
                                      },
                                    ),
                                    UploadDocumentWidget(
                                      titleName:
                                          StringConstant.aadtharCardBackImage,
                                      onTap: () {
                                        choosePlatform(context, 2);
                                        setState(() {

                                        });
                                      },
                                      isUploaded:
                                          isAadharCardBackImage ? true : false,
                                      file: aadharCardBackImageFile,
                                    ),
                                  ],
                                )
                              : Container(),
                          isAdharStatus == "Rejected" ? 20.h.VBox : 0.h.VBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              isProfileStatus == "Rejected"
                                  ? UploadDocumentWidget(
                                      titleName: StringConstant.profileImage,
                                      isUploaded: isProfileImage ? true : false,
                                      file: profileImageFile,
                                      onTap: () {
                                        choosePlatform(context, 3);
                                        setState(() {

                                        });
                                      },
                                    )
                                  : Container(),
                              isPanStatus == "Rejected"
                                  ? UploadDocumentWidget(
                                      titleName: StringConstant.panCardImage,
                                      onTap: () {
                                        choosePlatform(context, 4);
                                        setState(() {

                                        });
                                      },
                                      isUploaded: isPanCardImage ? true : false,
                                      file: panCardImageFile,
                                    )
                                  : Container(),
                            ],
                          ),
                          20.h.VBox,
                          AppButton(StringConstant.submit, () async {
                          /*  await sendMultipartRequest(
                              customerId: int.parse(userId),
                            );*/
                            await uploadRejectedDocuments(
                              context: context,
                              ownerId: userId,
                              adharCardBackImage: aadharCardBackImageUrl,
                              adharCardFrontImage: aadharCardFrontImageUrl,
                              panCardImage: panCardImageUrl,
                              profileImage: profileImageUrl,
                              drivingLicenseFrontImage: "",
                              drivingLicenseBackImage: ""
                            );

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


/*sendMultipartRequest({required int customerId}) async {
    var req = http.MultipartRequest(
        'POST', Uri.parse("http://3.6.38.95/public/api/uploaddocuments"));
    final headers = {
      'Content-Type': 'application/json',
    };
    setState(() {
      isLoading = true;
    });
    req.headers.addAll(headers);
    req.fields["id"] = customerId.toString() ?? "";

    isProfileStatus == "Rejected"
        ? req.files.add(
            await http.MultipartFile.fromPath(
                'profile_image', profileImageFile!.path),
          )
        : null;
    isPanStatus == "Rejected"
        ? req.files.add(
            await http.MultipartFile.fromPath(
                'pancard_image', panCardImageFile!.path),
          )
        : null;
    isAdharStatus == "Rejected"
        ? req.files.add(
            await http.MultipartFile.fromPath(
                'adhaar_card_front_image', aadharCardFrontImageFile!.path),
          )
        : null;
    isAdharStatus == "Rejected"
        ? req.files.add(
            await http.MultipartFile.fromPath(
                'adhaar_card_back_image', aadharCardBackImageFile!.path),
          )
        : null;
    isLicenseStatus == "Rejected"
        ? req.files.add(
            await http.MultipartFile.fromPath('driving_license_front_image',
                drivingLicenseFrontImageFile!.path),
          )
        : null;
    isLicenseStatus == "Rejected"
        ? req.files.add(
            await http.MultipartFile.fromPath('driving_license_back_image',
                drivingLicenseBackImageFile!.path),
          )
        : null;

    var streamedResponse = await req.send();
    var response = await http.Response.fromStream(streamedResponse);

    var parsed = jsonDecode(response.body);
    LoginResponseModel userModel = LoginResponseModel.fromJson(parsed);
    Map<String, dynamic> otpDataValue = userModel.data[0];
    if (userModel.success == "1") {
      navigator.pushNamedAndRemoveUntil(RouteName.pendingApprovalPage);
    }
    setState(() {
      isLoading = false;
    });
  }*/


/*  isLicenseStatus == "Rejected"
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    UploadDocumentWidget(
                                      titleName: StringConstant
                                          .drivingLicenseFrontImage,
                                      onTap: () {
                                        choosePlatform(context, 1);
                                        setState(() {

                                        });
                                      },
                                      isUploaded: isDrivingLicenseFrontImage
                                          ? true
                                          : false,
                                      file: drivingLicenseFrontImageFile,
                                    ),
                                    UploadDocumentWidget(
                                      titleName: StringConstant
                                          .drivingLicenseBackImage,
                                      isUploaded: isDrivingLicenseBackImage
                                          ? true
                                          : false,
                                      file: drivingLicenseBackImageFile,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 2);
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : Container(),
                          isLicenseStatus == "Rejected" ? 20.h.VBox : 0.h.VBox,*/