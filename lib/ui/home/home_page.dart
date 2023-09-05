import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:owner/ui/auth/model/brand_model.dart';
import 'package:owner/ui/auth/model/color_model.dart';
import 'package:owner/ui/auth/model/owner_profile_model.dart';
import 'package:owner/ui/auth/response/get_color_response.dart';
import 'package:owner/ui/auth/model/vehhicle_details_model.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:owner/values/passing_parameters.dart';
import 'package:owner/values/string_contsant.dart';
import 'dart:ui' as ui;
import '../../core/navigation/navigation_service.dart';
import '../../core/navigation/routes.dart';
import '../../res.dart';
import '../../values/colors.dart';
import '../../values/style.dart';
import '../../widgets/loading_widget.dart';
import '../auth/login_screen.dart';
import '../auth/response/get_brand_response.dart';
import '../auth/response/owner_profile_response.dart';
import '../auth/response/user_info_response.dart';
import '../auth/viewModel/owner_profile_viewModel.dart';
import '../auth/viewModel/user_info_viewModel.dart';
import '../auth/response/vehicle_details_response.dart';
import '../auth/viewModel/vehicle_details_viewModel.dart';
import 'package:location/location.dart' as loc;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LatLng currentClientOrderLatLong = const LatLng(19.0760, 72.8777);
  late LatLng latLong1 = const LatLng(21.48583611, 39.1925852100);
  late LatLng latLong2 = const LatLng(21.485820131, 39.19353010);
  late LatLng latLong3 = const LatLng(21.5858554, 39.1825967854);
  bool isLoading = false;
  String isAdharStatus = "";
  String isPanStatus = "";
  String isLicenseStatus = "";
  String isProfileStatus = "";
  String isApprovalStatus = "";
  List<ColorModel> colorModelList = [];
  List<BrandModel> brandModelList = [];
  List<VehicleDetailsModel> vehicleDetailsModelList = [];
  List<OwnerProfileModel> ownerProfileModelList = [];

  Set<Marker> markers = {};
  final Set<Polyline> _polyline = {};
  bool isOnline = true;
  bool isInfoWindow = false;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error(StringConstant.disableLocationService);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(StringConstant.deniedLocation);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        StringConstant.locationDenied,
      );
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

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
    setState(() {
      isLoading = true;
    });
    Position position = await _getGeoLocationPosition();
    await getCurrentLocation(context);
    await getUserInfo(context: context, userId: userId);
    await getOwnerInfo(context: context, userId: userId);
    setState(() {
      isLoading = false;
    });
    await getBrand(
      context: context,
    );
    await getColor(context: context);
    await vehicleDetails(context: context, id: int.parse("4"));
    //  await getVehicleType(context: context);
    addMarkers();
    setState(() {});
  }

  loc.Location _locationTracker = loc.Location();

  getCurrentLocation(BuildContext context) {
    _locationTracker.onLocationChanged.listen(
      (newLocalData) async {
        currentClientOrderLatLong =
            LatLng(newLocalData.latitude!, newLocalData.longitude!);
        latitude = newLocalData.latitude.toString();
        longnitude = newLocalData.longitude.toString();
        // await getAddressOnTap(currentClientOrderLatLong);
      },
    );
    print("$currentClientOrderLatLong  updated location.........controller");
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
      print("$e e...........");
    }
  }

  getOwnerInfo({
    required BuildContext context,
    required String userId,
  }) async {
    final apiHandler = ownerProfileViewModel();
    OwnerProfileRequestModel request = OwnerProfileRequestModel(
      ownerId: userId,
    );

    try {
      await apiHandler
          .ownerProfile(request: request, context: context)
          .then((response) {
        var code = response;
        ownerProfileModelList =
            response.map((i) => OwnerProfileModel.fromJson(i)).toList();
        print("${ownerProfileModelList.length}  length.........");

        name =
            "${ownerProfileModelList[0].firstName} ${ownerProfileModelList[0].lastName}";
        mobileNo = ownerProfileModelList[0].mobileNo.toString();
        profileImage = ownerProfileModelList[0].profileImage.toString();
        email = ownerProfileModelList[0].emailId.toString();

        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
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
        print("${colorModelList.length}  length.........");
        // print(colorModelList[0].colorName.toString() + " color name");
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
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
        print("${brandModelList.length}  length.........");
        if (code != null) {
        } else {}
      });
    } catch (e) {
      print("$e e...........");
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
      body: isLoading
          ? const LoadingWidget()
          : Column(
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
                            "${ownerProfileModelList[0].firstName} ${ownerProfileModelList[0].lastName}",
                            style: textBold.copyWith(
                              fontSize: 16.sp,
                              color: AppColor.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Total Vehicle : ${ownerProfileModelList[0].totalVehicleCount.toString()}",
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
                    //markers: markers,
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
                          navigator.pushNamed(
                              RouteName.onlineOfflineDriverScreen,
                              arguments: {PassingParameters.searchingType: "Online"});
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
                          navigator.pushNamed(
                              RouteName.onlineOfflineDriverScreen,
                              arguments: {PassingParameters.searchingType: "Offline"});
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
    );
  }
}

String name = "";
String mobileNo = "";
String profileImage = "";
String email = "";
String latitude = "";
String longnitude = "";

