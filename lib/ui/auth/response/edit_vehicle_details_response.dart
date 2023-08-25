class EditVehicleDetailsRequestModel {
  dynamic vehicleId;
  String? vehicleNo;
  dynamic vehicleTypeId;
  String? vehicleCategoryId;
  String? brandId;
  String? colorId;
  String? vehicleNameId;
  String? ccCapacity;
  String? registerYear;
  String? acAvailable;
  String? runningKms;
  String? fuelTypeId;
  String? carrier;
  String? pucExpiry;
  String? pucImage;
  String? pucCertificate;
  String? insuranceCompany;
  String? insuranceType;
  String? insuranceExpiry;
  String? insuranceImage;
  String? fitnessExpiry;
  String? fitnessImage;
  String? permitExpiry;
  String? permitImage;
  String? roadTaxExpiry;
  String? roadTaxImage;
  String? authorizationExpiry;
  String? authorizationImage;
  String? vehiclePicFront;
  String? vehiclePicBack;
  String? vehiclePicLeft;
  String? vehiclePicRight;
  String? rcFrontImage;
  String? rcBackImage;
  String? saleAgreementFirst;
  String? saleAgreementLast;

  EditVehicleDetailsRequestModel({
    this.vehicleId,
    this.vehicleNo,
    this.vehicleTypeId,
    this.vehicleCategoryId,
    this.brandId,
    this.colorId,
    this.vehicleNameId,
    this.ccCapacity,
    this.registerYear,
    this.acAvailable,
    this.runningKms,
    this.fuelTypeId,
    this.carrier,
    this.pucExpiry,
    this.pucImage,
    this.pucCertificate,
    this.insuranceCompany,
    this.insuranceType,
    this.insuranceExpiry,
    this.insuranceImage,
    this.fitnessExpiry,
    this.fitnessImage,
    this.permitExpiry,
    this.permitImage,
    this.roadTaxExpiry,
    this.roadTaxImage,
    this.authorizationExpiry,
    this.authorizationImage,
    this.vehiclePicFront,
    this.vehiclePicBack,
    this.vehiclePicLeft,
    this.vehiclePicRight,
    this.rcFrontImage,
    this.rcBackImage,
    this.saleAgreementFirst,
    this.saleAgreementLast,
  });

  Map<String, dynamic> toMap() {
    return {
      'vehicle_id': vehicleId,
      'vehicle_no': vehicleNo,
      'vehicletype_id': vehicleTypeId,
      'vehicle_category_id': vehicleCategoryId,
      'brand_id': brandId,
      'color_id': colorId,
      'vehicle_name_id': vehicleNameId,
      'cc_capacity': ccCapacity,
      'register_year': registerYear,
      'ac_available': acAvailable,
      'running_kms': runningKms,
      'fuel_type_id': fuelTypeId,
      'carrier': carrier,
      'puc_expiry': pucExpiry,
      'puc_image': pucImage,
      'puc_certificate': pucCertificate,
      'insurance_company': insuranceCompany,
      'insurance_type': insuranceType,
      'insurance_expiry': insuranceExpiry,
      'insurance_image': insuranceImage,
      'fitness_expiry': fitnessExpiry,
      'fitness_image': fitnessImage,
      'permit_expiry': permitExpiry,
      'permit_image': permitImage,
      'roadtax_expiry': roadTaxExpiry,
      'authorization_expiry': authorizationExpiry,
      'authorization_image': authorizationImage,
      'vehicle_pic_front': vehiclePicFront,
      'vehicle_pic_left': vehiclePicLeft,
      'vehicle_pic_right': vehiclePicRight,
      'rc_front_image': rcFrontImage,
      'rc_back_image': rcBackImage,
      'sale_agreement_first': saleAgreementFirst,
      'sale_agreement_last': saleAgreementLast,
    };
  }
}

class EditVehicleDetailsResponseModel {
  EditVehicleDetailsResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory EditVehicleDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      EditVehicleDetailsResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
