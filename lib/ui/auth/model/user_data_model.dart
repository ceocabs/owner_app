class UserDataModel {
  dynamic id;
  dynamic ownerCode;
  dynamic firstName;
  dynamic lastName;
  dynamic profileType;
  dynamic mobileNo;
  dynamic whatsAppNumber;
  dynamic emailId;
  dynamic city;
  dynamic state;
  dynamic permanentAddress;
  dynamic currentAddress;
  dynamic pinCode;
  dynamic adharCardNo;
  dynamic adharCardFrontImage;
  dynamic adharCardBackImage;
  dynamic aadharStatus;
  dynamic panCardNo;
  dynamic panCardImage;
  dynamic panStatus;
  dynamic drivingLicenseNo;
  dynamic drivingLicenceFrontImage;
  dynamic drivingLicenceBackImage;
  dynamic drivingLicenceExpiry;
  dynamic drivingLicenceType;
  dynamic drivingLicenseCategory;
  dynamic licenseStatus;
  dynamic approvalBy;
  dynamic approvalDate;
  dynamic approvalStatus;
  dynamic profileImage;
  dynamic profileStatus;
  dynamic status;
  dynamic activeStatus;
  dynamic phoneVerified;
  dynamic rememberToken;
  dynamic emailVerifiedAt;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  UserDataModel(
      {
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
      this.adharCardNo,
      this.adharCardFrontImage,
      this.adharCardBackImage,
      this.activeStatus,
      this.panCardNo,
      this.panCardImage,
      this.panStatus,
      this.drivingLicenseNo,
      this.drivingLicenceBackImage,
      this.drivingLicenceExpiry,
      this.drivingLicenceType,
      this.drivingLicenceFrontImage,
      this.drivingLicenseCategory,
      this.licenseStatus,
      this.approvalBy,
      this.approvalStatus,
      this.approvalDate,
      this.aadharStatus,
      this.profileStatus,
      this.rememberToken,
      this.emailVerifiedAt,
      this.phoneVerified,
      this.profileImage,
      this.status,
      this.updatedBy,
      this.deletedAt,
      this.updatedAt,
      this.createdAt,
      this.createdBy});


  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json["id"] == null ? null : json["id"],
        ownerCode: json["owner_code"] == null ? null : json["owner_code"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        profileType: json["profile_type"] == null ? null : json["profile_type"],
        profileStatus:
            json["profile_status"] == null ? null : json["profile_status"],
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
        adharCardNo:
            json["adhaar_card_no"] == null ? null : json["adhaar_card_no"],
        adharCardFrontImage: json["adhaar_card_front_image"] == null
            ? null
            : json["adhaar_card_front_image"],
        adharCardBackImage: json["adhaar_card_back_image"] == null
            ? null
            : json["adhaar_card_back_image"],
        aadharStatus:
            json["aadhar_status"] == null ? null : json["aadhar_status"],
        panCardNo: json["pancard_no"] == null ? null : json["pancard_no"],
        panCardImage:
            json["pancard_image"] == null ? null : json["pancard_image"],
        drivingLicenceFrontImage: json["driving_license_front_image"] == null
            ? null
            : json["driving_license_front_image"],
        panStatus: json["pan_status"] == null ? null : json["pan_status"],
        drivingLicenceBackImage: json["id"] == null ? null : json["id"],
        drivingLicenseNo: json["driving_license_no"] == null
            ? null
            : json["driving_license_no"],
        drivingLicenceExpiry: json["driving_license_expiry"] == null
            ? null
            : json["driving_license_expiry"],
        drivingLicenceType: json["driving_license_type"] == null
            ? null
            : json["driving_license_type"],
        drivingLicenseCategory: json["driving_license_category"] == null
            ? null
            : json["driving_license_category"],
        licenseStatus:
            json["license_status"] == null ? null : json["license_status"],
        approvalBy: json["approved_by"] == null ? null : json["approved_by"],
        approvalStatus:
            json["approval_status"] == null ? null : json["approval_status"],
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
        'current_address': currentAddress,
        'pincode': pinCode,
        'adhaar_card_no': adharCardNo,
        'adhaar_card_front_image': adharCardFrontImage,
        'adhaar_card_back_image': adharCardBackImage,
        'aadhar_status': aadharStatus,
        'pancard_no': panCardNo,
        'pancard_image': panCardImage,
        'pan_status': panStatus,
        'driving_license_no': drivingLicenseNo,
        'driving_license_front_image': drivingLicenceFrontImage,
        'driving_license_back_image': drivingLicenceBackImage,
        'driving_license_expiry': drivingLicenceExpiry,
        'driving_license_type': drivingLicenceType,
        'approval_status': approvalStatus,
        'profile_image': profileImage,
        'profile_status': profileStatus,
        'status': status,
        'active_status': activeStatus,
        'phone_verified': phoneVerified,
        'remember_token': rememberToken,
        'email_verified_at': emailVerifiedAt,
        'created_by': createdAt,
        'updated_by': updatedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };
}
