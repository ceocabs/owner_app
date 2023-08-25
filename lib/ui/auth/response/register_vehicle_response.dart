class RegisterVehicleRequestModel {
  late String? vehicleNo;
 // late String? vehicleTypeId;
  late String? brandId;
  late String? colorId;
  late String? vehicleNameId;
  late String? fuelTypeId;
  late String? ccCapacity;
  late String? registerYear;
  late String? acAvailable;
  late String? runningKm;
  late String? carrier;
  late String? pucExpiry;
  late String? insuranceCompany;
  late String? insuranceType;
  late String? insuranceExpiry;
  late String? insuranceImage;
  late String? fitnessExpiry;
  late String? fitnessImage;
  late String? permitExpiry;
  late String? permitImage;
  late String? roadTaxExpiry;
  late String? authorizationExpiry;
  late String? authorizationImage;
  late String? vehiclePicFront;
  late String? vehiclePicLeft;
  late String? vehiclePicRight;
  late String? saleAgreementFirst;
  late String? saleAgreementLast;
  late String? rcFrontImage;
  late String? rcBackImage;
  late String? pucImage;
  late String? pucCertificate;

  RegisterVehicleRequestModel({
    required this.vehicleNo,
  //  required this.vehicleTypeId,
    required this.brandId,
    required this.colorId,
    required this.vehicleNameId,
    required this.fuelTypeId,
    required this.ccCapacity,
    required this.registerYear,
    required this.acAvailable,
    required this.runningKm,
    required this.carrier,
    required this.pucExpiry,
    required this.insuranceExpiry,
    required this.insuranceCompany,
    required this.insuranceType,
    required this.insuranceImage,
    required this.fitnessExpiry,
    required this.fitnessImage,
    required this.permitExpiry,
    required this.permitImage,
    required this.roadTaxExpiry,
    required this.authorizationExpiry,
    required this.authorizationImage,
    required this.vehiclePicFront,
    required this.vehiclePicLeft,
    required this.vehiclePicRight,
    required this.saleAgreementFirst,
    required this.saleAgreementLast,
    required this.rcFrontImage,
    required this.rcBackImage,
    required this.pucImage,
    required this.pucCertificate,
  });

  Map<String, dynamic> toMap() {
    return {
      'vehicle_no': vehicleNo,
      //'vehicletype_id': vehicleTypeId,
      'brand_id': brandId,
      'color_id': colorId,
      'vehicle_name_id': vehicleNameId,
      'fuel_type_id': fuelTypeId,
      'cc_capacity': ccCapacity,
      'register_year': registerYear,
      'ac_available': acAvailable,
      'running_kms': runningKm,
      'carrier': carrier,
      'puc_expiry': pucExpiry,
      "insurance_company": insuranceCompany,
      "insurance_type": insuranceType,
      "insurance_expiry": insuranceExpiry,
      "insurance_image": insuranceImage,
      "fitness_expiry": fitnessExpiry,
      "fitness_image": fitnessImage,
      "permit_expiry": permitExpiry,
      "permit_image": permitImage,
      "authorization_expiry": authorizationExpiry,
      "authorization_image": authorizationImage,
      "vehicle_pic_front": vehiclePicFront,
      "vehicle_pic_left": vehiclePicLeft,
      "vehicle_pic_right": vehiclePicRight,
      "sale_agreement_first": saleAgreementFirst,
      "sale_agreement_last": saleAgreementLast,
      "rc_front_image": rcFrontImage,
      "rc_back_image": rcBackImage,
      "puc_image": pucImage,
      "puc_certificate": pucCertificate,
    };
  }
}

class RegisterVehicleResponseModel {
  RegisterVehicleResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory RegisterVehicleResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterVehicleResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
