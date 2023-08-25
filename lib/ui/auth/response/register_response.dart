class RegisterRequestModel {
  late String? firstName;
  late String? lastName;
  late String? email;
  late String? permanentAddress;
  late String? state;
  late String? city;
  late String? pinCode;
  late String? mobileNO;
  late String? whatsappNumber;
  late String? panCardNumber;
  late String? profileType;
  late String? referanceID;
  late String? aadharCardNumber;
  late String? deviceId;
  late String? deviceType;
  late String? ram;
  late String? processor;
  late String? deviceOs;
  late String? location;
  late String? deviceModel;
  late String? customersId;
  late String? manufacturer;
  late String? profileImage;
  late String? panCardImage;
  late String? aadharCardFrontImage;
  late String? aadharCardBackImage;

  RegisterRequestModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.permanentAddress,
      required this.state,
      required this.city,
      required this.pinCode,
      required this.mobileNO,
      required this.whatsappNumber,
      required this.panCardNumber,
      required this.aadharCardNumber,
      required this.deviceType,
      required this.deviceId,
      required this.deviceOs,
      required this.deviceModel,
      required this.manufacturer,
      required this.ram,
      required this.processor,
      required this.location,
      required this.customersId,
      required this.profileType,
      required this.referanceID,
      required this.panCardImage,
      required this.profileImage,
      required this.aadharCardFrontImage,
      required this.aadharCardBackImage});

  Map<String, dynamic> toMap() {
    return {
      'profile_type': profileType,
      'first_name': firstName,
      'last_name': lastName,
      'mobile_no': mobileNO,
      'whatsapp_number': whatsappNumber,
      'email_id': email,
      'city': city,
      'state': state,
      'permanent_address': permanentAddress,
      'pincode': pinCode,
      'adhaar_card_no': aadharCardNumber,
      'pancard_no': panCardNumber,
      "ram": ram,
      "device_model": deviceModel,
      "device_os": deviceOs,
      "device_id": deviceId,
      "location": "",
      "manufacturer": manufacturer,
      "customers_id": "",
      "profile_image": profileImage,
      "pancard_image": panCardImage,
      "adhaar_card_front_image": aadharCardFrontImage,
      "adhaar_card_back_image": aadharCardBackImage
    };
  }
}

class RegisterResponseModel {
  RegisterResponseModel({
    this.success,
    this.message,
    this.data,
  });

  dynamic success;
  dynamic message;
  dynamic data;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );
}
