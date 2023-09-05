class UnAssignDriverRequestModel {
  late int? userId;

  UnAssignDriverRequestModel({
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
    };
  }
}

class UnAssignDriverResponseModel {
  UnAssignDriverResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory UnAssignDriverResponseModel.fromJson(Map<String, dynamic> json) =>
      UnAssignDriverResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
