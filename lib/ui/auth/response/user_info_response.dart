class UserInfoRequestModel {
  late int? userId;

  UserInfoRequestModel({
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
    };
  }
}

class UserInfoResponseModel {
  UserInfoResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory UserInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      UserInfoResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],

        /*data: List<UserDataModel>.from(
          json["data"].map(
            (x) => UserDataModel.fromJson(x),
          ),
        ),*/
      );
}
