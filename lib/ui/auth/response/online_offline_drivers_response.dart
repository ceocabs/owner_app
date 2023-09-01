class OnlineOfflineDriversRequestModel {
  late dynamic ownerId;
  late dynamic status;

  OnlineOfflineDriversRequestModel({
    required this.ownerId,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'owner_id': ownerId,
      'status': status,
    };
  }
}


class OnlineOfflineDriversResponseModel {
  OnlineOfflineDriversResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory OnlineOfflineDriversResponseModel.fromJson(Map<String, dynamic> json) =>
      OnlineOfflineDriversResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
