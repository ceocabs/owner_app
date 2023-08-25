class CityRequestModel {
  late dynamic stateId;

  CityRequestModel({
    required this.stateId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': stateId,
    };
  }
}


class CityResponseModel {
  CityResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory CityResponseModel.fromJson(Map<String, dynamic> json) =>
      CityResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
