import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

import '../../res.dart';
import '../../values/colors.dart';
import '../../values/string_contsant.dart';
import '../../values/style.dart';
import '../../widgets/second_loading_widget.dart';
import '../auth/model/ride_history_model.dart';

class TripHistoryDetailsPage extends StatefulWidget {
  const TripHistoryDetailsPage({Key? key}) : super(key: key);

  @override
  _TripHistoryDetailsPageState createState() => _TripHistoryDetailsPageState();
}

class _TripHistoryDetailsPageState extends State<TripHistoryDetailsPage> {
  var data;
  dynamic rideRequest;
  dynamic ratings;
  dynamic driverDetails;
  String customerImage = "";
  bool isLoading = true;
  String rideId = "";

  @override
  Future<void> didChangeDependencies() async {
    data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      setState(() {
        rideId = data["rideId"].toString();
        print("$rideId ride Id.............");
      });
      //    await getRideInfo(context: context, rideId: rideId);
    }
    super.didChangeDependencies();
  }

  dynamic reqData;
  RideHistoryModel? tripHistoryModel;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: isLoading
          ? SecondLoadingWidget()
          : Container(
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
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            //height: 255.h,
                            child: Column(
                              children: [
                                Container(
                                  height: 167.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.w),
                                      topRight: Radius.circular(20.w),
                                      bottomLeft: Radius.circular(20.w),
                                      bottomRight: Radius.circular(20.w),
                                    ),
                                  ),
                                  child: Image.asset(
                                    Res.billFlow,
                                    width: MediaQuery.of(context).size.width,
                                    height: 167.h,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(
                                      left: 10.w,
                                      right: 10.w,
                                      top: 11.h,
                                      bottom: 0.h),
                                  decoration: const BoxDecoration(
                                    color: AppColor.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "₹ ${tripHistoryModel?.price.toString()}/-",
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue,
                                                fontSize: 16.sp),
                                          ),
                                          Text(
                                            StringConstant.paidByOnlineLabel,
                                            style: textBold.copyWith(
                                                fontSize: 14.sp),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${tripHistoryModel?.duration.toString()} Mins | ${tripHistoryModel?.distance.toString()} Km",
                                            style: textRegular.copyWith(
                                                color: AppColor.dark,
                                                fontSize: 16.sp),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              "${tripHistoryModel?.onlineAmount.toString()} Rs.",
                                              style: textRegular.copyWith(
                                                  fontSize: 14.sp,
                                                  color: AppColor.dark),
                                            ),
                                          )
                                        ],
                                      ),
                                      5.h.VBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "₹ ${tripHistoryModel?.cashAmount.toString()} Paid By Cash",
                                            style: textSemiBold.copyWith(
                                                color: AppColor.green,
                                                fontSize: 12.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.h.VBox,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Res.destinationPin,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                  10.w.HBox,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            StringConstant.pickUpLocation,
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue),
                                          ),
                                          5.w.HBox,
                                          Text(
                                            rideRequest['pickup_datetime']
                                                .toString(),
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue),
                                          ),
                                        ],
                                      ),
                                      //  5.h.VBox,
                                      Text(
                                        tripHistoryModel!.pickupAddress
                                            .toString(),
                                        style:
                                            textBold.copyWith(fontSize: 14.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              10.h.VBox,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Res.currentLocationPin,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                  10.w.HBox,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            StringConstant.dropLocation,
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue),
                                          ),
                                          5.w.HBox,
                                          Text(
                                            rideRequest['drop_datetime']
                                                .toString(),
                                            style: textBold.copyWith(
                                                color: AppColor.darkBlue),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        tripHistoryModel!.dropAddress
                                            .toString(),
                                        style:
                                            textBold.copyWith(fontSize: 14.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              16.h.VBox,
                              Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.w),
                                  border: Border.all(
                                    color: AppColor.greyColor.withOpacity(0.6),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 40.h,
                                              width: 40.w,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                customerImage.toString(),
                                                height: 40.h,
                                                width: 40.w,
                                                fit: BoxFit.contain,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return Image.asset(
                                                    Res.user,
                                                    height: 40.h,
                                                    width: 40.w,
                                                    fit: BoxFit.contain,
                                                  );
                                                },
                                              ),
                                            ),
                                            const RatingBar.readOnly(
                                              filledIcon: Icons.star,
                                              emptyIcon: Icons.star_border,
                                              initialRating: 4,
                                              size: 12,
                                              maxRating: 5,
                                            ),
                                          ],
                                        ),
                                        10.w.HBox,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              driverDetails["name"],
                                              style: textBold,
                                            ),
                                            Text(
                                              rideRequest["vehicleType"],
                                              style: textRegular.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.tripRating,
                                style: textBold.copyWith(),
                              ),
                              5.h.VBox,
                              RatingBar.readOnly(
                                filledIcon: Icons.star,
                                emptyIcon: Icons.star_border,
                                initialRating: double.parse(
                                                ratings['rating'].toString()) !=
                                            "" ||
                                        double.parse(
                                                ratings['rating'].toString()) !=
                                            null
                                    ? double.parse(ratings['rating'].toString())
                                    : 0,
                                size: 30,
                                maxRating: 5,
                              ),
                              10.h.VBox,
                              Text(
                                StringConstant.feedBack,
                                style: textBold.copyWith(),
                              ),
                              Text(
                                ratings["message"].toString(),
                                style: textRegular.copyWith(fontSize: 12.sp),
                              ),
                              10.h.VBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 150.w,
                                      height: 41.h,
                                      decoration: BoxDecoration(
                                        color: AppColor.green,
                                        borderRadius:
                                            BorderRadius.circular(10.w),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            StringConstant.support,
                                            style: textBold.copyWith(
                                                color: AppColor.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150.w,
                                    height: 41.h,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColor.greyColor.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(10.w),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          StringConstant.viewInvoice,
                                          style: textBold.copyWith(
                                              color: AppColor.dark),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
