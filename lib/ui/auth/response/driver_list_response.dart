
class DriverListRequestModel {
  late int? userId;

  DriverListRequestModel({
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
    };
  }
}


class DriverListResponseModel {
  DriverListResponseModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  dynamic data;

  factory DriverListResponseModel.fromJson(Map<String, dynamic> json) =>
      DriverListResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
