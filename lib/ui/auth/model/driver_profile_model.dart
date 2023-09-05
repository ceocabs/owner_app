class DriverProfileModel {
  dynamic id;
  String? ownerCode;
  String? firstName;
  String? lastName;
  String? profileType;
  dynamic mobileNo;
  dynamic whatsappNumber;
  String? emailId;
  dynamic city;
  dynamic state;
  String? permanentAddress;
  dynamic currentAddress;
  dynamic pinCode;
  String? adharCardFrontImage;
  String? adharCardBackImage;
  String? adharCardNo;
  String? adharStatus;
  String? panCardNo;
  String? panCardImage;
  String? panStatus;
  String? drivingLicenseNo;
  String? drivingLicenseFrontImage;
  String? drivingLicenceBackImage;
  String? drivingLicenseExpiry;
  dynamic? drivingLicenceType;
  dynamic drivingLicenceCategory;
  dynamic licenceStatus;
  dynamic approvedBy;
  dynamic approvedDate;
  dynamic approvalStatus;
  String? profileImage;
  dynamic status;
  dynamic activeStatus;
  dynamic profileStatus;
  dynamic appStatus;
  dynamic verifiedAt;
  dynamic rememberToken;
  dynamic token;
  dynamic stateName;
  dynamic cityName;

  DriverProfileModel(
      {this.id,
      this.ownerCode,
      this.firstName,
      this.lastName,
      this.profileImage,
      this.mobileNo,
      this.whatsappNumber,
      this.emailId,
      this.city,
      this.permanentAddress,
      this.currentAddress,
      this.pinCode,
      this.adharCardNo,
      this.adharCardFrontImage,
      this.adharCardBackImage,
      this.adharStatus,
      this.panCardNo,
      this.panCardImage,
      this.panStatus,
      this.drivingLicenseNo,
      this.drivingLicenseFrontImage,
      this.drivingLicenceBackImage,
      this.drivingLicenseExpiry,
      this.drivingLicenceType,
      this.drivingLicenceCategory,
      this.licenceStatus,
      this.approvedBy,
      this.approvedDate,
      this.profileStatus,
      this.activeStatus,
      this.appStatus,
      this.profileType,
      this.rememberToken,
      this.token,
      this.status,
      this.cityName,
      this.stateName});

  factory DriverProfileModel.fromJson(Map<String, dynamic> json) =>
      DriverProfileModel(
        id: json["id"] == null ? null : json["id"],
        ownerCode: json["owner_code"] == null ? null : json["owner_code"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        profileType: json["profile_type"] == null ? null : json["profile_type"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        whatsappNumber:
            json["whatsapp_number"] == null ? null : json["whatsapp_number"],
        emailId: json["email_id"] == null ? null : json["email_id"],
        city: json["city"] == null ? null : json["city"],
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
        adharStatus:
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
        drivingLicenceBackImage: json["driving_license_back_image"] == null
            ? null
            : json["driving_license_back_image"],
        drivingLicenseExpiry: json["driving_license_expiry"] == null
            ? null
            : json["driving_license_expiry"],
        drivingLicenceType: json["driving_license_type"] == null
            ? null
            : json["driving_license_type"],
        drivingLicenceCategory: json["driving_license_category"] == null
            ? null
            : json["driving_license_category"],
        licenceStatus:
            json["license_status"] == null ? null : json["license_status"],
        approvedBy: json["approved_by"] == null ? null : json["approved_by"],
        approvedDate:
            json["approved_date"] == null ? null : json["approved_date"],
        profileStatus:
            json["profile_status"] == null ? null : json["profile_status"],
        status: json["status"] == null ? null : json["status"],
        activeStatus:
            json["active_status"] == null ? null : json["active_status"],
        appStatus: json["app_status"] == null ? null : json["app_status"],
        rememberToken:
            json["remember_token"] == null ? null : json["remember_token"],
        token: json["token"] == null ? null : json["token"],
        cityName: json["city_name"] == null ? null : json["city_name"],
        stateName: json["state_name"] == null ? null : json["state_name"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'owner_code': ownerCode,
        'first_name': firstName,
        'last_name': lastName,
        'profile_type': profileType,
        'mobile_no': mobileNo,
        'whatsapp_number': whatsappNumber,
        'email_id': emailId,
        'city': city,
        'permanent_address': permanentAddress,
        'current_address': currentAddress,
        'pincode': pinCode,
        'adhaar_card_no': adharCardNo,
        'adhaar_card_front_image': adharCardFrontImage,
        'adhaar_card_back_image': adharCardBackImage,
        'aadhar_status': adharStatus,
        'pancard_no': panCardNo,
        'pancard_image': panCardImage,
        'pan_status': panStatus,
        'driving_license_no': drivingLicenseNo,
        'driving_license_front_image': drivingLicenseFrontImage,
        'driving_license_back_image': drivingLicenceBackImage,
        'driving_license_expiry': drivingLicenceBackImage,
        'driving_license_type': drivingLicenceBackImage,
        'driving_license_category': drivingLicenceBackImage,
        'license_status': drivingLicenceBackImage,
        'approved_by': drivingLicenceBackImage,
        'approved_date': drivingLicenceBackImage,
        'profile_status': drivingLicenceBackImage,
        'status': drivingLicenceBackImage,
        'active_status': drivingLicenceBackImage,
        'app_status': drivingLicenceBackImage,
        'remember_token': drivingLicenceBackImage,
        'token': drivingLicenceBackImage,
        'city_name': drivingLicenceBackImage,
        'state_name': drivingLicenceBackImage,
      };
}
