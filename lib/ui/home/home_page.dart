import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:owner/ui/auth/model/brand_model.dart';
import 'package:owner/ui/auth/model/color_model.dart';
import 'package:owner/ui/auth/response/get_color_response.dart';
import 'package:owner/ui/auth/model/vehhicle_details_model.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/string_contsant.dart';
import 'dart:ui' as ui;
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/style.dart';
import '../auth/login_screen.dart';
import '../auth/response/get_brand_response.dart';
import '../auth/response/user_info_response.dart';
import '../auth/viewModel/user_info_viewModel.dart';
import '../auth/response/vehicle_details_response.dart';
import '../auth/viewModel/vehicle_details_viewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LatLng currentClientOrderLatLong = const LatLng(21.4858, 39.1925);
  late LatLng latLong1 = const LatLng(21.48583611, 39.1925852100);
  late LatLng latLong2 = const LatLng(21.485820131, 39.19353010);
  late LatLng latLong3 = const LatLng(21.5858554, 39.1825967854);

  String isAdharStatus = "";
  String isPanStatus = "";
  String isLicenseStatus = "";
  String isProfileStatus = "";
  String isApprovalStatus = "";
  List<ColorModel> colorModelList = [];
  List<BrandModel> brandModelList = [];
  List<VehicleDetailsModel> vehicleDetailsModelList = [];

  Set<Marker> markers = {};
  final Set<Polyline> _polyline = {};
  bool isOnline = true;
  bool isInfoWindow = false;

  Future<Uint8List> getBytesFromAsset(
    String path,
  ) async {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: pixelRatio.round() * 30);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Future<void> didChangeDependencies() async {
    await getUserInfo(context: context, userId: userId);

    await getBrand(
      context: context,
    );
    await getColor(context: context);
    await vehicleDetails(context: context, id: int.parse("4"));
    //  await getVehicleType(context: context);
    addMarkers();
    setState(() {});
  }

  getUserInfo({
    required BuildContext context,
    required String userId,
  }) async {
    final apiHandler = UserInfoViewModel();
    UserInfoRequestModel request = UserInfoRequestModel(
      userId: int.parse(userId),
    );

    try {
      await apiHandler
          .getUserInfo(request: request, context: context)
          .then((response) {
        var code = response;
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print(e.toString() + " e...........");
    }
  }

  getColor({
    required BuildContext context,
  }) async {
    final apiHandler = getColorViewModel();
    GetColorRequestModel request = GetColorRequestModel();
    try {
      await apiHandler
          .getColor(context: context, request: request)
          .then((response) {
        var code = response;
        colorModelList = response.map((i) => ColorModel.fromJson(i)).toList();
        print(colorModelList.length.toString() + "  length.........");
        print(colorModelList[0].colorName.toString() + " color name");
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print(e.toString() + " e...........");
    }
  }

  vehicleDetails({
    required BuildContext context,
    required int id,
  }) async {
    final apiHandler = VehicleDetailsViewModel();

    VehicleDetailsRequestModel request =
        VehicleDetailsRequestModel(id: int.parse(id.toString()));

    try {
      await apiHandler
          .vehicleDetails(request: request, context: context)
          .then((response) {
        var code = response;
        print("$code code response................");
        vehicleDetailsModelList =
            response.map((i) => VehicleDetailsModel.fromJson(i)).toList();
        print("${vehicleDetailsModelList.length}  length.........");
        print(
            "${vehicleDetailsModelList[0].insuranceCompany} insurance company name");
        print(
            "${vehicleDetailsModelList[1].insuranceCompany} insurance company name");

        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
    }
  }

  getBrand({
    required BuildContext context,
  }) async {
    final apiHandler = getBrandViewModel();

    try {
      await apiHandler.getBrand(context: context).then((response) {
        var code = response;
        brandModelList = response.map((i) => BrandModel.fromJson(i)).toList();
        print(brandModelList.length.toString() + "  length.........");
        print(brandModelList[0].brandName.toString() + " brand name");

        if (code != null) {
        } else {}
      });
    } catch (e) {
      print(e.toString() + " e...........");
    }
  }

  addMarkers() async {
    final Uint8List endLocationIcon = await getBytesFromAsset(
      Res.trackingCar,
    );

    BitmapDescriptor markerBitMapEndPoint = await BitmapDescriptor.fromBytes(
      endLocationIcon,
      size: const Size(200, 200),
    );
    markers.add(
      Marker(
          markerId: MarkerId(currentClientOrderLatLong.toString()),
          position: currentClientOrderLatLong,
          icon: markerBitMapEndPoint,
          onTap: () {
            setState(() {
              isInfoWindow = true;
            });
          }),
    );
    markers.add(
      Marker(
        markerId: MarkerId(latLong1.toString()),
        position: latLong1,
        onTap: () {
          setState(() {
            isInfoWindow = true;
          });
        },
        icon: markerBitMapEndPoint,
      ),
    );
    markers.add(
      Marker(
          markerId: MarkerId(latLong1.toString()),
          position: latLong2,
          icon: markerBitMapEndPoint,
          onTap: () {
            setState(() {
              isInfoWindow = true;
            });
          }),
    );
    markers.add(
      Marker(
          markerId: MarkerId(latLong1.toString()),
          position: latLong3,
          icon: markerBitMapEndPoint,
          onTap: () {
            setState(() {
              isInfoWindow = true;
            });
          }),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        leading: InkWell(
          onTap: () {
            navigator.pushNamed(RouteName.menuOptionScreen);
          },
          child: const Icon(
            Icons.menu,
            size: 26,
            color: AppColor.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          StringConstant.ceoCabs,
          style: textBold.copyWith(
            color: AppColor.white,
            fontSize: 20,
          ),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40.h,
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              width: MediaQuery.of(context).size.width,
              color: AppColor.darkBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: const BoxDecoration(
                          color: AppColor.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person_outline_outlined),
                      ),
                      10.w.HBox,
                      Text(
                        "John Deo",
                        style: textBold.copyWith(
                          fontSize: 16.sp,
                          color: AppColor.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Total Vehicle : 10",
                    style: textBold.copyWith(
                      fontSize: 16.sp,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 463.h,
              child: GoogleMap(
                zoomControlsEnabled: false,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                polylines: _polyline,
                initialCameraPosition: CameraPosition(
                  target: currentClientOrderLatLong,
                  zoom: 13,
                  bearing: 10,
                  tilt: 10,
                ),
                markers: markers,
                onTap: (position) {},
                gestureRecognizers: Set()
                  ..add(
                    Factory<PanGestureRecognizer>(
                      () => PanGestureRecognizer(),
                    ),
                  ),
                // onMapCreated: _onMapCreated,
              ),
            ),
            Container(
              color: AppColor.white,
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      navigator.pushNamed(RouteName.onlineOfflineDriverScreen);
                    },
                    child: Container(
                      height: 41.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        color: AppColor.green,
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            StringConstant.onlineDrivers,
                            style: textBold.copyWith(color: AppColor.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigator.pushNamed(RouteName.onlineOfflineDriverScreen);
                    },
                    child: Container(
                      height: 41.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        color: AppColor.red,
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            StringConstant.offlineDrivers,
                            style: textBold.copyWith(
                              color: AppColor.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*  getVehicleType({
    required BuildContext context,
  }) async {
    final apiHandler = getVehicleTypeViewModel();
    // GetVehicleTypeRequestModel request = GetVehicleTypeRequestModel(token: token);
    try {
      await apiHandler
          .getVehicleType(
        context: context,
      )
          .then((response) {
        var code = response;
        print(response.toString() + "  response........");
          List<VehicleInfo>? vehicleList = [];

           vehicleList = response.cast<VehicleModel>();
           print(vehicleList.length.toString() + " vehicle list length....");
           print(vehicleList[0].vehicleTypeId.toString() + "   id........");

     */ /*   List<VehicleModel> obj =
            UserInfoResponseModel.fromJson(response as Map<String, dynamic>);
        print(obj.data.toString() + " data in main files.................");
        List<dynamic>? userData = obj.data;
     */ /*  */ /* if (userData != null) {
          // responseObj = userData;
        }*/ /*
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print(e.toString() + " e...........");
    }
  }*/
