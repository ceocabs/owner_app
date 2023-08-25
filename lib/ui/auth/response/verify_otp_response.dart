///LoginRequestModel
class VerifyOtpRequestModel {
  late int? phoneNo;
  late int? otp;


  VerifyOtpRequestModel(
      {required this.phoneNo,
        required this.otp,
        });

  Map<String, dynamic> toMap() {
    return {
      'phone': phoneNo,
      'verifyotp': otp,
    };
  }
}

///LoginResponseModel
class VerifyOtpResponseModel {
  VerifyOtpResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : json["data"],
      );
}


/*LoginResponseData.fromJson(json["data"])*/