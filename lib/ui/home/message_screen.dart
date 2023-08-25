import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/style.dart';
import '../../widgets/message_widget.dart';
import '../../widgets/support_message_widget.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<String> senderNameList = ["User", "Driver", "User", "User"];
  List<String> messageList = [
    "Hello",
    "Hi",
    "Where are you?",
    "I am at pick up point"
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          "Wade Warren",
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
                    start: Offset(0, 150),
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
              child: Container(
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 17.w),
                    child: Container(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 20.h),
                        itemBuilder: (BuildContext context, int index) {
                          return senderNameList[index] != "User"
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: SupportMessageWidget(
                                    callback: () {},
                                    messageType: "Text",
                                    message: messageList[index],
                                    time: "",
                                    senderType: "User",
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.centerLeft,
                                  child: MessageWidget(
                                    callback: () {},
                                    messageType: "Text",
                                    message: messageList[index],
                                    isRead: false,
                                    time: "",
                                    senderType: "User",
                                  ),
                                );
                        },
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: messageList.length,
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
