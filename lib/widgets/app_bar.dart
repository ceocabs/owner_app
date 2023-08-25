import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../res.dart';


class AppBar extends StatefulWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: (){},
            child: Image.asset(
              Res.leftArrow,
              height: 39.h,
              width: 34.w,
            ),
          )
        ],
      ),
    );
  }
}
