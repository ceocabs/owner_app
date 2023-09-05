import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../values/colors.dart';
import '../values/string_contsant.dart';
import '../values/style.dart';

class CustomInfoDialog extends StatefulWidget {
  String title;
  String description;

  CustomInfoDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<CustomInfoDialog> createState() => _CustomInfoDialogState();
}

class _CustomInfoDialogState extends State<CustomInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15),
          Text(
            "${widget.title}",
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColor.red),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 10.w,
            ),
            child: Text(
              "${widget.description}",
              style: textMedium,
            ),
          ),
          SizedBox(height: 20.h),
          const Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.h,
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop();
                setState(() {});
              },
              child: Center(
                child: Text(
                  StringConstant.okay,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
