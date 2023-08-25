class RemoveVehicleRequestModel {
  late dynamic vehicleId;

  RemoveVehicleRequestModel({
    required this.vehicleId,
  });

  Map<String, dynamic> toMap() {
    return {
      'vehicle_id': vehicleId,
    };
  }
}

class RemoveVehicleResponseModel {
  RemoveVehicleResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory RemoveVehicleResponseModel.fromJson(Map<String, dynamic> json) =>
      RemoveVehicleResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
