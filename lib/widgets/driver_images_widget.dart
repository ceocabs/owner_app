import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';

import '../res.dart';
import '../values/colors.dart';
import '../values/style.dart';

class DriverImagesWidget extends StatefulWidget {
  String? profileImage;
  String? titleName;

  DriverImagesWidget({
    Key? key,
    required this.profileImage,
    required this.titleName,
  }) : super(key: key);

  @override
  State<DriverImagesWidget> createState() => _DriverImagesWidgetState();
}

class _DriverImagesWidgetState extends State<DriverImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
     // width: 450.w,
      //  height: 450.h,
      /*padding: EdgeInsets.only(
        right: 20.w,
        left: 20.w,
      ),*/
      child: Card(
        shape: RoundedRectangleBorder(
          side:  BorderSide(
            color: Colors.grey.withOpacity(0.3),
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
            top: 10.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.w),
                    child: Image.network(
                      widget.profileImage.toString(),
                      width: 100.h,
                      height: 80.h,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          Res.user,
                          width: 100.h,
                          height: 80.h,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                  5.h.VBox,
                  Container(
                    width: 100.w,
                    child: Text(
                      widget.titleName.toString(),
                      style: textBold.copyWith(
                        color: AppColor.black
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  5.h.VBox,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
