import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner/ui/auth/login_screen.dart';
import 'package:owner/ui/auth/response/register_response.dart';
import 'package:owner/ui/auth/viewModel/upload_image_viewModel.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../util/app_utils.dart';
import '../../values/colors.dart';
import '../../values/passing_parameters.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/upload_documet_widget.dart';
import 'package:http/http.dart' as http;
import 'response/driver_image_upload_response.dart';
import 'viewModel/register_viewModel.dart';

class UploadDocumentPage extends StatefulWidget {
  const UploadDocumentPage({Key? key}) : super(key: key);

  @override
  State<UploadDocumentPage> createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {



  var data;

  String pinCode = "";
  String mobileNo = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String permanentAddress = "";
  String state = "Maharastra";
  String city = "";
  String profileImageUrl = "";
  String panCardImageUrl = "";
  String aadharCardFrontImageUrl = "";
  String aadharCardBackImageUrl = "";
  String referanceId = "";
  String userType = "";
  String profileImage = "";
  String panCardImage = "";
  String aadharCardFrontImage = "";
  String aadharCardBackImage = "";

  File? image;
  File? profileImageFile;
  File? panCardImageFile;
  File? aadharCardFrontImageFile;
  File? aadharCardBackImageFile;
  String whatsAppNumber = "";
  String aadharCardNumber = "";
  String panCardNumber = "";

  bool isProfileImage = false;
  bool isPanCardImage = false;
  bool isAadharCardFrontImage = false;
  bool isAadharCardBackImage = false;
  bool isUploaded = false;
  bool isLoading = false;




  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        firstName = data[PassingParameters.firstName].toString();
        lastName = data[PassingParameters.lastName].toString();
        email = data[PassingParameters.email].toString();
        permanentAddress = data[PassingParameters.permanentAddress].toString();
        state = data[PassingParameters.state].toString();
        city = data[PassingParameters.city].toString();
        pinCode = data[PassingParameters.pinCode].toString();
        mobileNo = data[PassingParameters.mobileNo].toString();
        whatsAppNumber = data[PassingParameters.whatsAppNumber].toString();
        aadharCardNumber = data[PassingParameters.aadharCardNumber].toString();
        panCardNumber = data[PassingParameters.panCardNumber].toString();
        referanceId = data[PassingParameters.referanceId].toString();
        userType = data[PassingParameters.userType].toString();
      });
    }
    super.didChangeDependencies();
  }


  driverRegistration({
    required String firstName,
    required String lastName,
    required String profileType,
    required String mobileNo,
    required String whatsappNumber,
    required String email,
    required String city,
    required String state,
    required String permanentAddress,
    required String pinCode,
    required String adhaarCardNo,
    required String panCardNo,
    required String deviceId,
    required String deviceType,
    required String ram,
    required String processor,
    required String deviceOs,
    required String location,
    required String deviceModel,
    required String customersId,
    required String manufacture,
    required String aadtharCardFrontImage,
    required String aadtharCardBackImage,
  }) async {
    final apiHandler = RegisterViewModel();

    print(aadharCardFrontImageUrl.toString() +
        "  aadhar card front image url........");
    print(aadharCardBackImageUrl.toString() +
        "  aadhar card back image url........");
    print(panCardImageUrl.toString() + "  pan card image url........");
    print(profileImageUrl.toString() + "  profile image url........");

    RegisterRequestModel request = RegisterRequestModel(
        customersId: customersId.toString(),
        firstName: firstName,
        pinCode: pinCode,
        city: city,
        state: state,
        deviceId: "RL 102313",
        deviceModel: deviceModel,
        deviceOs: deviceOs,
        deviceType: deviceType,
        panCardImage: panCardImageUrl,
        lastName: lastName,
        location: "Mumbai",
        permanentAddress: permanentAddress,
        processor: processor,
        profileImage: profileImageUrl,
        profileType: profileType,
        ram: ram,
        email: email,
        aadharCardBackImage: aadharCardBackImageUrl,
        aadharCardFrontImage: aadharCardFrontImageUrl,
        whatsappNumber: whatsAppNumber.toString(),
        aadharCardNumber: aadharCardNumber,
        manufacturer: manufacture,
        panCardNumber: panCardNumber,
        referanceID: "",
        mobileNO: mobileNo.toString());

    try {
      await apiHandler
          .userRegister(request: request, context: context)
          .then((response) {
        var code = response;
        Map<String, dynamic> otpValue = code[0];
        navigator.pushNamedAndRemoveUntil(RouteName.otpVerificationPage,
            arguments: {
              "type": "Login",
              "otp": otpValue['otp'].toString(),
              "mobileNumber": mobileNo
            });
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print(e.toString() + " e...........");
    }
  }



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
    req.fields['folderName'] = 'test';

    var streamedResponse = await req.send();
    var response = await http.Response.fromStream(streamedResponse);
    var parsed = jsonDecode(response.body);
    print("$parsed image added response..........");
    print("${parsed['data']} image url.........");
    if (index == 1) {
      profileImageUrl = parsed['data'].toString();
      print("$profileImageUrl profile image url......");
    } else if (index == 2) {
      panCardImageUrl = parsed['data'].toString();
      print("$panCardImageUrl pan card image url......");
    } else if (index == 3) {
      aadharCardFrontImageUrl = parsed['data'].toString();
      print("$aadharCardFrontImageUrl aadhar card front image url......");
    } else if (index == 4) {
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
        profileImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 1);
        isProfileImage = true;
      } else if (i == 2) {
        panCardImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 2);
        isPanCardImage = true;
      } else if (i == 3) {
        aadharCardFrontImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 3);
        isAadharCardFrontImage = true;
      } else if (i == 4) {
        aadharCardBackImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 4);
        isAadharCardBackImage = true;
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
        profileImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 1);
        isProfileImage = true;
      } else if (i == 2) {
        panCardImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 2);
        isPanCardImage = true;
      } else if (i == 3) {
        aadharCardFrontImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 3);
        isAadharCardFrontImage = true;
      } else if (i == 4) {
        aadharCardBackImageFile = imageTemp;
        await uploadImageMethod(
            context: context,
            file: profileImageFile,
            folderName: "test",
            index: 4);
        isAadharCardBackImage = true;
      }
      navigator.pop();
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void checkValidation() {
    if (profileImage == "" || profileImage == null) {
      showMessage(StringConstant.uploadProfileImageValidation);
    } else if (panCardImage == "" || panCardImage == null) {
      showMessage(StringConstant.panCardImageValidation);
    } else if (aadharCardFrontImage == "" || aadharCardFrontImage == null) {
      showMessage(StringConstant.aadharCardImageValidation);
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
      body: isLoading
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RippleAnimation(
                    color: Colors.white,
                    delay: const Duration(milliseconds: 300),
                    repeat: true,
                    minRadius: 100,
                    ripplesCount: 6,
                    duration: const Duration(milliseconds: 6 * 300),
                    child: Container(
                      child: Image.asset(Res.logo),
                      width: 100.w,
                      height: 100.h,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
            )
          : Container(
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
                            borderRadius: BorderRadius.circular(20.0),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    UploadDocumentWidget(
                                      titleName: StringConstant.profileImage,
                                      isUploaded: isUploaded ? true : false,
                                      file: profileImageFile,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 1);
                                        });
                                      },
                                    ),
                                    UploadDocumentWidget(
                                      titleName: StringConstant.panCardImage,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 2);
                                        });
                                      },
                                      isUploaded: isPanCardImage ? true : false,
                                      file: panCardImageFile,
                                    ),
                                  ],
                                ),
                                20.h.VBox,
                                Row(
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
                                        setState(() {
                                          choosePlatform(context, 3);
                                        });
                                      },
                                    ),
                                    UploadDocumentWidget(
                                      titleName:
                                          StringConstant.aadtharCardBackImage,
                                      onTap: () {
                                        setState(() {
                                          choosePlatform(context, 4);
                                        });
                                      },
                                      isUploaded:
                                          isAadharCardBackImage ? true : false,
                                      file: aadharCardBackImageFile,
                                    ),
                                  ],
                                ),
                                20.h.VBox,
                                AppButton(StringConstant.submit, () async {
                                  if (isProfileImage == false) {
                                    showSnackBar(context,
                                        StringConstant.profileImageValidation);
                                  } else if (isPanCardImage == false) {
                                    showSnackBar(context,
                                        StringConstant.panCardImageValidation);
                                  } else if (isAadharCardBackImage == false) {
                                    showSnackBar(
                                        context,
                                        StringConstant
                                            .aadharCardBackImageValidation);
                                  } else {
                                    driverRegistration(
                                        firstName: firstName,
                                        lastName: lastName,
                                        email: email,
                                        adhaarCardNo: aadharCardNumber,
                                        manufacture: manufacture,
                                        panCardNo: panCardNumber,
                                        state: state,
                                        ram: ram,
                                        profileType: "owner",
                                        processor: "",
                                        permanentAddress: permanentAddress,
                                        mobileNo: mobileNo,
                                        location: "Mumbai",
                                        deviceType: "Android",
                                        deviceOs: deviceOs,
                                        deviceModel: "RX 20366",
                                        deviceId: deviceId,
                                        city: city,
                                        pinCode: pinCode,
                                        customersId: "",
                                        whatsappNumber: whatsAppNumber,
                                        aadtharCardBackImage:
                                            aadharCardBackImageUrl,
                                        aadtharCardFrontImage:
                                            aadharCardFrontImageUrl);

                                    setState(() {});
                                  }
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



/*  await sendMultipartRequest(
                                      firstName: firstName,
                                      lastName: lastName,
                                      state: state,
                                      profileType: "Driver",
                                      pinCode: pinCode,
                                      permanentAddress: permanentAddress,
                                      location: "",
                                      city: city,
                                      deviceId: "ED123",
                                      deviceModel: "asdas",
                                      deviceOs: "12asd",
                                      deviceType: "Android",
                                      processor: "sadsa",
                                      ram: "2gb",
                                      whatsappNumber: whatsAppNumber,
                                      email: email,
                                      customersId: "0",
                                      adhaarCardNo: aadharCardNumber,
                                      emailId: email,
                                      manufacture: "OnePlus",
                                      mobileNo: mobileNo,
                                      pancardNo: panCardNumber,
                                    );*/