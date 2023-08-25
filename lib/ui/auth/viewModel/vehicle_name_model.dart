class VehicleNameModel {
  dynamic vehicleNameId;
  String vehicleName;

  VehicleNameModel({
    this.vehicleNameId,
    required this.vehicleName,
  });





  factory VehicleNameModel.fromJson(Map<String, dynamic> json) =>
      VehicleNameModel(
        vehicleNameId:
        json["vehicle_name_id"] == null ? null : json["vehicle_name_id"],
        vehicleName: json["vehicle_name"] == null ? null : json["vehicle_name"],
      );

  Map<String, dynamic> toJson() => {
    'vehicle_name_id': vehicleNameId,
    'vehicle_name': vehicleName,
  };
}
