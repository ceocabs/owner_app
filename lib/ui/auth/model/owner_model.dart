class OwnerModel {
  dynamic id;
  String? firstName;
  String? lastName;

  OwnerModel({this.id, this.firstName, this.lastName});



  factory OwnerModel.fromJson(Map<String, dynamic> json) => OwnerModel(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
      };
}
