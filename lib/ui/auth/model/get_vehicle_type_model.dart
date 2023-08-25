class GetVehicleTypeModel {
  dynamic vehicleTypeId;
  dynamic typeName;

  GetVehicleTypeModel({
    this.vehicleTypeId,
    this.typeName,
  });

  //UserDataModel.fromJson(Map<String, dynamic> json) : id = json['id'];

  factory GetVehicleTypeModel.fromJson(Map<String, dynamic> json) =>
      GetVehicleTypeModel(
        vehicleTypeId:
            json["vehicle_types_id"] == null ? null : json["vehicle_types_id"],
        typeName: json["type_name"] == null ? null : json["type_name"],
      );

  Map<String, dynamic> toJson() => {
        'vehicle_types_id': vehicleTypeId,
        'type_name': typeName,
      };
}
