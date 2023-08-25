class VehicleApprovalStatusModel{

  int? vehiclesId;
  String? insuranceStatus;
  String? fitnessStatus;
  String? permitStatus;
  String? roadTaxStatus;
  String? authorizationStatus;
  String? vehiclePicStatus;
  String? rcStatus;
  String? saleAgreementStatus;
  String? approvalStatus;


  VehicleApprovalStatusModel({
    this.vehiclesId,
    this.insuranceStatus,
    this.fitnessStatus,
    this.permitStatus,
    this.roadTaxStatus,
    this.authorizationStatus,
    this.vehiclePicStatus,
    this.rcStatus,
    this.saleAgreementStatus,
    this.approvalStatus
});

  Map<String, dynamic> toMap() {
    return {
      'vehicles_id': vehiclesId,
      'insurance_status': insuranceStatus,
      'fitness_status': fitnessStatus,
      'permit_status': permitStatus,
      'roadtax_status': roadTaxStatus,
      'authorization_status': authorizationStatus,
      'vehicle_pic_status': vehiclePicStatus,
      'rc_status': rcStatus,
      'sale_agreement_status': saleAgreementStatus,
      'approval_status': approvalStatus,
    };
  }




}