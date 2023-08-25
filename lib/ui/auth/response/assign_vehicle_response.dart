class AssignVehicleRequestModel {
  late dynamic driverId;
  late dynamic vehicleId;

  AssignVehicleRequestModel({
    required this.driverId,
    required this.vehicleId,
  });

  Map<String, dynamic> toMap() {
    return {
      'driver_id': driverId,
      'vehicle_id': vehicleId,
    };
  }
}

class AssignVehicleResponseModel {
  AssignVehicleResponseModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  dynamic data;

  factory AssignVehicleResponseModel.fromJson(Map<String, dynamic> json) =>
      AssignVehicleResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
