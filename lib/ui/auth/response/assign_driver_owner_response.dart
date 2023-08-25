class AssignDriverToOwnerRequestModel {
  late dynamic ownerId;
  late dynamic driverId;

  AssignDriverToOwnerRequestModel({
    required this.ownerId,
    required this.driverId,
  });

  Map<String, dynamic> toMap() {
    return {
      'owner_id': ownerId,
      'driver_id': driverId,
    };
  }
}


class AssignDriverOwnerResponseModel {
  AssignDriverOwnerResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory AssignDriverOwnerResponseModel.fromJson(Map<String, dynamic> json) =>
      AssignDriverOwnerResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
