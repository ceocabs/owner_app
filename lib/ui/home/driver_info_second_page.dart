import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';

import '../../core/navigation/navigation_service.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/driver_images_widget.dart';

class DriverInfoSecondPage extends StatefulWidget {
  const DriverInfoSecondPage({Key? key}) : super(key: key);

  @override
  State<DriverInfoSecondPage> createState() => _DriverInfoSecondPageState();
}

class _DriverInfoSecondPageState extends State<DriverInfoSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.driverDetails,
          style: textBold.copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColor.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.h.VBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DriverImagesWidget(
                  profileImage:
                      "https://images.unsplash.com/photo-1542382257-80dedb725088?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1528&q=80",
                  titleName: "Licence Front Image",
                ),
                DriverImagesWidget(
                  profileImage:
                      "https://images.unsplash.com/photo-1542382257-80dedb725088?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1528&q=80",
                  titleName: "Licence Back Image",
                ),
              ],
            ),
            20.h.VBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DriverImagesWidget(
                  profileImage:
                  "https://images.unsplash.com/photo-1542382257-80dedb725088?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1528&q=80",
                  titleName: "Pan Card Front Image",
                ),
                DriverImagesWidget(
                  profileImage:
                  "https://images.unsplash.com/photo-1542382257-80dedb725088?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1528&q=80",
                  titleName: "Pan Card Back Image",
                ),
              ],
            ),
            20.h.VBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DriverImagesWidget(
                  profileImage:
                  "https://images.unsplash.com/photo-1542382257-80dedb725088?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1528&q=80",
                  titleName: "Aadhar Card Front Image",
                ),
                DriverImagesWidget(
                  profileImage:
                  "https://images.unsplash.com/photo-1542382257-80dedb725088?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1528&q=80",
                  titleName: "Aadhar Card Back Image",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
