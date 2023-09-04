import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

Helper helperClass = Helper.getInstance();

class Helper {
  static Helper? _instance;

  int? countOfCartData;
  int? currentTabIndex;

  Helper._();

  factory Helper.getInstance() {
    _instance = Helper._();
    return _instance!;
  }

  Future<String?> getId() async {
    late String? id;

    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      id = iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      id = androidDeviceInfo.id; // unique ID on Android
    }

    return id;
  }

  Future<File> selectImageSource(ImageSource source) async {
    Get.back();
    late File imageFile;

    XFile? pickedFile = await ImagePicker().pickImage(
        source: source, maxHeight: 1024, maxWidth: 1024, imageQuality: 100);

    if (pickedFile != null) {
      print(pickedFile.path);
      imageFile = File(pickedFile.path);
    }
    print("Size --------------> ${imageFile.lengthSync()} Bytes");
    return imageFile;
  }


















  Future<List<String>> getAllImages(List<String?>? imageArr) async {
    print("getAllImages");
    late List<String> allPaths = [];

    for (int i = 0; i < (imageArr?.length ?? 0); i++) {
      var iUrl = imageArr?[i];
      if (iUrl != null && iUrl != "") {
        final url = Uri.parse(iUrl);
        final resp = await http.get(url);
        final bytes = resp.bodyBytes;
        final temp = await getTemporaryDirectory();
        final path = '${temp.path}/image${i}.jpg';
        File(path).writeAsBytesSync(bytes);
        allPaths.add(path);
        print(allPaths);
      }
    }

    return allPaths;
  }


  Future<List<String>> DownloadAllImages(List<String?>? imageArr) async {
    print("getAllImages");
    late List<String> allPaths = [];

    for (int i = 0; i < (imageArr?.length ?? 0); i++) {
      var iUrl = imageArr?[i];
      if (iUrl != null && iUrl != "") {
        final url = Uri.parse(iUrl);
        final resp = await http.get(url);
        final bytes = resp.bodyBytes;
        final temp = await getTemporaryDirectory();
        final path = '${temp.path}/image${i}.jpg';
        File(path).writeAsBytesSync(bytes);
//        await Dio().download(urlPath, path)
        allPaths.add(iUrl);
        print(allPaths);
      }
    }
    // await Dio().download(urlPath, savePath)
    return allPaths;
  }

  Future<List<String>> WhatsappImages(List<String?>? imageArr) async {
    print("getAllImages");
    late List<String> allPaths = [];

    for (int i = 0; i < (imageArr?.length ?? 0); i++) {
      var iUrl = imageArr?[i];
      if (iUrl != null && iUrl != "") {
        final url = Uri.parse(iUrl);

        final resp = await http.get(url);
        final bytes = resp.bodyBytes;
        final temp = await getTemporaryDirectory();
        final path = '${temp.path}/image${i}.jpg';
        // shareWhatsapp.share(text: "_kTextMessage", file: XFile());
        File(path).writeAsBytesSync(bytes);
        if (path != null && path != "") {
          allPaths.add(path);
          String? result = allPaths.join(path);
          print("result...$result");

          print(allPaths);
        }
      }
    }

    return allPaths;
  }




  static String getDisplayDate(DateTime createDate) {
    DateFormat formatter = new DateFormat('MMM dd, yyyy');
    return formatter.format(createDate);
  }
}
