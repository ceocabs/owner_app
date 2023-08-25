class LogoutRequestModel {
  late int? userId;
  late String? token;

  LogoutRequestModel({
    required this.userId,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'user_token': token,
    };
  }
}


class LogoutResponseModel {
  LogoutResponseModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  dynamic data;

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      LogoutResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
