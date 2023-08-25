class VehicleDetailsModel {
  dynamic vehicleId;
  dynamic ownerId;
  String? vehicleNo;
  dynamic vehicleTypeId;
  dynamic brandId;
  dynamic colorId;
  dynamic vehicleNameId;
  String? ccCapacity;
  String? registerYear;
  String? acAvailable;
  String? runningKms;
  dynamic fuelTypeId;
  String? carrier;
  String? puc;
  String? insuranceCompany;
  String? insuranceType;
  String? runningKm;
  String? insuranceExpiry;
  String? insuranceImage;
  String? insuranceStatus;
  String? fitnessExpiry;
  String? fitnessImage;
  String? fitnessStatus;
  String? permitExpiry;
  String? permitImage;
  String? permitStatus;
  String? roadTaxExpiry;
  String? roadTaxImage;
  String? roadTaxStatus;
  String? authorizationExpiry;
  String? authorizationImage;
  String? authorizationStatus;
  String? vehicleFrontPic;
  String? vehicleBackPic;
  String? vehicleLeftPic;
  String? vehicleRightPic;
  String? vehiclePicStatus;
  String? rcImage;
  String? rcStatus;
  String? saleAgreementFirst;
  String? saleAgreementLast;
  String? saleAgreementStatus;
  dynamic approvedBy;
  dynamic approvedData;
  String? approvalStatus;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;

  VehicleDetailsModel(
      {this.vehicleId,
      this.ownerId,
      this.vehicleNo,
      this.authorizationExpiry,
      this.roadTaxExpiry,
      this.permitExpiry,
      this.fitnessExpiry,
      this.insuranceExpiry,
      this.insuranceType,
      this.carrier,
      this.approvalStatus,
      this.saleAgreementStatus,
      this.rcStatus,
      this.vehiclePicStatus,
      this.authorizationStatus,
      this.roadTaxStatus,
      this.permitStatus,
      this.fitnessStatus,
      this.insuranceStatus,
      this.runningKm,
      this.acAvailable,
      this.registerYear,
      this.ccCapacity,
      this.vehicleNameId,
      this.fuelTypeId,
      this.vehicleTypeId,
      this.updatedAt,
      this.createdAt,
      this.permitImage,
      this.runningKms,
      this.puc,
      this.insuranceCompany,
      this.insuranceImage,
      this.fitnessImage,
      this.roadTaxImage,
      this.authorizationImage,
      this.rcImage,
      this.brandId,
      this.colorId,
      this.approvedBy,
      this.createdBy,
      this.saleAgreementFirst,
      this.saleAgreementLast,
      this.status,
      this.updatedBy,
      this.approvedData,
      this.vehicleBackPic,
      this.vehicleFrontPic,
      this.vehicleLeftPic,
      this.vehicleRightPic});

  factory VehicleDetailsModel.fromJson(Map<String, dynamic> json) =>
      VehicleDetailsModel(
        vehicleId: json["vehicles_id"] == null ? null : json["vehicles_id"],
        ownerId: json["owner_id"] == null ? null : json["owner_id"],
        vehicleNo: json["vehicle_no"] == null ? null : json["vehicle_no"],
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
        permitStatus:
            json["permit_status"] == null ? null : json["permit_status"],
        roadTaxExpiry:
            json["roadtax_expiry"] == null ? null : json["roadtax_expiry"],
        roadTaxImage:
            json["roadtax_image"] == null ? null : json["roadtax_image"],
        roadTaxStatus:
            json["roadtax_status"] == null ? null : json["roadtax_status"],
        authorizationExpiry: json["authorization_expiry"] == null
            ? null
            : json["authorization_expiry"],
        authorizationStatus: json["authorization_status"] == null
            ? null
            : json["authorization_status"],
        authorizationImage: json["authorization_image"] == null
            ? null
            : json["authorization_image"],
        vehicleFrontPic: json["vehicle_pic_front"] == null
            ? null
            : json["vehicle_pic_front"],
        vehicleBackPic:
            json["vehicle_pic_back"] == null ? null : json["vehicle_pic_back"],
        vehicleRightPic: json["vehicle_pic_right"] == null
            ? null
            : json["vehicle_pic_right"],
        vehicleLeftPic:
            json["vehicle_pic_left"] == null ? null : json["vehicle_pic_left"],
        vehiclePicStatus: json["vehicle_pic_status"] == null
            ? null
            : json["vehicle_pic_status"],
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
        approvedData:
            json["approved_date"] == null ? null : json["approved_date"],
        approvalStatus:
            json["approval_status"] == null ? null : json["approval_status"],
        status: json["status"] == null ? null : json["status"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        /* id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],*/
      );

  Map<String, dynamic> toJson() => {
        'vehicles_id': vehicleId,
        'owner_id': ownerId,
        'vehicle_no': vehicleNo,
        'vehicletype_id': vehicleTypeId,
        'brand_id': brandId,
        'color_id': colorId,
        'vehicle_name_id': vehicleNameId,
        'cc_capacity': ccCapacity,
        'register_year': registerYear,
        'ac_available': acAvailable,
        'running_kms': runningKms,
        'fuel_type_id': fuelTypeId,
        'carrier': carrier,
        'puc': puc,
        'insurance_company': insuranceCompany,
        'insurance_type': insuranceType,
        'insurance_expiry': insuranceExpiry,
        'insurance_image': insuranceImage,
        'insurance_status': insuranceStatus,
        'fitness_expiry': fitnessExpiry,
        'fitness_image': fitnessImage,
        'fitness_status': fitnessStatus,
        'permit_expiry': permitExpiry,
        'permit_image': permitImage,
        'permit_status': permitStatus,
        'roadtax_expiry': roadTaxExpiry,
        'roadtax_image': roadTaxImage,
        'roadtax_status': roadTaxStatus,
        'authorization_expiry': authorizationExpiry,
        'authorization_image': authorizationImage,
        'authorization_status': authorizationStatus,
        'vehicle_pic_front': vehicleFrontPic,
        'vehicle_pic_back': vehicleBackPic,
        'vehicle_pic_left': vehicleLeftPic,
        'vehicle_pic_right': vehicleRightPic,
        'vehicle_pic_status': vehiclePicStatus,
        'rc_image': rcImage,
        'rc_status': rcStatus,
        'sale_agreement_first': saleAgreementFirst,
        'sale_agreement_last': saleAgreementLast,
        'sale_agreement_status': saleAgreementStatus,
        'approved_by': approvedBy,
        'approved_date': approvedData,
        'approval_status': approvalStatus,
        'status': status,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
