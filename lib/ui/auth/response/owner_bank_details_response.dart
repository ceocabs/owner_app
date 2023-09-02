class OwnerBankDetailsRequestModel {
  late dynamic ownerId;

  OwnerBankDetailsRequestModel({
    required this.ownerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'ownerId': ownerId,
    };
  }
}

class OwnerBankDetailsResponseModel {
  OwnerBankDetailsResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory OwnerBankDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      OwnerBankDetailsResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
