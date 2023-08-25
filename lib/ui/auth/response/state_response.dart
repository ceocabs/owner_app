class StateRequestModel {
  Map<String, dynamic> toMap() {
    return {};
  }
}

class StateResponseModel {
  StateResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory StateResponseModel.fromJson(Map<String, dynamic> json) =>
      StateResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
