import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../res.dart';

class SecondLoadingWidget extends StatefulWidget {
  const SecondLoadingWidget({Key? key}) : super(key: key);

  @override
  State<SecondLoadingWidget> createState() => _SecondLoadingWidgetState();
}

class _SecondLoadingWidgetState extends State<SecondLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RippleAnimation(
            color: Colors.white,
            delay: const Duration(milliseconds: 300),
            repeat: true,
            minRadius: 100,
            ripplesCount: 6,
            duration: const Duration(milliseconds: 6 * 300),
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(Res.logo),
            ),
          )
        ],
      ),
    );
  }
}
