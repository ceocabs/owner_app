class OnlineOfflineDriversModel {
  dynamic driverId;
  String? name;
  dynamic mobileNo;
  dynamic whatsAppNumber;
  String? profileImage;
  String? activeStatus;
  dynamic vehicleType;
  dynamic vehicleNo;
  dynamic vehicleName;
  dynamic locationName;
  dynamic location;

  OnlineOfflineDriversModel(
      {this.driverId,
      this.name,
      this.mobileNo,
      this.whatsAppNumber,
      this.profileImage,
      this.activeStatus,
      this.vehicleType,
      this.vehicleNo,
      this.vehicleName,
      this.locationName,
      this.location});

  factory OnlineOfflineDriversModel.fromJson(Map<String, dynamic> json) =>
      OnlineOfflineDriversModel(
        driverId: json["driverId"] == null ? null : json["driverId"],
        name: json["name"] == null ? null : json["name"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        whatsAppNumber:
            json["whatsapp_number"] == null ? null : json["whatsapp_number"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        activeStatus:
            json["active_status"] == null ? null : json["active_status"],
        vehicleType:
            json["vehicle_type"] == null ? null : json["vehicle_type"],
        vehicleNo: json["vehicle_no"] == null ? null : json["vehicle_no"],
        vehicleName: json["vehicle_name"] == null ? null : json["vehicle_name"],
        locationName:
            json["locationName"] == null ? null : json["locationName"],
        location: json["location"] == null ? null : json["location"],
      );

  Map<String, dynamic> toJson() => {
        'driverId': driverId,
        'name': name,
        'mobile_no': mobileNo,
        'whatsapp_number': whatsAppNumber,
        'profile_image': profileImage,
        'active_status': activeStatus,
        'vehicle_type': vehicleType,
        'vehicle_no': vehicleNo,
        'vehicle_name': vehicleName,
        'locationName': locationName,
        'location': location,
      };
}
