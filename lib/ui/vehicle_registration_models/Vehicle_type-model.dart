class VehicleTypeModel {
  int? vehicleTypesId;
  String typeName;

  VehicleTypeModel({this.vehicleTypesId, required this.typeName});

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) =>
      VehicleTypeModel(
        vehicleTypesId:
        json["vehicle_types_id"] == null ? null : json["vehicle_types_id"],
        typeName: json["type_name"] == null ? null : json["type_name"],
      );

  Map<String, dynamic> toJson() => {
    'vehicle_types_id': vehicleTypesId,
    'type_name': typeName,
  };
}
