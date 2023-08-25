class LoginRequestModel {
  late String? phoneNo;
  late String? deviceId;
  late String? deviceType;
  late String? ram;
  late String? processor;
  late String? deviceOs;
  late String? deviceModel;
  late String? customersId;
  late String? manufacturer;

  LoginRequestModel(
      {required this.phoneNo,
        required this.deviceId,
        required this.deviceType,
        required this.ram,
        required this.processor,
        required this.deviceOs,
        required this.deviceModel,
        required this.customersId,
        required this.manufacturer});

  Map<String, dynamic> toMap() {
    return {
      'phone': phoneNo,
      'device_id': deviceId,
      'device_type': deviceType,
      'ram': ram,
      'processor': processor,
      'device_os': deviceOs,
      'device_model': deviceModel,
      'customers_id': customersId,
      'manufacturer': manufacturer,
    };
  }
}


class LoginResponseModel {
  LoginResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            :  json["data"],
      );
}
