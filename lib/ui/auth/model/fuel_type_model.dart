class FuelTypeModel {
  dynamic fuelTypeId;
  dynamic fuelTypeName;

  FuelTypeModel({
    this.fuelTypeId,
    this.fuelTypeName,
  });

  //UserDataModel.fromJson(Map<String, dynamic> json) : id = json['id'];

  factory FuelTypeModel.fromJson(Map<String, dynamic> json) => FuelTypeModel(
    fuelTypeId: json["fuel_types_id"] == null ? null : json["fuel_types_id"],
    fuelTypeName: json["fuel_type_name"] == null ? null : json["fuel_type_name"],
  );

  Map<String, dynamic> toJson() => {
    'fuel_types_id': fuelTypeId,
    'fuel_type_name': fuelTypeName,
  };
}
