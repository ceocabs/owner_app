class CheckDocumentRequestModel {
  late int? userId;

  CheckDocumentRequestModel({
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
    };
  }
}


class CheckDocumentResponseModel {
  CheckDocumentResponseModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  dynamic data;

  factory CheckDocumentResponseModel.fromJson(Map<String, dynamic> json) =>
      CheckDocumentResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
