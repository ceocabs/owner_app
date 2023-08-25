class RegistrationYearRequestModel {
  RegistrationYearRequestModel();

  Map<String, dynamic> toMap() {
    return {};
  }
}

class RegistrationYearResponseModel {
  RegistrationYearResponseModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  dynamic data;

  factory RegistrationYearResponseModel.fromJson(Map<String, dynamic> json) =>
      RegistrationYearResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
