class VehicleModel {
  dynamic vehiclesId;
  dynamic ownerId;
  dynamic vehicleNo;
  dynamic vehicleTypeId;
  dynamic brandId;
  dynamic colorId;
  dynamic vehicleNameId;
  String? ccCapacity;
  dynamic registerYear;
  dynamic acAvailable;
  String? runningKms;
  dynamic fuelTypeId;
  dynamic carrier;
  String? puc;
  String? pucStatus;
  String? insuranceCompany;
  String? insuranceType;
  dynamic insuranceExpiry;
  dynamic insuranceImage;
  dynamic insuranceStatus;
  dynamic fitnessExpiry;
  dynamic fitnessImage;
  dynamic fitnessStatus;
  dynamic permitExpiry;
  dynamic permitImage;
  String? permitStatus;
  dynamic roadTaxExpiry;
  dynamic roadTaxImage;
  dynamic roadTaxStatus;
  dynamic pucImage;
  dynamic authorizationExpiry;
  String? authorizationImage;
  String? authorizationStatus;
  String? vehiclePicFront;
  String? vehiclePicBack;
  String? vehiclePicLeft;
  String? vehiclePicRight;
  String? rcImage;
  dynamic rcStatus;
  String? saleAgreementFirst;
  String? vehiclePicStatus;
  String? saleAgreementLast;
  String? vehicleName;
  String? brandName;
  String? colorName;
  String? fuelTypeName;
  String? vehicleTypeName;
  String? rcFrontImage;
  String? rcBackImage;
  dynamic saleAgreementStatus;
  dynamic approvedBy;
  dynamic status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic approvalStatus;

  VehicleModel(
      {this.vehiclesId,
      this.ownerId,
      this.fuelTypeId,
      this.saleAgreementStatus,
      this.status,
      this.pucStatus,
      this.pucImage,
      this.rcFrontImage,
      this.rcBackImage,
      this.saleAgreementLast,
      this.saleAgreementFirst,
      this.updatedAt,
      this.createdAt,
      this.createdBy,
      this.updatedBy,
      this.approvedBy,
      this.rcStatus,
       this.vehiclePicStatus,
      this.vehicleNameId,
      this.colorId,
      this.brandId,
      this.vehicleTypeId,
      this.rcImage,
      this.vehiclePicRight,
      this.vehiclePicLeft,
      this.vehiclePicBack,
      this.vehiclePicFront,
      this.authorizationStatus,
      this.authorizationImage,
      this.authorizationExpiry,
      this.roadTaxStatus,
      this.roadTaxImage,
      this.roadTaxExpiry,
      this.permitExpiry,
      this.fitnessStatus,
      this.fitnessImage,
      this.fitnessExpiry,
      this.insuranceStatus,
      this.insuranceImage,
      this.insuranceExpiry,
      this.insuranceType,
      this.insuranceCompany,
      this.puc,
      this.carrier,
      this.runningKms,
      this.acAvailable,
      this.registerYear,
      this.ccCapacity,
      this.vehicleNo,
      this.permitImage,
      this.permitStatus,
      this.approvalStatus,
      this.vehicleName,
      this.brandName,
      this.colorName,
      this.vehicleTypeName,
      this.fuelTypeName});

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        vehiclesId: json["vehicles_id"] == null ? null : json["vehicles_id"],
        permitStatus: json["permit_status"] == null ? null : json["permit_status"],
        pucStatus: json["puc_status"] == null ? null : json["puc_status"],
        approvalStatus:
            json["approval_status"] == null ? null : json["approval_status"],
        ownerId: json["owner_id"] == null ? null : json["owner_id"],
        vehicleNo: json["vehicle_no"] == null ? null : json["vehicle_no"],
        rcFrontImage: json["rc_front_image"] == null ? null : json["rc_front_image"],
        rcBackImage: json["rc_back_image"] == null ? null : json["rc_back_image"],
        pucImage: json["puc_image"] == null ? null : json["puc_image"],
        vehicleTypeId:
            json["vehicletype_id"] == null ? null : json["vehicletype_id"],
        brandId: json["brand_id"] == null ? null : json["brand_id"],
        colorId: json["color_id"] == null ? null : json["color_id"],
        vehicleNameId:
            json["vehicle_name_id"] == null ? null : json["vehicle_name_id"],
        ccCapacity: json["cc_capacity"] == null ? null : json["cc_capacity"],
        registerYear:
            json["register_year"] == null ? null : json["register_year"],
        acAvailable: json["ac_available"] == null ? null : json["ac_available"],
        runningKms: json["running_kms"] == null ? null : json["running_kms"],
        fuelTypeId: json["fuel_type_id"] == null ? null : json["fuel_type_id"],
        carrier: json["carrier"] == null ? null : json["carrier"],
        puc: json["puc"] == null ? null : json["puc"],
        vehiclePicStatus: json["vehicle_pic_status"] == null ? null : json["vehicle_pic_status"],
        insuranceCompany: json["insurance_company"] == null
            ? null
            : json["insurance_company"],
        insuranceType:
            json["insurance_type"] == null ? null : json["insurance_type"],
        insuranceExpiry:
            json["insurance_expiry"] == null ? null : json["insurance_expiry"],
        insuranceImage:
            json["insurance_image"] == null ? null : json["insurance_image"],
        insuranceStatus:
            json["insurance_status"] == null ? null : json["insurance_status"],
        fitnessExpiry:
            json["fitness_expiry"] == null ? null : json["fitness_expiry"],
        fitnessImage:
            json["fitness_image"] == null ? null : json["fitness_image"],
        fitnessStatus:
            json["fitness_status"] == null ? null : json["fitness_status"],
        permitExpiry:
            json["permit_expiry"] == null ? null : json["permit_expiry"],
        permitImage: json["permit_image"] == null ? null : json["permit_image"],
        roadTaxExpiry:
            json["roadtax_expiry"] == null ? null : json["roadtax_expiry"],
        roadTaxImage:
            json["roadtax_image"] == null ? null : json["roadtax_image"],
        roadTaxStatus:
            json["roadtax_status"] == null ? null : json["roadtax_status"],
        authorizationExpiry: json["authorization_expiry"] == null
            ? null
            : json["authorization_expiry"],
        authorizationImage: json["authorization_image"] == null
            ? null
            : json["authorization_image"],
        authorizationStatus: json["authorization_status"] == null
            ? null
            : json["authorization_status"],
        vehiclePicFront: json["vehicle_pic_front"] == null
            ? null
            : json["vehicle_pic_front"],
        vehiclePicBack:
            json["vehicle_pic_back"] == null ? null : json["vehicle_pic_back"],
        vehiclePicLeft:
            json["vehicle_pic_left"] == null ? null : json["vehicle_pic_left"],
        vehiclePicRight: json["vehicle_pic_right"] == null
            ? null
            : json["vehicle_pic_right"],
        rcImage: json["rc_image"] == null ? null : json["rc_image"],
        rcStatus: json["rc_status"] == null ? null : json["rc_status"],
        saleAgreementFirst: json["sale_agreement_first"] == null
            ? null
            : json["sale_agreement_first"],
        saleAgreementLast: json["sale_agreement_last"] == null
            ? null
            : json["sale_agreement_last"],
        saleAgreementStatus: json["sale_agreement_status"] == null
            ? null
            : json["sale_agreement_status"],
        approvedBy: json["approved_by"] == null ? null : json["approved_by"],
        status: json["status"] == null ? null : json["status"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        vehicleName: json["vehicle_name"] == null ? null : json["vehicle_name"],
        vehicleTypeName: json["vehicle_type_name"] == null
            ? null
            : json["vehicle_type_name"],
        colorName: json["color_name"] == null ? null : json["color_name"],
        fuelTypeName:
            json["fuel_type_name"] == null ? null : json["fuel_type_name"],
        brandName: json["brand_name"] == null ? null : json["brand_name"],
      );

