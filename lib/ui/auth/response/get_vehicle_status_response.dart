import 'dart:io';

class GetVehicleStatusRequestModel {
  late dynamic ownerId;
  late dynamic status;

  GetVehicleStatusRequestModel({required this.ownerId, required this.status});

  Map<String, dynamic> toMap() {
    return {
      'owner_id': ownerId,
      'status': status,
    };
  }
}

class GetVehicleStatusResponseModel {
  GetVehicleStatusResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory GetVehicleStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      GetVehicleStatusResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
