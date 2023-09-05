class DriverEarningRequestModel {
  late String? uId;
  late String? interval;

  DriverEarningRequestModel({
    required this.uId,
    required this.interval,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uId,
      'interval': interval,
    };
  }
}

class DriverEarningResponseModel {
  DriverEarningResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory DriverEarningResponseModel.fromJson(Map<String, dynamic> json) =>
      DriverEarningResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
