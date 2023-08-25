import 'dart:io';

class DriverImageUploadRequestModel {
  late File? file;
  late String? folderName;

  DriverImageUploadRequestModel({required this.file, required this.folderName});

  Map<String, dynamic> toMap() {
    return {
      'file': file,
      'folder': folderName,
    };
  }
}

class DriverImageUploadResponseModel {
  DriverImageUploadResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory DriverImageUploadResponseModel.fromJson(Map<String, dynamic> json) =>
      DriverImageUploadResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
