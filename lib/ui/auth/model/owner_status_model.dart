class OwnerStatusModel {
  String? profileStatus;
  String? panStatus;
  String? licenseStatus;
  String? aadharStatus;
  String? approvalStatus;

  OwnerStatusModel(
      {this.profileStatus,
      this.panStatus,
      this.licenseStatus,
      this.aadharStatus,
      this.approvalStatus});

  factory OwnerStatusModel.fromJson(Map<String, dynamic> json) =>
      OwnerStatusModel(
        profileStatus:
            json["profile_status"] == null ? null : json["profile_status"],
        panStatus: json["pan_status"] == null ? null : json["pan_status"],
        licenseStatus:
            json["license_status"] == null ? null : json["license_status"],
        aadharStatus:
            json["aadhar_status"] == null ? null : json["aadhar_status"],
        approvalStatus:
            json["approval_status"] == null ? null : json["approval_status"],
      );

  Map<String, dynamic> toJson() => {
        'profile_status': profileStatus,
        'pan_status': panStatus,
        'license_status': licenseStatus,
        'aadhar_status': aadharStatus,
        'approval_status': approvalStatus,
      };
}
