import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../res.dart';
import '../values/colors.dart';
import '../values/style.dart';

class UploadDocumentWidget extends StatefulWidget {
  VoidCallback onTap;
  String titleName;
  File? file;
  bool isUploaded = false;

  UploadDocumentWidget(
      {Key? key,
      required this.titleName,
      required this.onTap,
      required this.isUploaded,
      this.file})
      : super(key: key);

  @override
  State<UploadDocumentWidget> createState() => _UploadDocumentWidgetState();
}

class _UploadDocumentWidgetState extends State<UploadDocumentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 100.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.blue,
              ),
            ),
            child: Center(
              child: widget.isUploaded
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        widget.file!,
                        width: 100.h,
                        height: 80.h,
                        fit: BoxFit.fill,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            Res.uploadImage,
                            width: 30.h,
                            height: 30.h,
                          );
                        },
                      ),
                    )
                  : Image.asset(
                      Res.uploadImage,
                      width: 30.h,
                      height: 30.h,
                    ),
            ),
          ),
        ),
        5.h.VBox,
        Container(
          width: 100.h,
          child: Text(
            widget.titleName,
            textAlign: TextAlign.center,
            style: textBold.copyWith(
              fontSize: 12.sp,
              color: AppColor.green,
            ),
          ),
        )
      ],
    );
  }
}
