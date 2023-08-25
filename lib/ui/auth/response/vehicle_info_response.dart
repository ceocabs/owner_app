class VehicleInfoRequestModel {
  late String? vehicleId;

  VehicleInfoRequestModel({
    required this.vehicleId,
  });

  Map<String, dynamic> toMap() {
    return {
      'vehicle_id': vehicleId,
    };
  }
}


class VehicleInfoResponseModel {
  VehicleInfoResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory VehicleInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      VehicleInfoResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
