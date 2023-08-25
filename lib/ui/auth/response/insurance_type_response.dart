class InsuranceTypeRequestModel {
  Map<String, dynamic> toMap() {
    return {};
  }
}

class InsuranceTypeResponseModel {
  InsuranceTypeResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory InsuranceTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      InsuranceTypeResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
