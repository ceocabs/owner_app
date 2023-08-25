class GetVehicleByStatusModel {
  dynamic vehiclesId;
  dynamic vehicleNo;
  dynamic approvalStatus;
  dynamic brandName;

  GetVehicleByStatusModel(
      {this.vehiclesId, this.vehicleNo, this.approvalStatus, this.brandName});

  factory GetVehicleByStatusModel.fromJson(Map<String, dynamic> json) =>
      GetVehicleByStatusModel(
        vehiclesId: json["vehicles_id"] == null ? null : json["vehicles_id"],
        vehicleNo: json["vehicle_no"] == null ? null : json["vehicle_no"],
        brandName: json["brand_name"] == null ? null : json["brand_name"],
        approvalStatus:
            json["approval_status"] == null ? null : json["approval_status"],
      );

  Map<String, dynamic> toJson() => {
        'vehicles_id': vehiclesId,
        'vehicle_no': vehicleNo,
        'brand_name': brandName,
        'approval_status': approvalStatus,
      };
}
