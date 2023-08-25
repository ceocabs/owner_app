import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:proste_bezier_curve/utils/type/index.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/text_form_filed.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: kToolbarHeight + 1,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.chat,
          style: textBold.copyWith(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
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
              height: double.infinity,
              padding: EdgeInsets.only(
                left: 11.w,
                right: 11.w,
                top: 20.h,
              ),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 17.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.h.VBox,
                      AppTextField(
                        label: StringConstant.searchUser,
                        hint: StringConstant.searchUser,
                        prefixIcon: const Icon(Icons.search),
                      ),
                      10.h.VBox,
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                navigator.pushNamedAndRemoveUntil(
                                    RouteName.messageScreen);
                              },
                              child: Container(
                                padding: EdgeInsets.only(bottom: 18.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Res.user,
                                          width: 31.w,
                                          height: 31.h,
                                        ),
                                        10.w.HBox,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Wade Warren",
                                              style: textBold.copyWith(
                                                  fontSize: 14.sp),
                                            ),
                                            const Text("Hi,"),
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                      "10 min",
                                      style: textBold.copyWith(
                                          fontSize: 11.sp,
                                          color: AppColor.greyColor),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          physics: const ScrollPhysics(),
                          itemCount: 13,
                          shrinkWrap: true,
                        ),
                      )
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
