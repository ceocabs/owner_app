class DriverInfoApprovalModel {

  dynamic id;
  String? name;
  String? profileType;
  dynamic mobileNo;
  dynamic whatsappNumber;
  String? profileImage;
  String? approvalStatus;


  DriverInfoApprovalModel({
    this.id,
    this.name,
    this.profileType,
    this.mobileNo,
    this.whatsappNumber,
    this.profileImage,
    this.approvalStatus
});

  factory DriverInfoApprovalModel.fromJson(Map<String, dynamic> json) => DriverInfoApprovalModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    profileType: json["profile_type"] == null ? null : json["profile_type"],
    mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
    whatsappNumber: json["whatsapp_number"] == null ? null : json["whatsapp_number"],
    profileImage: json["profile_image"] == null ? null : json["profile_image"],
    approvalStatus: json["approval_status"] == null ? null : json["approval_status"],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'profile_type': profileType,
    'mobile_no': mobileNo,
    'whatsapp_number': whatsappNumber,
    'profile_image': profileImage,
    'approval_status': approvalStatus,
  };


}