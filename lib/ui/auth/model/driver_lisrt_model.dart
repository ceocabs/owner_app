class DriverListModel {
  int? id;
  String? ownerCode;
  String? firstName;
  String? lastName;
  String? profileType;
  String? mobileNo;
  String? whatsAppNumber;
  String? emailId;
  dynamic city;
  dynamic state;
  dynamic permanentAddress;
  dynamic currentAddress;
  String? pinCode;
  String? adhaarCardNo;
  String? adhaarCardFrontImage;
  String? adhaarCardBackImage;
  String? adhaarCardStatus;
  String? panCardNo;
  String? panCardImage;
  String? panStatus;
  String? drivingLicenseNo;
  String? drivingLicenseFrontImage;
  String? drivingLicenseBackImage;
  dynamic drivingLicenseExpiry;
  dynamic drivingLicenseType;
  dynamic drivingLicenseCategory;
  dynamic licenseStatus;
  dynamic approvedBy;
  dynamic approvedDate;
  dynamic approvalStatus;
  dynamic profileImage;
  String? profileStatus;
  String? status;
  dynamic activeStatus;
  dynamic phoneVerified;
  dynamic rememberToken;
  dynamic emailVerifiedAt;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  DriverListModel({
    this.id,
    this.ownerCode,
    this.firstName,
    this.lastName,
    this.profileType,
    this.mobileNo,
    this.whatsAppNumber,
    this.emailId,
    this.city,
    this.state,
    this.permanentAddress,
    this.currentAddress,
    this.pinCode,
    this.adhaarCardNo,
    this.adhaarCardFrontImage,
    this.adhaarCardBackImage,
    this.adhaarCardStatus,
    this.panCardNo,
    this.panCardImage,
    this.panStatus,
    this.drivingLicenseNo,
    this.drivingLicenseFrontImage,
    this.drivingLicenseBackImage,
    this.drivingLicenseExpiry,
    this.drivingLicenseType,
    this.drivingLicenseCategory,
    this.licenseStatus,
    this.approvedBy,
    this.approvedDate,
    this.approvalStatus,
    this.profileImage,
    this.profileStatus,
    this.status,
    this.activeStatus,
    this.phoneVerified,
    this.rememberToken,
    this.emailVerifiedAt,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  //UserDataModel.fromJson(Map<String, dynamic> json) : id = json['id'];

  factory DriverListModel.fromJson(Map<String, dynamic> json) =>
      DriverListModel(

        id: json["id"] == null ? null : json["id"],
        ownerCode: json["owner_code"] == null ? null : json["owner_code"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        profileType: json["profile_type"] == null ? null : json["profile_type"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        whatsAppNumber:
            json["whatsapp_number"] == null ? null : json["whatsapp_number"],
        emailId: json["email_id"] == null ? null : json["email_id"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        permanentAddress: json["permanent_address"] == null
            ? null
            : json["permanent_address"],
        currentAddress:
            json["current_address"] == null ? null : json["current_address"],
        pinCode: json["pincode"] == null ? null : json["pincode"],
        adhaarCardNo:
            json["adhaar_card_no"] == null ? null : json["adhaar_card_no"],
        adhaarCardFrontImage: json["adhaar_card_front_image"] == null
            ? null
            : json["adhaar_card_front_image"],
        adhaarCardBackImage: json["adhaar_card_back_image"] == null
            ? null
            : json["adhaar_card_back_image"],
        adhaarCardStatus:
            json["aadhar_status"] == null ? null : json["aadhar_status"],
        panCardNo: json["pancard_no"] == null ? null : json["pancard_no"],
        panCardImage:
            json["pancard_image"] == null ? null : json["pancard_image"],
        panStatus: json["pan_status"] == null ? null : json["pan_status"],
        drivingLicenseNo: json["driving_license_no"] == null
            ? null
            : json["driving_license_no"],
        drivingLicenseFrontImage: json["driving_license_front_image"] == null
            ? null
            : json["driving_license_front_image"],
        drivingLicenseBackImage: json["driving_license_back_image"] == null
            ? null
            : json["driving_license_back_image"],
        drivingLicenseExpiry: json["driving_license_expiry"] == null
            ? null
            : json["driving_license_expiry"],
        drivingLicenseType: json["driving_license_type"] == null
            ? null
            : json["driving_license_type"],
        drivingLicenseCategory: json["driving_license_category"] == null
            ? null
            : json["driving_license_category"],
        licenseStatus:
            json["license_status"] == null ? null : json["license_status"],
        approvedBy: json["approved_by"] == null ? null : json["approved_by"],
        approvedDate:
            json["approved_date"] == null ? null : json["approved_date"],
        approvalStatus:
            json["approval_status"] == null ? null : json["approval_status"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        profileStatus:
            json["profile_status"] == null ? null : json["profile_status"],
        status: json["status"] == null ? null : json["status"],
        activeStatus:
            json["active_status"] == null ? null : json["active_status"],
        phoneVerified:
            json["phone_verified"] == null ? null : json["phone_verified"],
        rememberToken:
            json["remember_token"] == null ? null : json["remember_token"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : json["email_verified_at"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        deletedAt: json["deleted_at"] == null ? null : json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'owner_code': ownerCode,
        'first_name': firstName,
        'last_name': lastName,
        'profile_type': profileType,
        'mobile_no': mobileNo,
        'whatsapp_number': whatsAppNumber,
        'email_id': emailId,
        'city': city,
        'state': state,
        'permanent_address': permanentAddress,
        'current_address': currentAddress,
        'pincode': pinCode,
        'adhaar_card_no': adhaarCardNo,
        'adhaar_card_front_image': adhaarCardFrontImage,
        'adhaar_card_back_image': adhaarCardBackImage,
        'aadhar_status': adhaarCardStatus,
        'pancard_no': panCardNo,
        'pancard_image': panCardImage,
        'pan_status': panStatus,
        'driving_license_no': drivingLicenseNo,
        'driving_license_front_image': drivingLicenseFrontImage,
        'driving_license_back_image': drivingLicenseBackImage,
        'driving_license_expiry': drivingLicenseExpiry,
        'driving_license_type': drivingLicenseType,
        'driving_license_category': drivingLicenseCategory,
        'license_status': licenseStatus,
        'approved_by': approvedBy,
        'approved_date': approvedDate,
        'approval_status': approvalStatus,
        'profile_image': profileImage,
        'profile_status': profileStatus,
        'status': status,
        'active_status': activeStatus,
        'phone_verified': phoneVerified,
        'remember_token': rememberToken,
        'email_verified_at': emailVerifiedAt,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };
}
