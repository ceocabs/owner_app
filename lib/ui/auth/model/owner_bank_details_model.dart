class OwnerBankDetailsModel {
  String? ownerName;
  dynamic ownerMobileNo;
  String? ownerProfileImage;
  String? holderName;
  String? holderMobile;
  String? accountNo;
  String? ifscCode;
  String? accountType;
  String? cancleChequeImage;
  String? status;

  OwnerBankDetailsModel({
    this.ownerName,
    this.ownerMobileNo,
    this.ownerProfileImage,
    this.holderName,
    this.holderMobile,
    this.accountNo,
    this.ifscCode,
    this.accountType,
    this.cancleChequeImage,
    this.status,
  });

  factory OwnerBankDetailsModel.fromJson(Map<String, dynamic> json) =>
      OwnerBankDetailsModel(
        ownerName: json["owner_name"] == null ? null : json["owner_name"],
        ownerMobileNo:
            json["owner_mobile_no"] == null ? null : json["owner_mobile_no"],
        ownerProfileImage: json["owner_profile_image"] == null
            ? null
            : json["owner_profile_image"],
        holderName: json["holder_name"] == null ? null : json["holder_name"],
        holderMobile:
            json["holder_mobile"] == null ? null : json["holder_mobile"],
        accountNo: json["account_no"] == null ? null : json["account_no"],
        ifscCode: json["ifsc_code"] == null ? null : json["ifsc_code"],
        accountType: json["account_type"] == null ? null : json["account_type"],
        cancleChequeImage: json["cancle_cheque_image"] == null
            ? null
            : json["cancle_cheque_image"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        'owner_name': ownerName,
        'owner_mobile_no': ownerMobileNo,
        'owner_profile_image': ownerProfileImage,
        'holder_name': holderName,
        'holder_mobile': holderMobile,
        'account_no': accountNo,
        'ifsc_code': ifscCode,
        'account_type': accountType,
        'cancle_cheque_image': cancleChequeImage,
        'status': status,
      };
}
