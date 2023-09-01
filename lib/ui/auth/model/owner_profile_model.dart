class OwnerProfileModel {
  dynamic id;
  String? profileImage;
  String? firstName;
  String? lastName;
  dynamic whatsAppNumber;
  dynamic mobileNo;
  String? emailId;
  dynamic totalVehicleCount;

  OwnerProfileModel({
    this.id,
    this.profileImage,
    this.firstName,
    this.lastName,
    this.whatsAppNumber,
    this.mobileNo,
    this.emailId,
    this.totalVehicleCount,
  });

  factory OwnerProfileModel.fromJson(Map<String, dynamic> json) =>
      OwnerProfileModel(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        whatsAppNumber:
            json["whatsapp_number"] == null ? null : json["whatsapp_number"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        emailId: json["email_id"] == null ? null : json["email_id"],
        totalVehicleCount: json["totalVehicleCount"] == null
            ? null
            : json["totalVehicleCount"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'whatsapp_number': whatsAppNumber,
        'mobile_no': mobileNo,
        'email_id': emailId,
        'profile_image': profileImage,
        'totalVehicleCount': totalVehicleCount,
      };
}
