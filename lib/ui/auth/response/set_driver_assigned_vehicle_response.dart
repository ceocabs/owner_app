class SetDriverAssignVehicleRequestModel {
  late String? driverId;
  late String? vehicleId;

  SetDriverAssignVehicleRequestModel({
    required this.driverId,
    required this.vehicleId,
  });

  Map<String, dynamic> toMap() {
    return {
      'driverId': driverId,
      'vehicleId': vehicleId,
    };
  }
}

class SetDriverAssignVehicleResponseModel {
  SetDriverAssignVehicleResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory SetDriverAssignVehicleResponseModel.fromJson(Map<String, dynamic> json) =>
      SetDriverAssignVehicleResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
