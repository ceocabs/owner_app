class OwnerDriverModel {


  dynamic id;
  String? firstName;
  String? lastName;
  String? profileType;
  dynamic mobileNo;
  dynamic whatsappNumber;
  String? emailId;
  String? profileImage;
  String? approvalStatus;


  OwnerDriverModel({
    this.id,
    this.firstName,
    this.lastName,
    this.profileType,
    this.mobileNo,
    this.whatsappNumber,
    this.emailId,
    this.profileImage,
    this.approvalStatus
});



  factory OwnerDriverModel.fromJson(Map<String, dynamic> json) => OwnerDriverModel(
    id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    profileType: json["profile_type"] == null ? null : json["profile_type"],
    mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
    whatsappNumber: json["whatsapp_number"] == null ? null : json["whatsapp_number"],
    emailId: json["email_id"] == null ? null : json["email_id"],
    profileImage: json["profile_image"] == null ? null : json["profile_image"],
    approvalStatus: json["approval_status"] == null ? null : json["approval_status"],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'profile_type': profileType,
    'mobile_no': mobileNo,
    'whatsapp_number': whatsappNumber,
    'email_id': emailId,
    'profile_image': profileImage,
    'approval_status': approvalStatus,
  };


}