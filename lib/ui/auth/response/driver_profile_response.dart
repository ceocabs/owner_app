class DriverProfileRequestModel {
  late String? userId;


  DriverProfileRequestModel({
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
    };
  }
}

class DriverProfileResponseModel {
  DriverProfileResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory DriverProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      DriverProfileResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
