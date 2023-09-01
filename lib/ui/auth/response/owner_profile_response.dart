class OwnerProfileRequestModel {
  late dynamic ownerId;

  OwnerProfileRequestModel({
    required this.ownerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': ownerId,
    };
  }
}


class OwnerProfileResponseModel {
  OwnerProfileResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory OwnerProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      OwnerProfileResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
