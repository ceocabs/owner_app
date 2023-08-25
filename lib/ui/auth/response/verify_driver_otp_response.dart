class VerifyDriverOTPRequestModel {
  late dynamic mobileNo;
  late dynamic otp;

  VerifyDriverOTPRequestModel({
    required this.mobileNo,
    required this.otp,
  });

  Map<String, dynamic> toMap() {
    return {
      'mobile_no': mobileNo,
      'otp': otp,
    };
  }
}


class VerifyDriverOTPResponseModel {
  VerifyDriverOTPResponseModel({
    this.success,
    this.message,
    this.data,
  });

  int? success;
  dynamic message;
  dynamic data;

  factory VerifyDriverOTPResponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyDriverOTPResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
