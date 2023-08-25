class OwnerStatusRequestModel {
  late dynamic ownerId;

  OwnerStatusRequestModel({
    required this.ownerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'owner_id': ownerId,
    };
  }
}


class OwnerStatusResponseModel {
  OwnerStatusResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory OwnerStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      OwnerStatusResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
