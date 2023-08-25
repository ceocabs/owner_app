import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/widgets/text_form_filed.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../values/validations.dart';
import '../auth/response/search_driver_response.dart';
import '../auth/viewModel/search_driver_viewModel.dart';

class SearchDriverPage extends StatefulWidget {
  const SearchDriverPage({Key? key}) : super(key: key);

  @override
  _SearchDriverPageState createState() => _SearchDriverPageState();
}

class _SearchDriverPageState extends State<SearchDriverPage> {
  TextEditingController mobileNumberController = TextEditingController();

  searchDriver({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    final apiHandler = SearchDriverViewModel();

    SearchDriverRequestModel request = SearchDriverRequestModel(
      phone: phoneNumber,
    );

    try {
      await apiHandler
          .searchDriver(request: request, context: context)
          .then((response) {
        if (response.toString() == "1") {
          navigator.pushNamed(RouteName.driverOtpVerificationPage, arguments: {
            "mobileNumber": mobileNumberController.text,
          });
        }
        var code = response;
        Map<String, dynamic> otpValue = code[0];

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.searchDriver,
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20.w),
        color: AppColor.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.h.VBox,
            Container(
              width: 350.w,
              child: Text(
                StringConstant.findDriverTitle,
                style: textBold.copyWith(
                  color: AppColor.darkBlue,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            20.h.VBox,
            AppTextField(
              label: StringConstant.mobileNo,
              hint: StringConstant.mobileNo,
              controller: mobileNumberController,
              maxLength: 10,
              inputFormatters: [
                NoLeadingSpaceFormatter(),
                FilteringTextInputFormatter.deny(RegExp('[\\.|\\,|\\-\\ ]')),
              ],
              keyboardType: TextInputType.number,
              keyboardAction: TextInputAction.done,
            ),
            20.h.VBox,
            Text(
              StringConstant.verifyDriverTitle,
              style:
                  textSemiBold.copyWith(color: AppColor.red, fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
            20.h.VBox,
            InkWell(
              onTap: () async {
                await searchDriver(
                    phoneNumber: mobileNumberController.text, context: context);
              },
              child: Container(
                width: 120.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColor.darkBlue,
                  borderRadius: BorderRadius.circular(15.w),
                ),
                child: Center(
                  child: Text(
                    StringConstant.verify,
                    style: textBold.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
