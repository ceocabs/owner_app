class OwnerUploadRejectedDocRequestModel {

   dynamic ownerId;
   String? profileImage;
   String? panCardImage;
   String? drivingLicenseFrontImage;
   String? drivingLicenseBackImage;
   String? adharCardFrontImage;
   String? adharCardBackImage;

  OwnerUploadRejectedDocRequestModel({
    required this.ownerId,
    required this.profileImage,
    required this.panCardImage,
    required this.drivingLicenseFrontImage,
    required this.drivingLicenseBackImage,
    required this.adharCardFrontImage,
    required this.adharCardBackImage,
  });



  Map<String, dynamic> toMap() {
    return {
      'owner_id': ownerId,
      'profile_image': profileImage,
      'pancard_image': panCardImage,
      'driving_license_front_image': drivingLicenseFrontImage,
      'driving_license_back_image': drivingLicenseBackImage,
      'adhaar_card_front_image': adharCardFrontImage,
      'adhaar_card_back_image': adharCardBackImage,
    };
  }
}

class OwnerUploadRejectedDocResponseModel {
  OwnerUploadRejectedDocResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory OwnerUploadRejectedDocResponseModel.fromJson(Map<String, dynamic> json) =>
      OwnerUploadRejectedDocResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
