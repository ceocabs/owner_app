class SearchDriverRequestModel {
  late dynamic? phone;

  SearchDriverRequestModel({
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'mobile_no': phone,
    };
  }
}

class SearchDriverResponseModel {
  SearchDriverResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory SearchDriverResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchDriverResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
