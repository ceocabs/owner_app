class EditVehicleRequestModel {
   dynamic vehicleId;
   String? pucImage;
   String? pucCertificate;
   String? insuranceImage;
   String? fitnessImage;
   String? permitImage;
   String? roadTaxImage;
   String? authorizationImage;
   String? vehiclePicFrontImage;
   String? vehiclePicBackImage;
   String? vehiclePicLeftImage;
   String? vehiclePicRightImage;
   String? rcFrontImage;
   String? rcBackImage;
   String? saleAgreementFirst;
   String? saleAgreementLast;

  EditVehicleRequestModel({
    required this.vehicleId,
    required this.pucImage,
    required this.pucCertificate,
    required this.insuranceImage,
    required this.fitnessImage,
    required this.permitImage,
    required this.roadTaxImage,
    required this.authorizationImage,
    required this.vehiclePicFrontImage,
    required this.vehiclePicBackImage,
    required this.rcFrontImage,
    required this.rcBackImage,
    required this.saleAgreementFirst,
    required this.saleAgreementLast,
  });

  Map<String, dynamic> toMap() {
    return {
      'vehicle_id': vehicleId,
      'puc_image': pucImage,
      'puc_certificate': pucCertificate,
      'insurance_image': insuranceImage,
      'fitness_image': fitnessImage,
      'permit_image': permitImage,
      'roadtax_image': roadTaxImage,
      'authorization_image': authorizationImage,
      'vehicle_pic_front': vehiclePicFrontImage,
      'vehicle_pic_back': vehiclePicBackImage,
      'vehicle_pic_left': vehiclePicLeftImage,
      'vehicle_pic_right': vehiclePicRightImage,
      'rc_front_image': rcFrontImage,
      'rc_back_image': rcBackImage,
      'sale_agreement_first': saleAgreementFirst,
      'sale_agreement_last': saleAgreementLast,
    };
  }
}

class EditVehicleResponseModel {
  EditVehicleResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory EditVehicleResponseModel.fromJson(Map<String, dynamic> json) =>
      EditVehicleResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
