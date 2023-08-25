class InsuranceCompanyRequestModel {
  Map<String, dynamic> toMap() {
    return {};
  }
}

class InsuranceCompanyResponseModel {
  InsuranceCompanyResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory InsuranceCompanyResponseModel.fromJson(Map<String, dynamic> json) =>
      InsuranceCompanyResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
