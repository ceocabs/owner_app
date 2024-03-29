import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/widgets/text_form_filed.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../auth/login_screen.dart';
import '../auth/model/owner_bank_details_model.dart';
import '../auth/response/owner_bank_details_response.dart';
import '../auth/viewModel/owner_bank_details_viewModel.dart';

class OwnerBankDetails extends StatefulWidget {
  const OwnerBankDetails({Key? key}) : super(key: key);

  @override
  State<OwnerBankDetails> createState() => _OwnerBankDetailsState();
}

class _OwnerBankDetailsState extends State<OwnerBankDetails> {
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController ownerMobileNoController = TextEditingController();
  TextEditingController bankHolderNameController = TextEditingController();
  TextEditingController bankHolderMobileNoController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();

  List<OwnerBankDetailsModel> ownerBankDetailsModelList = [];
  bool isLoading = false;

  @override
  Future<void> didChangeDependencies() async {
    await ownerBankDetails(context: context, ownerId: userId);
    super.didChangeDependencies();
  }

  ownerBankDetails({
    required BuildContext context,
    required String ownerId,
  }) async {
    final apiHandler = OwnerBankDetailsViewModel();

    OwnerBankDetailsRequestModel request = OwnerBankDetailsRequestModel(
      ownerId: ownerId,
    );

    setState(() {
      isLoading = true;
    });

    try {
      await apiHandler
          .ownerBankDetails(request: request, context: context)
          .then((response) {
        var code = response;

        print("$response response............");
        List<dynamic> driverData = response;
        ownerBankDetailsModelList =
            driverData.map((i) => OwnerBankDetailsModel.fromJson(i)).toList();
        if (ownerBankDetailsModelList.isNotEmpty) {
          ownerNameController.text =
              ownerBankDetailsModelList[0].ownerName.toString();
          ownerMobileNoController.text =
              ownerBankDetailsModelList[0].ownerMobileNo.toString();
          bankHolderNameController.text =
              ownerBankDetailsModelList[0].holderName.toString();
          bankHolderMobileNoController.text =
              ownerBankDetailsModelList[0].holderMobile.toString();
          accountNoController.text =
              ownerBankDetailsModelList[0].accountNo.toString();
          ifscCodeController.text =
              ownerBankDetailsModelList[0].ifscCode.toString();
          accountTypeController.text =
              ownerBankDetailsModelList[0].accountType.toString();
        }
        setState(() {
          isLoading = false;
        });

        setState(() {});

        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColor.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h.VBox,
              Container(
                width: 450.w,
                //  height: 450.h,
                padding: EdgeInsets.only(
                  right: 20.w,
                  left: 20.w,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 20.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.ownerNameTitle,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label: StringConstant.ownerNameTitle,
                              hint: StringConstant.ownerNameTitle,
                              readOnly: true,
                              controller: ownerNameController,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.ownerMobileNo,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label: StringConstant.ownerMobileNo,
                              hint: StringConstant.ownerMobileNo,
                              controller: ownerMobileNoController,
                              readOnly: true,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.bankHolderNameTitle,
                              style: textBold,
                            ),
                            AppTextField(
                              label: StringConstant.bankHolderNameTitle,
                              hint: StringConstant.bankHolderNameTitle,
                              readOnly: true,
                              controller: bankHolderNameController,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.bankHolderMobileNoTitle,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label:  StringConstant.bankHolderMobileNoTitle,
                              hint:  StringConstant.bankHolderMobileNoTitle,
                              controller: bankHolderMobileNoController,
                              readOnly: true,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             StringConstant.accountNo,
                              style: textBold,
                            ),
                            AppTextField(
                              label: StringConstant.accountNo,
                              hint: StringConstant.accountNo,
                              readOnly: true,
                              controller: accountNoController,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.ifscCode,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label: StringConstant.ifscCode,
                              hint: StringConstant.ifscCode,
                              controller: ifscCodeController,
                              readOnly: true,
                            )
                          ],
                        ),
                        10.h.VBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.accountType,
                              style: textBold,
                            ),
                            5.h.VBox,
                            AppTextField(
                              label: StringConstant.accountType,
                              hint: StringConstant.accountType,
                              readOnly: true,
                              controller: accountTypeController,
                            )
                          ],
                        ),
                        10.h.VBox,
                      ],
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
