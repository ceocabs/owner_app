///LoginRequestModel
class VehicleDetailsRequestModel {
  late dynamic? id;


  VehicleDetailsRequestModel({
    required this.id,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,

    };
  }
}

///ResendOtpResponseModel
class VehicleDetailsResponseModel {
  VehicleDetailsResponseModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  dynamic? data;

  factory VehicleDetailsResponseModel.fromJson(
      Map<String, dynamic> json) =>
      VehicleDetailsResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
