class OwnerDriverRequestModel {
  late dynamic ownerId;

  OwnerDriverRequestModel({
    required this.ownerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'owner_id': ownerId,
    };
  }
}


class OwnerDriverResponseModel {
  OwnerDriverResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory OwnerDriverResponseModel.fromJson(Map<String, dynamic> json) =>
      OwnerDriverResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
