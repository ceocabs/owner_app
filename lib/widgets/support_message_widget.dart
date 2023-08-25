import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/extensions/export.dart';
import '../values/colors.dart';
import '../values/style.dart';

class SupportMessageWidget extends StatefulWidget {
  String message;
  String senderType;
  String time;
  VoidCallback callback;
  String messageType;

  SupportMessageWidget(
      {Key? key,
      required this.message,
      required this.senderType,
      required this.time,
      required this.messageType,
      required this.callback})
      : super(key: key);

  @override
  _SupportMessageWidgetState createState() => _SupportMessageWidgetState();
}

class _SupportMessageWidgetState extends State<SupportMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.h, bottom: 0.h,),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.messageType == "Text"
              ? Flexible(
                  child: Row(
                    children: [
                      Image.asset("assets/images/user.png", width: 25.w,height: 25.w,),
                      10.w.HBox,
                      Container(
                        padding: EdgeInsets.only(
                          top: 12.h,
                          bottom: 12.h,
                          right: 20.w,
                          left: 20.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.darkBlue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.w),
                            bottomRight: Radius.circular(8.w),
                            topLeft: Radius.circular(8.w),
                            topRight: Radius.circular(8.w),
                          ),
                        ),
                        child: Text(
                          widget.message,
                          softWrap: true,
                          maxLines: 10,
                          style: textRegular.copyWith(
                            color: AppColor.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : widget.messageType == "Audio"
                  ? InkWell(
                      onTap: widget.callback,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        width: 200.w,
                        height: 55.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                         /*   Image.asset(
                              currentAudio == widget.message
                                  ? "assets/images/pause.png"
                                  : "assets/images/play_audio.png",
                              width: 50.w,
                              height: 20.h,
                            ),*/
                            10.w.HBox,
                            Image.asset(
                              "assets/images/wave.png",
                              width: 120.w,
                              height: 40.h,
                            )
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: widget.callback,
                      child: Image.network(
                        widget.message,
                        width: 100.w,
                        height: 100.h,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            "assets/images/load_image.png",
                            width: 100.w,
                            height: 100.h,
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.time,
                style:
                    textRegular.copyWith(fontSize: 14.sp, color: AppColor.grey),
              ),
            ],
          ).wrapPaddingAll(8.w)
        ],
      ),
    );
  }
}
