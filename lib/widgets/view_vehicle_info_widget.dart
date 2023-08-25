import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import '../res.dart';
import '../values/colors.dart';
import '../values/style.dart';

class ViewVehicleInfoWidget extends StatefulWidget {
  String titleName;
  String? image;

  ViewVehicleInfoWidget({Key? key, required this.titleName, this.image})
      : super(key: key);

  @override
  State<ViewVehicleInfoWidget> createState() => _ViewVehicleInfoWidgetState();
}

class _ViewVehicleInfoWidgetState extends State<ViewVehicleInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            border: Border.all(
              width: 1,
              color: Colors.blue,
            ),
          ),
          child: Center(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(10.w),
            child: Image.network(
              widget.image!,
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
          )),
        ),
        5.h.VBox,
        Container(
          width: 100.h,
          child: Text(
            widget.titleName,
            textAlign: TextAlign.center,
            style: textBold.copyWith(
              fontSize: 16.sp,
              color: AppColor.green,
            ),
          ),
        )
      ],
    );
  }
}
