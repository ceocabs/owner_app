import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner/util/app_utils.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/req_parameters.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../values/validations.dart';
import '../../values/validator.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/custom_info_dialog.dart';
import '../../widgets/text_form_filed.dart';
import '../../widgets/upload_documet_widget.dart';
import '../auth/login_screen.dart';
import '../auth/response/login_response.dart';

class BankDetailsPage extends StatefulWidget {
  const BankDetailsPage({Key? key}) : super(key: key);

  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController bankAddressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isCancelCheque = false;
  File? cancelChequeFile;

  sendBankDetailsRequest({
    required String ownerId,
    required String firstName,
    required String bankLinkedNumber,
    required String accountNo,
    required String ifscCode,
    required String accountType,
    //  required String city,
  }) async {
    var req = http.MultipartRequest(
        'POST', Uri.parse("http://3.6.38.95/public/api/addbankdetails"));
    final headers = {
      'Content-Type': 'application/json',
    };

    req.headers.addAll(headers);
    req.fields[Req.ownerId] = ownerId;
    req.fields[Req.holderName] = firstName;
    req.fields[Req.holderMobile] = bankLinkedNumber;
    req.fields[Req.accountNo] = accountNo;
    req.fields[Req.ifscCode] = ifscCode;
    req.fields[Req.accountType] = accountType;
    //req.fields["city"] = city ?? "";

    req.files.add(
      await http.MultipartFile.fromPath(
          Req.cancelChequeImage, cancelChequeFile!.path),
    );

    print("requestBody:   ${req}");
    print("requestBody:   ${req.fields}");
    var response = await req.send();
    print("${response.stream} stream.....");
    print("${response.request} request.....");
    final respStr = await response.stream.bytesToString();
    print("$respStr  response......");
    var responseOfApi = await http.Response.fromStream(response);
    var parsed = jsonDecode(responseOfApi.body);
    LoginResponseModel data = LoginResponseModel.fromJson(parsed);
    print("${data.success}  ");
    if (data.success == "1") {
      navigator.pop();
    }
    showSnackBar(context, data.message.toString());
  }

  choosePlatform(
    BuildContext context,
  ) {
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
                    pickImageFromGallery();
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
                    pickImageFromCamara();
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

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (image == null) return;
      final imageTemp = File(image.path);
      cancelChequeFile = imageTemp;
      isCancelCheque = true;
      navigator.pop();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageFromCamara() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );
      if (image == null) return;
      final imageTemp = File(image.path);
      cancelChequeFile = imageTemp;
      isCancelCheque = true;
      navigator.pop();
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
          StringConstant.bankDetails,
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
      body: Form(
        key: _formKey,
        child: Container(
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstant.firstName,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.accountHolderName,
                            hint: StringConstant.accountHolderName,
                            controller: accountHolderNameController,
                            validators: firstNameValidator,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.text,
                            maxLength: 20,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.linkedMobileNumber,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.linkedMobileNumber,
                            hint: StringConstant.linkedMobileNumber,
                            controller: mobileNumberController,
                            validators: mobileValidator,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.accountNo,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.accountNo,
                            hint: StringConstant.accountNo,
                            controller: accountNumberController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.ifscCode,
                            style: textRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkBlue,
                            ),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.ifscCode,
                            hint: StringConstant.ifscCode,
                            validators: addressValidator,
                            keyboardType: TextInputType.streetAddress,
                            controller: ifscCodeController,
                            maxLength: 15,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.accountType,
                            style: textRegular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.accountType,
                            hint: StringConstant.accountType,
                            validators: stateValidator,
                            maxLength: 20,
                            controller: accountTypeController,
                            keyboardType: TextInputType.streetAddress,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          10.h.VBox,
                          Text(
                            StringConstant.city,
                            style: textRegular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          AppTextField(
                            label: StringConstant.bankAddress,
                            hint: StringConstant.bankAddress,
                            validators: cityValidator,
                            controller: bankAddressController,
                            keyboardType: TextInputType.streetAddress,
                            inputFormatters: [NoLeadingSpaceFormatter()],
                          ),
                          5.h.VBox,
                          Text(
                            StringConstant.cancelChequePhoto,
                            style: textRegular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.darkBlue),
                          ),
                          5.h.VBox,
                          UploadDocumentWidget(
                            titleName: StringConstant.cancelChequePhoto,
                            onTap: () async {
                              await choosePlatform(context);
                              setState(() {});
                            },
                            isUploaded: isCancelCheque ? true : false,
                            file: cancelChequeFile,
                          ),
                          10.h.VBox,
                          AppButton(
                            StringConstant.submit,
                            () {
                              if (_formKey.currentState!.validate()) {
                                if (isCancelCheque == false) {
                                  showDialog(
                                    barrierColor: Colors.black26,
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                                      return CustomInfoDialog(
                                        title: StringConstant.alert,
                                        description: StringConstant
                                            .cancelChequeValidation,
                                      );
                                    },
                                  );
                                } else {
                                  sendBankDetailsRequest(
                                      ownerId: userId,
                                      firstName:
                                          accountHolderNameController.text,
                                      accountNo: accountNumberController.text,
                                      accountType: accountTypeController.text,
                                      bankLinkedNumber:
                                          mobileNumberController.text,
                                      ifscCode: ifscCodeController.text);
                                }
                              }
                            },
                            height: 41.h,
                          ),
                          20.h.VBox,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