  Map<String, dynamic> toJson() => {
        'vehicles_id': fuelTypeId,
        'owner_id': ownerId,
        'vehicle_no': vehicleNo,
        'vehicletype_id': vehicleTypeId,
        'brand_id': brandId,
        'fuel_type_id': fuelTypeId,
        'color_id': colorId,
        'vehicle_name_id': vehicleNameId,
        'cc_capacity': ccCapacity,
        'register_year': registerYear,
        'ac_available': acAvailable,
        'running_kms': runningKms,
        'fuel_type_id': fuelTypeId,
        'carrier': carrier,
        'rc_front_image': rcFrontImage,
        'rc_back_image': rcBackImage,
        'puc': puc,
        'puc_image': pucImage,
        'insurance_company': insuranceCompany,
        'insurance_type': insuranceType,
        'insurance_expiry': insuranceExpiry,
        'insurance_image': insuranceImage,
        'insurance_status': insuranceStatus,
        'fitness_expiry': fitnessExpiry,
        'fitness_image': fitnessImage,
        'fitnes_status': fitnessStatus,
        'permit_expiry': permitExpiry,
        'roadtax_expiry': roadTaxExpiry,
        'roadtax_image': roadTaxImage,
        'roadtax_status': roadTaxStatus,
        'authorization_expiry': authorizationExpiry,
        'authorization_image': authorizationImage,
        'authorization_status': authorizationStatus,
        'vehicle_pic_front': vehiclePicFront,
        'vehicle_pic_back': vehiclePicBack,
        'vehicle_pic_left': vehiclePicLeft,
        'vehicle_pic_right': vehiclePicRight,
        'rc_image': rcImage,
        'rc_status': rcStatus,
        'sale_agreement_first': saleAgreementFirst,
        'sale_agreement_last': saleAgreementLast,
        'approved_by': approvedBy,
        'status': status,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'vehicle_name': vehicleName,
        'vehicle_type_name': vehicleTypeName,
        'color_name': colorName,
        'fuel_type_name': fuelTypeName,
        'brand_name': brandName,
        'approval_status': approvalStatus
      };
}
