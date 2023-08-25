import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/extensions/export.dart';
import '../values/colors.dart';
import '../values/style.dart';

class MessageWidget extends StatefulWidget {
  String message;
  String senderType;
  String time;
  bool isRead;
  String messageType;
  VoidCallback callback;

  MessageWidget(
      {Key? key,
      required this.message,
      required this.senderType,
      required this.isRead,
      required this.messageType,
      required this.time,
      required this.callback})
      : super(key: key);

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.h, bottom: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.messageType == "Text"
                  ? Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Container(
                            padding: EdgeInsets.only(
                                top: 12.h, bottom: 12.h, right: 20.w, left: 20.w),
                            decoration:  BoxDecoration(
                              color: AppColor.greyColor.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            child: Text(
                              widget.message,
                              softWrap: true,
                              maxLines: 10,
                              style: textRegular.copyWith(
                                  color: AppColor.dark, fontSize: 12.sp),
                            ),
                          ),
                          10.w.HBox,
                          Image.asset("assets/images/user.png", width: 25.w,height: 25.w,),
                         // 10.w.HBox,
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
                                Image.asset(
                                  currentAudio == widget.message
                                      ? "assets/images/pause.png"
                                      : "assets/images/play_audio.png",
                                  width: 50.w,
                                  height: 20.h,
                                ),
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
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                "assets/images/user.png",
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.contain,
                              );
                            },
                            width: 150.w,
                            height: 120.h,
                            fit: BoxFit.fill,
                          ),
                        ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.time,
                style: textRegular.copyWith(
                  fontSize: 14.sp,
                  color: AppColor.grey,
                ),
              ),
              5.w.HBox,
            /*  Image.asset(
                widget.isRead ? Res.read_message : Res.send,
                width: 13.w,
                height: 8.h,
              )*/
            ],
          ).wrapPaddingAll(0.w)
        ],
      ),
    );
  }
}
String currentAudio = "";